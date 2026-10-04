import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/unit_system.dart';
import 'package:weather_app/weather/presentation/cubit/settings_cubit.dart';
import 'package:weather_app/weather/presentation/theme/app_theme.dart';

Future<void> showSettingsSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (_) => const _SettingsSheet(),
  );
}

class _SettingsSheet extends StatelessWidget {
  const _SettingsSheet();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final units = context.watch<SettingsCubit>().state;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Units', style: text.headlineSmall),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: SegmentedButton<UnitSystem>(
                showSelectedIcon: false,
                segments: [
                  for (final option in UnitSystem.values)
                    ButtonSegment(value: option, label: Text(option.label)),
                ],
                selected: {units},
                onSelectionChanged: (selection) =>
                    context.read<SettingsCubit>().setUnits(selection.first),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              units.summary,
              style: text.bodyMedium?.copyWith(color: AppTheme.muted),
            ),
          ],
        ),
      ),
    );
  }
}
