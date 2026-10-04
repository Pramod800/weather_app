import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/unit_system.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/presentation/cubit/history_cubit.dart';
import 'package:weather_app/weather/presentation/theme/app_theme.dart';
import 'package:weather_app/weather/presentation/widgets/daily_forecast_list.dart';

/// Today next to the same calendar day in previous years. Takes no space
/// until the history has loaded.
class PastYearsSection extends StatefulWidget {
  const PastYearsSection({
    super.key,
    required this.report,
    required this.units,
    this.padding = EdgeInsets.zero,
  });

  final WeatherReport report;
  final UnitSystem units;

  /// Applied only when there is something to show.
  final EdgeInsets padding;

  @override
  State<PastYearsSection> createState() => _PastYearsSectionState();
}

class _PastYearsSectionState extends State<PastYearsSection> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(PastYearsSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _load();
  }

  void _load() {
    final today = widget.report.daily.firstOrNull;
    if (today == null) return;
    // The cubit ignores a repeat request for the same place and day.
    context.read<HistoryCubit>().load(widget.report.place, today.date);
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final units = widget.units;
    final today = widget.report.daily.firstOrNull;
    final pastYears = context.watch<HistoryCubit>().state;
    if (today == null || pastYears.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            header: true,
            child: Text('This day in past years', style: text.headlineSmall),
          ),
          const SizedBox(height: 6),
          Text(
            _comparison(today, pastYears),
            style: text.bodyMedium?.copyWith(color: AppTheme.muted),
          ),
          const SizedBox(height: 4),
          DailyForecastList(
            days: [today, ...pastYears],
            units: units,
            showRainChance: false,
            labelFor: (index, day) => index == 0 ? 'Today' : '${day.date.year}',
          ),
        ],
      ),
    );
  }

  /// "Today's high of 24° is 2° above the 5-year average for 4 October."
  String _comparison(DailyForecast today, List<DailyForecast> pastYears) {
    final units = widget.units;
    final averageHigh =
        pastYears.map((day) => day.high).reduce((a, b) => a + b) /
        pastYears.length;
    final difference =
        units.temperatureValue(today.high) -
        units.temperatureValue(averageHigh);
    final date = DateFormat('d MMMM').format(today.date);
    final span = '${pastYears.length}-year average for $date';
    final high = "Today's high of ${units.temperature(today.high)}";

    if (difference == 0) return '$high matches the $span.';
    return '$high is ${difference.abs()}° '
        '${difference > 0 ? 'above' : 'below'} the $span.';
  }
}
