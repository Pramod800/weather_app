import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/unit_system.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/presentation/theme/app_theme.dart';
import 'package:weather_app/weather/presentation/widgets/weather_glyph.dart';

/// One row per day. The bars share one scale, so a warmer day sits further
/// right and a wider bar means a bigger swing between night and day.
class DailyForecastList extends StatelessWidget {
  const DailyForecastList({super.key, required this.days, required this.units});

  final List<DailyForecast> days;
  final UnitSystem units;

  @override
  Widget build(BuildContext context) {
    if (days.isEmpty) return const SizedBox.shrink();
    final coldest = days.map((d) => d.low).reduce(math.min);
    final warmest = days.map((d) => d.high).reduce(math.max);

    return Column(
      children: [
        for (final (i, day) in days.indexed) ...[
          if (i > 0) const Divider(),
          _DayRow(
            day: day,
            label: i == 0 ? 'Today' : DateFormat('EEE').format(day.date),
            units: units,
            coldest: coldest,
            warmest: warmest,
          ),
        ],
      ],
    );
  }
}

class _DayRow extends StatelessWidget {
  const _DayRow({
    required this.day,
    required this.label,
    required this.units,
    required this.coldest,
    required this.warmest,
  });

  final DailyForecast day;
  final String label;
  final UnitSystem units;
  final double coldest;
  final double warmest;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final numbers = text.titleMedium?.copyWith(
      fontFeatures: AppTheme.tabularFigures,
    );
    final chance = (day.precipitationChance * 100).round();
    final showChance = chance >= 20;
    final low = units.temperature(day.low);
    final high = units.temperature(day.high);

    return Semantics(
      label:
          '$label, low $low, high $high'
          '${showChance ? ', $chance percent chance of precipitation' : ''}',
      excludeSemantics: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            SizedBox(width: 56, child: Text(label, style: text.titleMedium)),
            WeatherGlyph(condition: day.condition, size: 28),
            SizedBox(
              width: 48,
              child: Text(
                showChance ? '$chance%' : '',
                textAlign: TextAlign.center,
                style: text.bodySmall?.copyWith(
                  color: AppTheme.rain,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: 36,
              child: Text(
                low,
                textAlign: TextAlign.end,
                style: numbers?.copyWith(color: AppTheme.muted),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _RangeBar(
                start: _fraction(day.low),
                end: _fraction(day.high),
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 36,
              child: Text(high, textAlign: TextAlign.end, style: numbers),
            ),
          ],
        ),
      ),
    );
  }

  double _fraction(double temperature) {
    final span = warmest - coldest;
    return span == 0 ? 0.5 : (temperature - coldest) / span;
  }
}

class _RangeBar extends StatelessWidget {
  const _RangeBar({required this.start, required this.end});

  final double start;
  final double end;

  static const _height = 6.0;

  /// Keeps a day with almost no swing visible as a dot.
  static const _minWidth = 10.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final barWidth = math.max(_minWidth, (end - start) * width);
        final left = math.min(start * width, width - barWidth);
        return SizedBox(
          height: _height,
          child: Stack(
            children: [
              const Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.hairline,
                    borderRadius: BorderRadius.all(
                      Radius.circular(_height / 2),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: left,
                width: barWidth,
                top: 0,
                bottom: 0,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppTheme.rain, AppTheme.sun],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(_height / 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
