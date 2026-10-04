import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/unit_system.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/presentation/theme/app_theme.dart';
import 'package:weather_app/weather/presentation/widgets/weather_glyph.dart';

/// The next 24 hours as one temperature curve, so the shape of the day
/// reads at a glance. Scrolls sideways on narrow screens.
class HourlyForecastChart extends StatelessWidget {
  const HourlyForecastChart({
    super.key,
    required this.report,
    required this.units,
    this.edgePadding = 20,
  });

  final WeatherReport report;
  final UnitSystem units;

  /// Space before the first and after the last hour.
  final double edgePadding;

  static const _slotWidth = 64.0;
  static const _labelZone = 30.0;
  static const _curveHeight = 48.0;
  static const _curveGap = 16.0;

  @override
  Widget build(BuildContext context) {
    final hours = report.hourly;
    final temperatures = hours.map((h) => h.temperature);
    final low = temperatures.reduce(math.min);
    final span = temperatures.reduce(math.max) - low;

    final points = [
      for (final (i, hour) in hours.indexed)
        Offset(
          _slotWidth * (i + 0.5),
          _labelZone +
              (span == 0 ? 0.5 : 1 - (hour.temperature - low) / span) *
                  _curveHeight,
        ),
    ];
    final baseline = _labelZone + _curveHeight + _curveGap;

    return MediaQuery.withClampedTextScaling(
      maxScaleFactor: 1.3,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // Half a slot of the padding is already inside the first column.
        padding: EdgeInsets.symmetric(
          horizontal: math.max(0, edgePadding - 12),
        ),
        // The curve is painted behind the columns; each column reserves the
        // curve's height at its top and puts its captions underneath.
        child: CustomPaint(
          painter: _CurvePainter(points: points, baseline: baseline),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final (i, hour) in hours.indexed)
                SizedBox(
                  width: _slotWidth,
                  child: _HourColumn(
                    label: i == 0
                        ? 'Now'
                        : DateFormat('j').format(report.localTime(hour.time)),
                    temperature: units.temperature(hour.temperature),
                    hour: hour,
                    temperatureBottom: baseline - points[i].dy + 8,
                    curveZoneHeight: baseline,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HourColumn extends StatelessWidget {
  const _HourColumn({
    required this.label,
    required this.temperature,
    required this.hour,
    required this.temperatureBottom,
    required this.curveZoneHeight,
  });

  final String label;
  final String temperature;
  final HourlyForecast hour;

  /// Distance from the bottom of the curve zone to the temperature label,
  /// which sits just above this hour's point on the curve.
  final double temperatureBottom;
  final double curveZoneHeight;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final chance = (hour.precipitationChance * 100).round();
    final showChance = chance >= 20;

    return Semantics(
      label:
          '$label, $temperature'
          '${showChance ? ', $chance percent chance of precipitation' : ''}',
      excludeSemantics: true,
      child: Column(
        children: [
          SizedBox(
            height: curveZoneHeight,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: temperatureBottom,
                  child: Text(
                    temperature,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: text.titleMedium?.copyWith(
                      fontFeatures: AppTheme.tabularFigures,
                    ),
                  ),
                ),
              ],
            ),
          ),
          WeatherGlyph(condition: hour.condition, isDay: hour.isDay, size: 28),
          const SizedBox(height: 2),
          Text(
            showChance ? '$chance%' : '',
            maxLines: 1,
            style: text.bodySmall?.copyWith(
              color: AppTheme.rain,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(label, maxLines: 1, style: text.bodySmall),
        ],
      ),
    );
  }
}

class _CurvePainter extends CustomPainter {
  const _CurvePainter({required this.points, required this.baseline});

  final List<Offset> points;
  final double baseline;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    final curve = Path()..moveTo(points.first.dx, points.first.dy);
    for (var i = 1; i < points.length; i++) {
      final from = points[i - 1];
      final to = points[i];
      final middle = (from.dx + to.dx) / 2;
      curve.cubicTo(middle, from.dy, middle, to.dy, to.dx, to.dy);
    }

    final area = Path.from(curve)
      ..lineTo(points.last.dx, baseline)
      ..lineTo(points.first.dx, baseline)
      ..close();
    canvas.drawPath(
      area,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withValues(alpha: 0.2),
            Colors.white.withValues(alpha: 0),
          ],
        ).createShader(Rect.fromLTRB(0, 0, size.width, baseline)),
    );

    canvas.drawPath(
      curve,
      Paint()
        ..color = Colors.white
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );

    final dot = Paint()..color = Colors.white;
    for (final point in points.skip(1)) {
      canvas.drawCircle(point, 3, dot);
    }
    // "Now" gets the sun's colour so the starting point is easy to find.
    canvas
      ..drawCircle(
        points.first,
        7,
        Paint()..color = AppTheme.sun.withValues(alpha: 0.3),
      )
      ..drawCircle(points.first, 4.5, Paint()..color = AppTheme.sun);
  }

  @override
  bool shouldRepaint(_CurvePainter oldDelegate) =>
      oldDelegate.baseline != baseline || oldDelegate.points != points;
}
