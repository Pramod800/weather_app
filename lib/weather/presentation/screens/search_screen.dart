import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/di/bootstrap.dart';
import 'package:weather_app/core/router/router.gr.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/weather_repo.dart';
import 'package:weather_app/weather/presentation/cubit/explore_cubit.dart';
import 'package:weather_app/weather/presentation/cubit/saved_places_cubit.dart';
import 'package:weather_app/weather/presentation/cubit/search_cubit.dart';
import 'package:weather_app/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_app/weather/presentation/theme/app_theme.dart';
import 'package:weather_app/weather/presentation/theme/sky_palette.dart';
import 'package:weather_app/weather/presentation/widgets/sky_background.dart';
import 'package:weather_app/weather/presentation/widgets/world_places_section.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SearchCubit(getIt<WeatherRepo>())),
        BlocProvider(
          create: (_) => ExploreCubit(getIt<WeatherRepo>())..shuffle(),
        ),
      ],
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatefulWidget {
  const _SearchView();

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Returns to the weather screen, which may not be underneath when the
  /// app was opened straight on this route.
  Future<void> _close() async {
    final router = context.router;
    if (!await router.maybePop()) {
      await router.replaceAll([const WeatherHomeRoute()]);
    }
  }

  void _select(Place place) {
    context.read<SavedPlacesCubit>().addRecent(place);
    context.read<WeatherCubit>().selectPlace(place);
    _close();
  }

  void _useLocation() {
    context.read<WeatherCubit>().useCurrentLocation();
    _close();
  }

  void _clear() {
    _controller.clear();
    context.read<SearchCubit>().queryChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return SkyBackground(
      palette: SkyPalette.night,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 8, 16, 8),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: _close,
                          tooltip: 'Back',
                          icon: const Icon(Icons.arrow_back_rounded),
                        ),
                        const SizedBox(width: 4),
                        Expanded(child: _buildField()),
                      ],
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) => switch (state) {
                        SearchIdle() => _SavedAndRecent(
                          onSelect: _select,
                          onUseLocation: _useLocation,
                        ),
                        SearchLoading() => const Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: LinearProgressIndicator(minHeight: 2),
                          ),
                        ),
                        SearchResults(:final places) => ListView(
                          children: [
                            for (final place in places)
                              _PlaceTile(place: place, onSelect: _select),
                          ],
                        ),
                        SearchEmpty(:final query) => _Message(
                          title: 'No places match “$query”',
                          body: 'Check the spelling, or try a nearby city.',
                        ),
                        SearchFailure(:final failure) => _Message(
                          title: failure.title,
                          body: failure.message,
                          actionLabel: 'Try again',
                          onAction: context.read<SearchCubit>().retry,
                        ),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField() {
    return TextField(
      controller: _controller,
      autofocus: true,
      textInputAction: TextInputAction.search,
      textCapitalization: TextCapitalization.words,
      onChanged: context.read<SearchCubit>().queryChanged,
      decoration: InputDecoration(
        hintText: 'Search for a city',
        hintStyle: const TextStyle(color: AppTheme.muted),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.1),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        prefixIcon: const Icon(Icons.search_rounded, color: AppTheme.muted),
        suffixIcon: ValueListenableBuilder(
          valueListenable: _controller,
          builder: (context, value, _) => value.text.isEmpty
              ? const SizedBox.shrink()
              : IconButton(
                  onPressed: _clear,
                  tooltip: 'Clear search',
                  icon: const Icon(Icons.close_rounded),
                ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
        ),
      ),
    );
  }
}

/// What the screen shows before anything is typed.
class _SavedAndRecent extends StatelessWidget {
  const _SavedAndRecent({required this.onSelect, required this.onUseLocation});

  final ValueChanged<Place> onSelect;
  final VoidCallback onUseLocation;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final places = context.watch<SavedPlacesCubit>().state;

    return ListView(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          leading: const Icon(Icons.near_me_rounded),
          title: const Text('Use my location'),
          onTap: onUseLocation,
        ),
        if (places.saved.isNotEmpty) ...[
          const _ListHeading('Saved places'),
          for (final place in places.saved)
            _PlaceTile(place: place, onSelect: onSelect),
        ],
        if (places.recent.isNotEmpty) ...[
          const _ListHeading('Recent'),
          for (final place in places.recent)
            _PlaceTile(place: place, onSelect: onSelect),
        ],
        if (places.saved.isEmpty && places.recent.isEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Text(
              'Search for a city to see its weather. Save the places you '
              'check often and they are listed here.',
              style: text.bodyLarge?.copyWith(color: AppTheme.muted),
            ),
          ),
        WorldPlacesSection(onSelect: onSelect),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _ListHeading extends StatelessWidget {
  const _ListHeading(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
      child: Semantics(
        header: true,
        child: Text(title, style: Theme.of(context).textTheme.bodySmall),
      ),
    );
  }
}

class _PlaceTile extends StatelessWidget {
  const _PlaceTile({required this.place, required this.onSelect});

  final Place place;
  final ValueChanged<Place> onSelect;

  @override
  Widget build(BuildContext context) {
    final isSaved = context.select<SavedPlacesCubit, bool>(
      (cubit) => cubit.state.isSaved(place),
    );

    return ListTile(
      contentPadding: const EdgeInsets.only(left: 20, right: 8),
      title: Text(place.name),
      subtitle: place.region.isEmpty ? null : Text(place.region),
      subtitleTextStyle: Theme.of(context).textTheme.bodySmall,
      trailing: IconButton(
        onPressed: () => context.read<SavedPlacesCubit>().toggleSaved(place),
        tooltip: isSaved ? 'Remove from saved places' : 'Save place',
        icon: Icon(
          isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
        ),
      ),
      onTap: () => onSelect(place),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({
    required this.title,
    required this.body,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String body;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final label = actionLabel;

    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: text.titleLarge),
            const SizedBox(height: 6),
            Text(body, style: text.bodyLarge?.copyWith(color: AppTheme.muted)),
            if (label != null) ...[
              const SizedBox(height: 16),
              FilledButton(onPressed: onAction, child: Text(label)),
            ],
          ],
        ),
      ),
    );
  }
}
