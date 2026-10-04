import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/unit_system.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/presentation/theme/app_theme.dart';
import 'package:weather_app/weather/presentation/widgets/weather_glyph.dart';

/// The first thing on the screen: how warm it is and what the sky is doing.
class CurrentSummary extends StatelessWidget {
  const CurrentSummary({
    super.key,
    required this.report,
    required this.units,
    required this.now,
  });

  final WeatherReport report;
  final UnitSystem units;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final current = report.current;
    final localNow = report.localTime(now);
    final dateLine =
        '${DateFormat('EEEE, d MMMM').format(localNow)}, '
        '${DateFormat.jm().format(localNow)}';
    final temperature = units.temperatureValue(current.temperature);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dateLine, style: text.bodyMedium?.copyWith(color: AppTheme.muted)),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Semantics(
                label: '$temperature degrees',
                excludeSemantics: true,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$temperature', style: text.displayLarge),
                      Padding(
                        padding: const EdgeInsets.only(top: 18, left: 4),
                        child: Text(
                          units.temperatureSymbol,
                          style: text.headlineMedium?.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.muted,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            WeatherGlyph(
              condition: current.condition,
              isDay: current.isDay,
              size: 108,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(current.description, style: text.titleLarge),
        const SizedBox(height: 2),
        Text(
          'Feels like ${units.temperature(current.feelsLike)}',
          style: text.bodyLarge?.copyWith(color: AppTheme.muted),
        ),
      ],
    );
  }
}
