import 'package:flutter/material.dart';

/// Placeholder in the shape of the weather screen, shown on a first load
/// when there is nothing cached to show instead.
class WeatherSkeleton extends StatefulWidget {
  const WeatherSkeleton({super.key, required this.maxWidth});

  /// Matches the width the loaded content will take.
  final double maxWidth;

  @override
  State<WeatherSkeleton> createState() => _WeatherSkeletonState();
}

class _WeatherSkeletonState extends State<WeatherSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _pulse.stop();
    } else if (!_pulse.isAnimating) {
      _pulse.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Loading weather',
      child: FadeTransition(
        opacity: Tween<double>(begin: 0.45, end: 1).animate(_pulse),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: widget.maxWidth),
            child: const SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Bone(width: 180, height: 14),
                  SizedBox(height: 20),
                  _Bone(width: 170, height: 104),
                  SizedBox(height: 20),
                  _Bone(width: 150, height: 20),
                  SizedBox(height: 10),
                  _Bone(width: 110, height: 14),
                  SizedBox(height: 44),
                  _Bone(height: 92),
                  SizedBox(height: 44),
                  _Bone(width: 130, height: 18),
                  SizedBox(height: 16),
                  _Bone(height: 150),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Bone extends StatelessWidget {
  const _Bone({this.width = double.infinity, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(height > 40 ? 16 : 7),
      ),
    );
  }
}
