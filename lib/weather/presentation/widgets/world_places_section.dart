import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/unit_system.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/presentation/cubit/explore_cubit.dart';
import 'package:weather_app/weather/presentation/cubit/settings_cubit.dart';
import 'package:weather_app/weather/presentation/theme/app_theme.dart';
import 'package:weather_app/weather/presentation/widgets/weather_glyph.dart';

/// The weather right now in a random set of cities around the world, as
/// somewhere to start when there is nothing in mind to search for. Reads
/// the [ExploreCubit] above it.
class WorldPlacesSection extends StatelessWidget {
  const WorldPlacesSection({super.key, required this.onSelect});

  final ValueChanged<Place> onSelect;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final state = context.watch<ExploreCubit>().state;
    final units = context.watch<SettingsCubit>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 8, 0),
          child: Row(
            children: [
              Expanded(
                child: Semantics(
                  header: true,
                  child: Text('Around the world', style: text.bodySmall),
                ),
              ),
              IconButton(
                onPressed: context.read<ExploreCubit>().shuffle,
                tooltip: 'Show other places',
                icon: const Icon(Icons.shuffle_rounded, size: 20),
              ),
            ],
          ),
        ),
        for (final place in state.places)
          _WorldPlaceRow(
            place: place,
            snapshot: state.snapshots[place],
            units: units,
            onTap: () => onSelect(place),
          ),
      ],
    );
  }
}

class _WorldPlaceRow extends StatelessWidget {
  const _WorldPlaceRow({
    required this.place,
    required this.snapshot,
    required this.units,
    required this.onTap,
  });

  final Place place;
  final PlaceSnapshot? snapshot;
  final UnitSystem units;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final snapshot = this.snapshot;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(place.name, style: text.bodyLarge),
                  Text(place.country ?? '', style: text.bodySmall),
                ],
              ),
            ),
            if (snapshot != null) ...[
              WeatherGlyph(
                condition: snapshot.condition,
                isDay: snapshot.isDay,
                size: 26,
              ),
              const SizedBox(width: 12),
            ],
            SizedBox(
              width: 48,
              child: Text(
                // A dash holds the column while the weather loads.
                snapshot == null
                    ? '–'
                    : units.temperature(snapshot.temperature),
                textAlign: TextAlign.end,
                style: text.titleMedium?.copyWith(
                  fontFeatures: AppTheme.tabularFigures,
                  color: snapshot == null ? AppTheme.muted : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
