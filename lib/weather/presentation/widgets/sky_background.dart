import 'package:flutter/material.dart';
import 'package:weather_app/weather/presentation/theme/sky_palette.dart';

/// Fills the screen with the sky and fades between skies when the place or
/// the weather changes.
class SkyBackground extends StatelessWidget {
  const SkyBackground({super.key, required this.palette, required this.child});

  final SkyPalette palette;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    return AnimatedContainer(
      duration: reduceMotion
          ? Duration.zero
          : const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(gradient: palette.gradient),
      child: child,
    );
  }
}
