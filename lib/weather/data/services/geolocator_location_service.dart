import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/weather/domain/location_service.dart';

class GeolocatorLocationService implements LocationService {
  @override
  Future<Coordinates> currentCoordinates() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        throw const Failure(FailureType.locationServiceDisabled);
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied) {
        throw const Failure(FailureType.locationDenied);
      }
      if (permission == LocationPermission.deniedForever) {
        throw const Failure(FailureType.locationDeniedForever);
      }

      // City-level accuracy is plenty for weather and gets a fix much
      // faster than GPS.
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.low,
          timeLimit: Duration(seconds: 15),
        ),
      );
      return (latitude: position.latitude, longitude: position.longitude);
    } on Failure {
      rethrow;
    } on TimeoutException {
      throw const Failure(FailureType.timeout);
    } on LocationServiceDisabledException {
      throw const Failure(FailureType.locationServiceDisabled);
    } on PermissionDeniedException {
      throw const Failure(FailureType.locationDenied);
    } on Object {
      throw const Failure(FailureType.unknown);
    }
  }

  @override
  Future<bool> openSettings({required bool serviceDisabled}) async {
    if (kIsWeb) return false;
    try {
      return serviceDisabled
          ? await Geolocator.openLocationSettings()
          : await Geolocator.openAppSettings();
    } on Object {
      return false;
    }
  }
}
