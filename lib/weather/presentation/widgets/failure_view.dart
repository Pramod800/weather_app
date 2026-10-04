import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/weather/presentation/theme/app_theme.dart';

/// Full-screen explanation of why there is no weather to show, with the
/// actions that can fix it.
class FailureView extends StatelessWidget {
  const FailureView({
    super.key,
    required this.failure,
    required this.onRetry,
    required this.onSearch,
    required this.onOpenSettings,
  });

  final Failure failure;
  final VoidCallback onRetry;
  final VoidCallback onSearch;
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    // Browsers have no settings page the app can open.
    final canOpenSettings = failure.needsSettings && !kIsWeb;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(_icon, size: 40, color: AppTheme.muted),
              const SizedBox(height: 20),
              Text(failure.title, style: text.headlineMedium),
              const SizedBox(height: 8),
              Text(
                failure.message,
                style: text.bodyLarge?.copyWith(color: AppTheme.muted),
              ),
              const SizedBox(height: 28),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (canOpenSettings)
                    FilledButton(
                      onPressed: onOpenSettings,
                      child: const Text('Open settings'),
                    )
                  else
                    FilledButton(
                      onPressed: onRetry,
                      child: Text(
                        failure.type == FailureType.locationDenied
                            ? 'Allow location'
                            : 'Try again',
                      ),
                    ),
                  TextButton(
                    onPressed: onSearch,
                    child: const Text('Search for a place'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData get _icon {
    if (failure.isLocationProblem) return Icons.location_off_rounded;
    return switch (failure.type) {
      FailureType.network || FailureType.timeout => Icons.wifi_off_rounded,
      _ => Icons.cloud_off_rounded,
    };
  }
}
