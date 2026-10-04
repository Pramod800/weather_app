import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/utils/unit_system.dart';
import 'package:weather_app/weather/domain/entities/place.dart';

/// What the app was showing when it was last open.
typedef Selection = ({Place place, bool followsLocation});

/// Everything the app keeps on the device: cached weather responses, saved
/// and recent places, the last selection and the unit preference.
class LocalStorage {
  LocalStorage(this._prefs);

  final SharedPreferences _prefs;

  static const _reportPrefix = 'report.';
  static const _reportIndexKey = 'report_index';
  static const _savedKey = 'saved_places';
  static const _recentKey = 'recent_places';
  static const _selectionKey = 'selection';
  static const _unitsKey = 'units';

  static const maxCachedReports = 12;
  static const maxRecentPlaces = 6;

  // Cached reports ---------------------------------------------------------

  Map<String, dynamic>? readReport(String placeId) =>
      _readMap('$_reportPrefix$placeId');

  /// Stores the raw responses for a place and evicts the least recently
  /// written entry once more than [maxCachedReports] are held.
  Future<void> writeReport(String placeId, Map<String, dynamic> raw) async {
    await _prefs.setString('$_reportPrefix$placeId', jsonEncode(raw));

    final index = _prefs.getStringList(_reportIndexKey) ?? [];
    index
      ..remove(placeId)
      ..insert(0, placeId);
    while (index.length > maxCachedReports) {
      await _prefs.remove('$_reportPrefix${index.removeLast()}');
    }
    await _prefs.setStringList(_reportIndexKey, index);
  }

  // Places -----------------------------------------------------------------

  List<Place> readSavedPlaces() => _readPlaces(_savedKey);

  Future<void> writeSavedPlaces(List<Place> places) =>
      _writePlaces(_savedKey, places);

  List<Place> readRecentPlaces() => _readPlaces(_recentKey);

  Future<void> writeRecentPlaces(List<Place> places) =>
      _writePlaces(_recentKey, places);

  // Selection --------------------------------------------------------------

  Selection? readSelection() {
    final map = _readMap(_selectionKey);
    if (map == null) return null;
    try {
      return (
        place: Place.fromJson(map['place'] as Map<String, dynamic>),
        followsLocation: map['followsLocation'] as bool? ?? false,
      );
    } on Object {
      return null;
    }
  }

  Future<void> writeSelection(Place place, {required bool followsLocation}) {
    return _prefs.setString(
      _selectionKey,
      jsonEncode({'place': place.toJson(), 'followsLocation': followsLocation}),
    );
  }

  // Units ------------------------------------------------------------------

  UnitSystem readUnits() {
    final name = _prefs.getString(_unitsKey);
    return UnitSystem.values.asNameMap()[name] ?? UnitSystem.metric;
  }

  Future<void> writeUnits(UnitSystem units) =>
      _prefs.setString(_unitsKey, units.name);

  // Helpers ----------------------------------------------------------------

  /// A corrupt entry reads as absent rather than crashing the app.
  Map<String, dynamic>? _readMap(String key) {
    final text = _prefs.getString(key);
    if (text == null) return null;
    try {
      return jsonDecode(text) as Map<String, dynamic>;
    } on Object {
      return null;
    }
  }

  List<Place> _readPlaces(String key) {
    final text = _prefs.getString(key);
    if (text == null) return [];
    try {
      return [
        for (final item in jsonDecode(text) as List<dynamic>)
          Place.fromJson(item as Map<String, dynamic>),
      ];
    } on Object {
      return [];
    }
  }

  Future<void> _writePlaces(String key, List<Place> places) {
    return _prefs.setString(
      key,
      jsonEncode([for (final place in places) place.toJson()]),
    );
  }
}
