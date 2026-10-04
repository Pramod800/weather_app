import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/di/bootstrap.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/router/router.gr.dart';
import 'package:weather_app/core/utils/unit_system.dart';
import 'package:weather_app/weather/domain/entities/sun_clock.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/domain/location_service.dart';
import 'package:weather_app/weather/presentation/cubit/saved_places_cubit.dart';
import 'package:weather_app/weather/presentation/cubit/settings_cubit.dart';
import 'package:weather_app/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_app/weather/presentation/theme/app_theme.dart';
import 'package:weather_app/weather/presentation/theme/sky_palette.dart';
import 'package:weather_app/weather/presentation/widgets/current_summary.dart';
import 'package:weather_app/weather/presentation/widgets/daily_forecast_list.dart';
import 'package:weather_app/weather/presentation/widgets/failure_view.dart';
import 'package:weather_app/weather/presentation/widgets/home_header.dart';
import 'package:weather_app/weather/presentation/widgets/hourly_forecast_chart.dart';
import 'package:weather_app/weather/presentation/widgets/settings_sheet.dart';
import 'package:weather_app/weather/presentation/widgets/sky_background.dart';
import 'package:weather_app/weather/presentation/widgets/sun_arc.dart';
import 'package:weather_app/weather/presentation/widgets/weather_details.dart';
import 'package:weather_app/weather/presentation/widgets/weather_skeleton.dart';

