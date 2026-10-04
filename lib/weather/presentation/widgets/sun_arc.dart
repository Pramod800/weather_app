import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/weather/domain/entities/sun_clock.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/presentation/theme/app_theme.dart';

/// The sun's path from sunrise to sunset, with the sun where it is now.
class SunArc extends StatelessWidget {
  const SunArc({super.key, required this.report, required this.clock});

  final WeatherReport report;
  final SunClock clock;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final time = DateFormat.jm();
    final sunrise = time.format(report.localTime(report.current.sunrise));
    final sunset = time.format(report.localTime(report.current.sunset));
    final caption = clock.isDaylight
        ? 'Sunset in ${_describe(clock.untilSunset)}'
        : 'Sunrise in ${_describe(clock.untilSunrise)}';
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    return Semantics(
      label: 'Sunrise $sunrise, sunset $sunset. $caption.',
      excludeSemantics: true,
      child: Column(
        children: [
          SizedBox(
            height: 92,
            width: double.infinity,
            // The sun travels to its position once, when the report appears.
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: clock.progress),
              duration: reduceMotion
                  ? Duration.zero
                  : const Duration(milliseconds: 1400),
              curve: Curves.easeOutCubic,
              builder: (context, progress, _) => CustomPaint(
                painter: _SunArcPainter(
                  progress: progress,
                  showSun: clock.isDaylight,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Flexible thirds, so large text wraps instead of overflowing.
              Expanded(
                flex: 2,
                child: _SunTime(label: 'Sunrise', time: sunrise),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    caption,
                    textAlign: TextAlign.center,
                    style: text.bodySmall,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: _SunTime(label: 'Sunset', time: sunset, alignEnd: true),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String _describe(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    return hours > 0 ? '$hours h $minutes min' : '$minutes min';
  }
}

class _SunTime extends StatelessWidget {
  const _SunTime({
    required this.label,
    required this.time,
    this.alignEnd = false,
  });

  final String label;
  final String time;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: alignEnd
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(label, style: text.bodySmall),
        Text(
          time,
          textAlign: alignEnd ? TextAlign.end : TextAlign.start,
          style: text.titleMedium?.copyWith(
            fontFeatures: AppTheme.tabularFigures,
          ),
        ),
      ],
    );
  }
}

class _SunArcPainter extends CustomPainter {
  const _SunArcPainter({required this.progress, required this.showSun});

  final double progress;
  final bool showSun;

  static const _inset = 14.0;
  static const _apex = 14.0;

  @override
  void paint(Canvas canvas, Size size) {
    final horizon = size.height - 6;
    final start = Offset(_inset, horizon);
    final end = Offset(size.width - _inset, horizon);
    // A quadratic curve peaks halfway between its ends and its control point.
    final control = Offset(size.width / 2, 2 * _apex - horizon);

    Offset pointAt(double t) {
      final u = 1 - t;
      return start * (u * u) + control * (2 * u * t) + end * (t * t);
    }

    canvas.drawLine(
      Offset(0, horizon),
      Offset(size.width, horizon),
      Paint()
        ..color = AppTheme.hairline
        ..strokeWidth = 1,
    );

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..quadraticBezierTo(control.dx, control.dy, end.dx, end.dy);
    final dashes = Paint()
      ..color = Colors.white.withValues(alpha: 0.4)
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    for (final metric in path.computeMetrics()) {
      for (var distance = 0.0; distance < metric.length; distance += 9) {
        canvas.drawPath(metric.extractPath(distance, distance + 3), dashes);
      }
    }

    if (!showSun) return;

    const steps = 48;
    final travelled = Path()..moveTo(start.dx, start.dy);
    for (var i = 1; i <= steps; i++) {
      final point = pointAt(progress * i / steps);
      travelled.lineTo(point.dx, point.dy);
    }
    canvas.drawPath(
      travelled,
      Paint()
        ..color = AppTheme.sun
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );

    final sun = pointAt(progress);
    canvas
      ..drawCircle(
        sun,
        16,
        Paint()..color = AppTheme.sun.withValues(alpha: 0.25),
      )
      ..drawCircle(sun, 8, Paint()..color = AppTheme.sun);
  }

  @override
  bool shouldRepaint(_SunArcPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.showSun != showSun;
}
