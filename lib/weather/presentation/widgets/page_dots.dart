import 'package:flutter/material.dart';

/// Shows which page of the place pager is open and jumps to another on tap.
/// The first page gets a location arrow while it follows the device.
class PageDots extends StatelessWidget {
  const PageDots({
    super.key,
    required this.count,
    required this.index,
    required this.firstFollowsLocation,
    required this.onSelect,
  });

  final int count;
  final int index;
  final bool firstFollowsLocation;
  final ValueChanged<int> onSelect;

  static const height = 32.0;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: 'Page ${index + 1} of $count',
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.28),
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < count; i++)
              _Dot(
                icon: i == 0 && firstFollowsLocation
                    ? Icons.near_me_rounded
                    : null,
                label: 'Place ${i + 1}',
                isActive: i == index,
                onTap: () => onSelect(i),
              ),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData? icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? Colors.white : Colors.white.withValues(alpha: 0.5);
    final icon = this.icon;

    return Semantics(
      button: true,
      selected: isActive,
      label: label,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: SizedBox(
          width: 22,
          height: PageDots.height,
          child: Center(
            child: icon != null
                ? Icon(icon, size: 13, color: color)
                : Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
