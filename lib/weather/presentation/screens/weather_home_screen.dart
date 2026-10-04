import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/di/bootstrap.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/presentation/cubit/saved_places_cubit.dart';
import 'package:weather_app/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_app/weather/presentation/widgets/page_dots.dart';
import 'package:weather_app/weather/presentation/widgets/weather_page.dart';

/// Swipes sideways through full-screen pages: the primary place first (the
/// device's location, or whatever was picked in search), then each saved
/// place.
@RoutePage()
class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  final _pages = PageController();
  int _index = 0;

  /// Room the pages leave at the bottom for the page indicator.
  static const _indicatorInset = PageDots.height + 16;

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  void _goTo(int page) {
    if (!_pages.hasClients) return;
    if (MediaQuery.disableAnimationsOf(context)) {
      _pages.jumpToPage(page);
    } else {
      _pages.animateToPage(
        page,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryPlace = context.select<WeatherCubit, Place?>(
      (cubit) => cubit.state.place,
    );
    final followsLocation = context.select<WeatherCubit, bool>(
      (cubit) => cubit.state.followsLocation,
    );
    final saved = context.select<SavedPlacesCubit, List<Place>>(
      (cubit) => cubit.state.saved,
    );
    // A saved place that is already on the primary page is not repeated.
    final savedPages = [
      for (final place in saved)
        if (place != primaryPlace) place,
    ];
    final pageCount = savedPages.length + 1;
    // With a single page there is nothing to indicate or make room for.
    final bottomInset = pageCount > 1 ? _indicatorInset : 0.0;

    return BlocListener<WeatherCubit, WeatherState>(
      // The primary page starts loading when a place is picked in search or
      // the device is located again; bring it into view.
      listenWhen: (previous, current) =>
          !previous.isRefreshing && current.isRefreshing,
      listener: (context, state) {
        if (_pages.hasClients && _index != 0) _pages.jumpToPage(0);
      },
      child: ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pages,
              itemCount: pageCount,
              onPageChanged: (index) => setState(() => _index = index),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return WeatherPage(isPrimary: true, bottomInset: bottomInset);
                }
                final place = savedPages[index - 1];
                return BlocProvider(
                  // A new place at this position gets a new cubit.
                  key: ValueKey(place.id),
                  create: (_) => WeatherCubit(
                    repo: getIt(),
                    storage: getIt(),
                    remembersSelection: false,
                  )..selectPlace(place, refetchFresh: false),
                  child: WeatherPage(
                    isPrimary: false,
                    bottomInset: bottomInset,
                  ),
                );
              },
            ),
            if (pageCount > 1)
              Positioned(
                left: 0,
                right: 0,
                bottom: 8,
                child: SafeArea(
                  top: false,
                  child: Center(
                    child: PageDots(
                      count: pageCount,
                      index: _index.clamp(0, pageCount - 1),
                      firstFollowsLocation: followsLocation,
                      onSelect: _goTo,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
