class Place {
  const Place({
    required this.name,
    required this.latitude,
    required this.longitude,
    this.country,
    this.state,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
    name: json['name'] as String? ?? '',
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
    country: json['country'] as String?,
    state: json['state'] as String?,
  );

  /// Empty until the weather service has named the coordinates.
  final String name;
  final double latitude;
  final double longitude;
  final String? country;
  final String? state;

  /// Coordinates rounded to about a kilometre, so the same city keeps the
  /// same cache entry and saved-place identity.
  String get id =>
      '${latitude.toStringAsFixed(2)},${longitude.toStringAsFixed(2)}';

  /// "Bagmati, NP", or whichever of the two parts is known.
  String get region => [
    if (state != null && state!.isNotEmpty) state!,
    if (country != null && country!.isNotEmpty) country!,
  ].join(', ');

  Place copyWith({String? name, String? country}) => Place(
    name: name ?? this.name,
    latitude: latitude,
    longitude: longitude,
    country: country ?? this.country,
    state: state,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'latitude': latitude,
    'longitude': longitude,
    'country': country,
    'state': state,
  };

  @override
  bool operator ==(Object other) => other is Place && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Place($name, $id)';
}
