import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/unit_system.dart';
import 'package:weather_app/weather/data/data_source/local_storage.dart';

class SettingsCubit extends Cubit<UnitSystem> {
  SettingsCubit(this._storage) : super(_storage.readUnits());

  final LocalStorage _storage;

  Future<void> setUnits(UnitSystem units) async {
    emit(units);
    await _storage.writeUnits(units);
  }
}
