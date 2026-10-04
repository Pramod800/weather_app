import 'package:flutter/material.dart';

/// The place being shown, which opens search, and the screen's actions.
class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.title,
    required this.followsLocation,
    required this.onSearch,
    required this.onSettings,
    this.isSaved,
    this.onToggleSaved,
    this.onUseLocation,
  });

  final String title;
  final bool followsLocation;
  final VoidCallback onSearch;
  final VoidCallback onSettings;

  /// Null when there is no place to save yet.
  final bool? isSaved;
  final VoidCallback? onToggleSaved;

  /// Null when the app already follows the device.
  final VoidCallback? onUseLocation;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final saved = isSaved;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 8, 0),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Semantics(
                button: true,
                label:
                    'Change place. Showing $title'
                    '${followsLocation ? ', your location' : ''}',
                excludeSemantics: true,
                child: InkWell(
                  onTap: onSearch,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (followsLocation) ...[
                          const Icon(Icons.near_me_rounded, size: 18),
                          const SizedBox(width: 8),
                        ],
                        Flexible(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: text.headlineMedium,
                          ),
                        ),
                        const SizedBox(width: 2),
                        const Icon(Icons.expand_more_rounded),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (onUseLocation != null)
            IconButton(
              onPressed: onUseLocation,
              tooltip: 'Use my location',
              icon: const Icon(Icons.my_location_rounded),
            ),
          if (saved != null)
            IconButton(
              onPressed: onToggleSaved,
              tooltip: saved ? 'Remove from saved places' : 'Save place',
              icon: Icon(
                saved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
              ),
            ),
          IconButton(
            onPressed: onSettings,
            tooltip: 'Units',
            icon: const Icon(Icons.tune_rounded),
          ),
        ],
      ),
    );
  }
}
