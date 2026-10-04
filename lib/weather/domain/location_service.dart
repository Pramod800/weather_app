typedef Coordinates = ({double latitude, double longitude});

abstract interface class LocationService {
  /// The device's position, asking for permission when needed.
  ///
  /// Throws a `Failure` describing why the position is unavailable.
  Future<Coordinates> currentCoordinates();

  /// Opens the settings page where the user can fix [serviceDisabled]
  /// (device location off) or a blocked permission. Returns false when the
  /// platform has no such page.
  Future<bool> openSettings({required bool serviceDisabled});
}
