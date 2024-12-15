import 'package:ditonton/common/route_name.dart';
import 'package:ditonton/presentation/bloc/tv_series_list_airing_today_bloc/tv_series_list_airing_today_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_list_popular_bloc/tv_series_list_popular_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_list_top_rated_bloc/tv_series_list_top_rated_bloc.dart';
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/watchlist_movies_page.dart';
import 'package:ditonton/presentation/provider/movie_list_notifier.dart';
import 'package:ditonton/presentation/widgets/tv_series_list_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../widgets/movie_list_section.dart';

class HomeMoviePage extends StatefulWidget {
  final HomeSection homeSection;

  const HomeMoviePage({
    super.key,
    this.homeSection = HomeSection.movieList,
  });

  @override
  State<HomeMoviePage> createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  HomeSection currentSection = HomeSection.movieList;

  @override
  void initState() {
    super.initState();

    currentSection = widget.homeSection;

    final providerMovieList = Provider.of<MovieListNotifier>(
      context,
      listen: false,
    );

    final blocTvSeriesListAiringToday =
        BlocProvider.of<TvSeriesListAiringTodayBloc>(
      context,
      listen: false,
    );

    final blocTvSeriesListPopularBloc =
        BlocProvider.of<TvSeriesListPopularBloc>(
      context,
      listen: false,
    );

    final blocTvSeriesListTopRatedBloc =
        BlocProvider.of<TvSeriesListTopRatedBloc>(
      context,
      listen: false,
    );

    Future.microtask(
      () {
        providerMovieList
          ..fetchNowPlayingMovies()
          ..fetchPopularMovies()
          ..fetchTopRatedMovies();

        blocTvSeriesListAiringToday
            .add(const TvSeriesListAiringTodayEvent.started());
        blocTvSeriesListPopularBloc
            .add(const TvSeriesListPopularEvent.started());
        blocTvSeriesListTopRatedBloc
            .add(const TvSeriesListTopRatedEvent.started());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            Builder(builder: (context) {
              void Function() onTap = () {};

              if (currentSection == HomeSection.movieList) {
                onTap = () {
                  Navigator.pop(context);
                };
              } else {
                onTap = () {
                  setState(() {
                    currentSection = HomeSection.movieList;
                    Navigator.pop(context);
                  });
                };
              }

              return ListTile(
                leading: const Icon(Icons.movie),
                title: const Text('Movies'),
                onTap: onTap,
              );
            }),
            Builder(builder: (context) {
              void Function() onTap = () {};

              if (currentSection == HomeSection.tvSeriesList) {
                onTap = () {
                  Navigator.pop(context);
                };
              } else {
                onTap = () {
                  setState(() {
                    currentSection = HomeSection.tvSeriesList;
                    Navigator.pop(context);
                  });
                };
              }

              return ListTile(
                key: const Key('list_tile_tv_series'),
                leading: const Icon(Icons.tv),
                title: const Text('Tv Series'),
                onTap: onTap,
              );
            }),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist Movie'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistMoviesPage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist Tv Series'),
              onTap: () {
                Navigator.pushNamed(context, kRouteNameWatchlistTvSeries);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.routeName);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
      appBar: selectAppBar(
        context: context,
        currentAppBar: currentSection,
      ),
      body: selectBody(
        context: context,
        currentAppBar: currentSection,
      ),
    );
  }

  AppBar selectAppBar({
    required BuildContext context,
    required HomeSection currentAppBar,
  }) {
    switch (currentAppBar) {
      case HomeSection.movieList:
        return appBarMovieList(context);
      case HomeSection.tvSeriesList:
        return appBarTvSeriesList(context);
    }
  }

  Widget selectBody({
    required BuildContext context,
    required HomeSection currentAppBar,
  }) {
    switch (currentSection) {
      case HomeSection.movieList:
        return const BodyMovieList(
          key: Key('body_movie_list'),
        );
      case HomeSection.tvSeriesList:
        return const BodyTvSeriesList(
          key: Key('body_tv_series_list'),
        );
    }
  }
}

enum HomeSection {
  movieList,
  tvSeriesList,
}
