enum FailureType {
  network,
  timeout,
  notFound,
  unauthorized,
  rateLimited,
  server,
  missingApiKey,
  locationServiceDisabled,
  locationDenied,
  locationDeniedForever,
  unknown,
}

/// Everything that can go wrong between the UI and the weather service,
/// with copy the UI can show as is.
class Failure implements Exception {
  const Failure(this.type);

  final FailureType type;

  bool get isLocationProblem => switch (type) {
    FailureType.locationServiceDisabled ||
    FailureType.locationDenied ||
    FailureType.locationDeniedForever => true,
    _ => false,
  };

  /// Whether the fix lives in the device or app settings rather than a retry.
  bool get needsSettings =>
      type == FailureType.locationServiceDisabled ||
      type == FailureType.locationDeniedForever;

  String get title => switch (type) {
    FailureType.network => 'No connection',
    FailureType.timeout => 'The request timed out',
    FailureType.notFound => 'Place not found',
    FailureType.unauthorized => 'API key rejected',
    FailureType.rateLimited => 'Too many requests',
    FailureType.server => 'Weather service unavailable',
    FailureType.missingApiKey => 'API key missing',
    FailureType.locationServiceDisabled => 'Location is turned off',
    FailureType.locationDenied => 'Location access needed',
    FailureType.locationDeniedForever => 'Location access blocked',
    FailureType.unknown => 'Something went wrong',
  };

  String get message => switch (type) {
    FailureType.network => 'Check your internet connection, then try again.',
    FailureType.timeout =>
      'The weather service took too long to answer. Try again.',
    FailureType.notFound =>
      'There is no weather data for this place. Search for a nearby city.',
    FailureType.unauthorized =>
      'OpenWeather rejected the API key. Check the key in env.json.',
    FailureType.rateLimited =>
      'The request limit was reached. Wait a minute, then try again.',
    FailureType.server =>
      'OpenWeather is having trouble right now. Try again in a moment.',
    FailureType.missingApiKey =>
      'Add OPENWEATHER_API_KEY to env.json and run with '
          '--dart-define-from-file=env.json.',
    FailureType.locationServiceDisabled =>
      'Turn on location in your device settings, or search for a place.',
    FailureType.locationDenied =>
      'Allow location access to see the weather where you are, '
          'or search for a place.',
    FailureType.locationDeniedForever =>
      'Location access is blocked for this app. Allow it in settings, '
          'or search for a place.',
    FailureType.unknown => 'Try again in a moment.',
  };

  @override
  bool operator ==(Object other) => other is Failure && other.type == type;

  @override
  int get hashCode => type.hashCode;

  @override
  String toString() => 'Failure(${type.name})';
}