@RoutePage()
class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    final cubit = context.read<WeatherCubit>();
    final current = cubit.state;
    // Coming back from the settings app is the moment a location problem
    // may have been fixed.
    if (current.status == WeatherStatus.failure &&
        (current.failure?.isLocationProblem ?? false)) {
      cubit.refresh();
    } else {
      cubit.refreshIfStale();
    }
  }

  void _openSearch() => context.router.push(const SearchRoute());

  void _openLocationSettings(Failure failure) {
    getIt<LocationService>().openSettings(
      serviceDisabled: failure.type == FailureType.locationServiceDisabled,
    );
  }

  void _showRefreshFailure(BuildContext context, WeatherState state) {
    final failure = state.failure!;
    final isOffline =
        failure.type == FailureType.network ||
        failure.type == FailureType.timeout;
    // The saved-weather notice on the screen already says this.
    if (isOffline && state.report!.isFromCache) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('${failure.title}. ${failure.message}'),
          action: failure.needsSettings && !kIsWeb
              ? SnackBarAction(
                  label: 'Settings',
                  onPressed: () => _openLocationSettings(failure),
                )
              : null,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listenWhen: (previous, current) =>
          previous.isRefreshing &&
          !current.isRefreshing &&
          current.failure != null &&
          current.report != null,
      listener: _showRefreshFailure,
      builder: (context, state) {
        final cubit = context.read<WeatherCubit>();
        final units = context.watch<SettingsCubit>().state;
        final report = state.report;
        final now = DateTime.now().toUtc();
        final clock = report == null
            ? null
            : SunClock(
                now: now,
                sunrise: report.current.sunrise,
                sunset: report.current.sunset,
              );
        final palette = report == null || clock == null
            ? SkyPalette.night
            : SkyPalette.of(
                report.current.condition,
                clock.hasSunrise
                    ? clock.phase
                    : (report.current.isDay ? DayPhase.day : DayPhase.night),
              );

        final placeName = state.place?.name ?? '';
        final title = placeName.isNotEmpty
            ? placeName
            : state.status == WeatherStatus.failure
            ? 'Weather'
            : 'Locating…';

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: palette.bottom,
          ),
          child: SkyBackground(
            palette: palette,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Column(
                  children: [
                    Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: contentWidthFor(
                            MediaQuery.sizeOf(context).width,
                          ),
                        ),
                        child: HomeHeader(
                          title: title,
                          followsLocation: state.followsLocation,
                          onSearch: _openSearch,
                          onSettings: () => showSettingsSheet(context),
                          onUseLocation: state.followsLocation
                              ? null
                              : cubit.useCurrentLocation,
                          isSaved: report == null
                              ? null
                              : context.select<SavedPlacesCubit, bool>(
                                  (saved) => saved.state.isSaved(report.place),
                                ),
                          onToggleSaved: report == null
                              ? null
                              : () => context
                                    .read<SavedPlacesCubit>()
                                    .toggleSaved(report.place),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                      child: state.isRefreshing && report != null
                          ? const LinearProgressIndicator(minHeight: 2)
                          : null,
                    ),
                    Expanded(
                      child: switch (state) {
                        WeatherState(:final report?) => _WeatherContent(
                          report: report,
                          clock: clock!,
                          now: now,
                          units: units,
                          isRefreshing: state.isRefreshing,
                          onRefresh: cubit.refresh,
                        ),
                        WeatherState(:final failure?) => FailureView(
                          failure: failure,
                          onRetry: cubit.refresh,
                          onSearch: _openSearch,
                          onOpenSettings: () => _openLocationSettings(failure),
                        ),
                        _ => WeatherSkeleton(
                          maxWidth: contentWidthFor(
                            MediaQuery.sizeOf(context).width,
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

const _wideContentWidth = 1120.0;

/// One readable column on phones; two side by side once there is room.
double contentWidthFor(double available) =>
    available >= 900 ? _wideContentWidth : 560;

class _WeatherContent extends StatelessWidget {
  const _WeatherContent({
    required this.report,
    required this.clock,
    required this.now,
    required this.units,
    required this.isRefreshing,
    required this.onRefresh,
  });

  final WeatherReport report;
  final SunClock clock;
  final DateTime now;
  final UnitSystem units;
  final bool isRefreshing;
  final Future<void> Function() onRefresh;

  static const _gutter = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final summary = Padding(
      padding: _gutter,
      child: CurrentSummary(report: report, units: units, now: now),
    );
    final sun = clock.hasSunrise
        ? Padding(
            padding: _gutter.copyWith(top: 28),
            child: SunArc(report: report, clock: clock),
          )
        : const SizedBox.shrink();
    final hourly = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: _gutter, child: _SectionTitle('Next 24 hours')),
        HourlyForecastChart(report: report, units: units),
      ],
    );
    final daily = Padding(
      padding: _gutter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle('${report.daily.length}-day forecast'),
          DailyForecastList(days: report.daily, units: units),
        ],
      ),
    );
    final details = Padding(
      padding: _gutter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Details'),
          WeatherDetails(report: report, units: units),
        ],
      ),
    );
    const gap = SizedBox(height: 36);

    return LayoutBuilder(
      builder: (context, constraints) {
        final contentWidth = contentWidthFor(constraints.maxWidth);
        final isWide = contentWidth == _wideContentWidth;
        return RefreshIndicator(
          onRefresh: onRefresh,
          color: const Color(0xFF164CB5),
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 10, bottom: 24),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: contentWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (report.isFromCache && !isRefreshing)
                      Padding(
                        padding: _gutter.copyWith(bottom: 16),
                        child: _SavedWeatherNotice(fetchedAt: report.fetchedAt),
                      ),
                    if (isWide)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [summary, sun, gap, details],
                            ),
                          ),
                          const SizedBox(width: 40),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [hourly, gap, daily],
                            ),
                          ),
                        ],
                      )
                    else ...[
                      summary,
                      sun,
                      gap,
                      hourly,
                      gap,
                      daily,
                      gap,
                      details,
                    ],
                    const SizedBox(height: 28),
                    Padding(
                      padding: _gutter,
                      child: _Footer(
                        fetchedAt: report.fetchedAt,
                        onRefresh: isRefreshing ? null : onRefresh,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Semantics(
        header: true,
        child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
      ),
    );
  }
}

class _SavedWeatherNotice extends StatelessWidget {
  const _SavedWeatherNotice({required this.fetchedAt});

  final DateTime fetchedAt;

  @override
  Widget build(BuildContext context) {
    final when = DateFormat('d MMM').add_jm().format(fetchedAt.toLocal());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.cloud_off_rounded, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Showing saved weather from $when. '
              'It updates when you are back online.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.fetchedAt, required this.onRefresh});

  final DateTime fetchedAt;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    final updated = DateFormat.jm().format(fetchedAt.toLocal());
    return Row(
      children: [
        Expanded(
          child: Text(
            'Updated $updated. Weather data from OpenWeather.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        IconButton(
          onPressed: onRefresh,
          tooltip: 'Refresh',
          color: AppTheme.muted,
          icon: const Icon(Icons.refresh_rounded),
        ),
      ],
    );
  }
}
