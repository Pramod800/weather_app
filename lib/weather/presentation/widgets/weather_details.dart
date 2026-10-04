import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/unit_system.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/presentation/theme/app_theme.dart';

/// The secondary readings, two to a row.
class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key, required this.report, required this.units});

  final WeatherReport report;
  final UnitSystem units;

  @override
  Widget build(BuildContext context) {
    final current = report.current;
    final airQuality = report.airQuality;
    final today = report.daily.firstOrNull;
    final uvIndex = today?.uvIndexMax;

    final cells = <Widget>[
      _Reading(
        label: 'Wind',
        value:
            '${units.windSpeed(current.windSpeed)} '
            '${compassPoint(current.windDegrees)}',
        trailing: Transform.rotate(
          // The arrow points where the wind is going, opposite its origin.
          angle: (current.windDegrees + 180) * math.pi / 180,
          child: const Icon(Icons.navigation_rounded, size: 16),
        ),
      ),
      _Reading(label: 'Humidity', value: '${current.humidity}%'),
      _Reading(
        label: 'UV index',
        value: uvIndex == null
            ? 'No data'
            : '${uvIndex.round()} ${_uvLevel(uvIndex)}',
      ),
      _Reading(
        label: 'Rain today',
        value: units.precipitation(today?.precipitationSum ?? 0),
      ),
      _Reading(label: 'Visibility', value: units.distance(current.visibility)),
      _Reading(label: 'Pressure', value: units.pressure(current.pressure)),
      _Reading(label: 'Cloud cover', value: '${current.cloudiness}%'),
      if (airQuality != null)
        _Reading(label: 'Air quality', value: airQuality.label)
      else
        const SizedBox.shrink(),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var row = 0; row < cells.length; row += 2) ...[
          if (row > 0) const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: cells[row]),
                const SizedBox(width: 16),
                Expanded(child: cells[row + 1]),
              ],
            ),
          ),
        ],
        if (airQuality != null) _AirQualityScale(airQuality: airQuality),
      ],
    );
  }
}

/// The World Health Organization's exposure categories.
String _uvLevel(double index) => switch (index.round()) {
  <= 2 => 'Low',
  <= 5 => 'Moderate',
  <= 7 => 'High',
  <= 10 => 'Very high',
  _ => 'Extreme',
};

class _Reading extends StatelessWidget {
  const _Reading({required this.label, required this.value, this.trailing});

  final String label;
  final String value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: text.bodySmall),
          const SizedBox(height: 2),
          Row(
            children: [
              Flexible(
                child: Text(
                  value,
                  style: text.titleMedium?.copyWith(
                    fontFeatures: AppTheme.tabularFigures,
                  ),
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 6),
                ExcludeSemantics(child: trailing),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// Five steps from good to very poor, with the current one lit.
class _AirQualityScale extends StatelessWidget {
  const _AirQualityScale({required this.airQuality});

  final AirQuality airQuality;

  static const _colors = [
    Color(0xFF7BD88F),
    Color(0xFFC8DD6B),
    Color(0xFFFFC94A),
    Color(0xFFFF9A52),
    Color(0xFFF2637E),
  ];

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final step = airQuality.index.clamp(1, _colors.length);

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExcludeSemantics(
            child: Row(
              children: [
                for (var i = 1; i <= _colors.length; i++) ...[
                  if (i > 1) const SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: i == step
                            ? _colors[i - 1]
                            : _colors[i - 1].withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Fine particles (PM2.5): ${airQuality.pm25.round()} µg/m³',
            style: text.bodySmall,
          ),
        ],
      ),
    );
  }
}
