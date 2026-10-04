import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:weather_app/weather/domain/entities/weather_condition.dart';
import 'package:weather_app/weather/presentation/theme/app_theme.dart';

/// A flat, hand-drawn weather symbol that stays crisp at any size.
/// Decorative: the condition is always also given as text nearby.
class WeatherGlyph extends StatelessWidget {
  const WeatherGlyph({
    super.key,
    required this.condition,
    this.isDay = true,
    this.size = 28,
  });

  final WeatherCondition condition;
  final bool isDay;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: SizedBox.square(
        dimension: size,
        child: CustomPaint(painter: _GlyphPainter(condition, isDay)),
      ),
    );
  }
}

class _GlyphPainter extends CustomPainter {
  const _GlyphPainter(this.condition, this.isDay);

  final WeatherCondition condition;
  final bool isDay;

  static const _cloud = Color(0xFFFFFFFF);
  static const _backCloud = Color(0xFFC3CEE0);

  @override
  void paint(Canvas canvas, Size size) {
    // Everything below is drawn in a 1x1 box.
    canvas.scale(size.shortestSide);

    const rainCloud = Rect.fromLTWH(0.12, 0.12, 0.76, 0.44);
    switch (condition) {
      case WeatherCondition.clear:
        _celestial(canvas, const Offset(0.5, 0.5), isDay ? 0.21 : 0.3);
      case WeatherCondition.partlyCloudy:
        _celestial(canvas, const Offset(0.66, 0.34), isDay ? 0.15 : 0.2);
        _drawCloud(canvas, const Rect.fromLTWH(0.06, 0.42, 0.72, 0.42), _cloud);
      case WeatherCondition.cloudy:
        _drawCloud(
          canvas,
          const Rect.fromLTWH(0.36, 0.2, 0.58, 0.36),
          _backCloud,
        );
        _drawCloud(canvas, const Rect.fromLTWH(0.06, 0.38, 0.74, 0.44), _cloud);
      case WeatherCondition.fog:
        final paint = _stroke(_cloud.withValues(alpha: 0.9), 0.075);
        canvas
          ..drawLine(const Offset(0.16, 0.34), const Offset(0.78, 0.34), paint)
          ..drawLine(const Offset(0.24, 0.51), const Offset(0.88, 0.51), paint)
          ..drawLine(const Offset(0.14, 0.68), const Offset(0.66, 0.68), paint);
      case WeatherCondition.drizzle:
        _drawCloud(canvas, rainCloud, _cloud);
        final paint = _stroke(AppTheme.rain, 0.055);
        for (final (x, y) in const [(0.34, 0.7), (0.52, 0.8), (0.7, 0.7)]) {
          canvas.drawLine(Offset(x, y), Offset(x - 0.025, y + 0.08), paint);
        }
      case WeatherCondition.rain:
        _drawCloud(canvas, rainCloud, _cloud);
        final paint = _stroke(AppTheme.rain, 0.055);
        for (final x in const [0.34, 0.52, 0.7]) {
          canvas.drawLine(Offset(x, 0.68), Offset(x - 0.07, 0.9), paint);
        }
      case WeatherCondition.snow:
        _drawCloud(canvas, rainCloud, _cloud);
        final paint = Paint()..color = _cloud;
        for (final (x, y) in const [(0.32, 0.72), (0.5, 0.86), (0.68, 0.72)]) {
          canvas.drawCircle(Offset(x, y), 0.045, paint);
        }
      case WeatherCondition.thunderstorm:
        _drawCloud(canvas, rainCloud, _cloud);
        final bolt = Path()
          ..moveTo(0.55, 0.54)
          ..lineTo(0.39, 0.77)
          ..lineTo(0.5, 0.77)
          ..lineTo(0.43, 0.97)
          ..lineTo(0.65, 0.7)
          ..lineTo(0.53, 0.7)
          ..lineTo(0.61, 0.54)
          ..close();
        canvas.drawPath(bolt, Paint()..color = AppTheme.sun);
    }
  }

  void _celestial(Canvas canvas, Offset center, double radius) {
    if (isDay) {
      _drawSun(canvas, center, radius);
    } else {
      _drawMoon(canvas, center, radius);
    }
  }

  void _drawSun(Canvas canvas, Offset center, double radius) {
    canvas.drawCircle(center, radius, Paint()..color = AppTheme.sun);
    final rays = _stroke(AppTheme.sun, radius * 0.3);
    for (var i = 0; i < 8; i++) {
      final direction = Offset.fromDirection(i * math.pi / 4);
      canvas.drawLine(
        center + direction * radius * 1.5,
        center + direction * radius * 1.95,
        rays,
      );
    }
  }

  void _drawMoon(Canvas canvas, Offset center, double radius) {
    final disc = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));
    final shadow = Path()
      ..addOval(
        Rect.fromCircle(
          center: center + Offset(radius * 0.5, -radius * 0.3),
          radius: radius * 0.85,
        ),
      );
    canvas.drawPath(
      Path.combine(PathOperation.difference, disc, shadow),
      Paint()..color = AppTheme.moon,
    );
  }

  void _drawCloud(Canvas canvas, Rect box, Color color) {
    final w = box.width;
    final h = box.height;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(box.left, box.top + h * 0.45, w, h * 0.55),
          Radius.circular(h * 0.275),
        ),
      )
      ..addOval(
        Rect.fromCircle(
          center: Offset(box.left + w * 0.38, box.top + h * 0.4),
          radius: h * 0.36,
        ),
      )
      ..addOval(
        Rect.fromCircle(
          center: Offset(box.left + w * 0.66, box.top + h * 0.52),
          radius: h * 0.27,
        ),
      );
    canvas.drawPath(path, Paint()..color = color);
  }

  Paint _stroke(Color color, double width) => Paint()
    ..color = color
    ..strokeWidth = width
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke;

  @override
  bool shouldRepaint(_GlyphPainter oldDelegate) =>
      oldDelegate.condition != condition || oldDelegate.isDay != isDay;
}
