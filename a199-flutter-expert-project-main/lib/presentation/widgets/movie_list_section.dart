import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/constants.dart';
import '../../common/state_enum.dart';
import '../../domain/entities/movie.dart';
import '../pages/movie_detail_page.dart';
import '../pages/popular_movies_page.dart';
import '../pages/search_page.dart';
import '../pages/top_rated_movies_page.dart';
import '../provider/movie_list_notifier.dart';

AppBar appBarMovieList(BuildContext context) {
  return AppBar(
    key: const Key('app_bar_movie_list'),
    title: const Text('Ditonton - Movie'),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
        },
        icon: const Icon(Icons.search),
      )
    ],
  );
}

class BodyMovieList extends StatelessWidget {
  const BodyMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Now Playing',
              style: kHeading6,
            ),
            Consumer<MovieListNotifier>(builder: (context, data, child) {
              final state = data.nowPlayingState;
              if (state == RequestState.Loading) {
                return const Center(
                  key: Key('center_loading_now_playing'),
                  child: CircularProgressIndicator(
                    key: Key('loading_now_playing'),
                  ),
                );
              } else if (state == RequestState.Loaded) {
                return _MovieList(
                  key: const Key('list_view_movies_now_playing'),
                  data.nowPlayingMovies,
                );
              } else {
                return const Text(
                  key: Key('list_movies_now_playing_failed'),
                  'Failed',
                );
              }
            }),
            _buildSubHeading(
              title: 'Popular',
              onTap: () => Navigator.pushNamed(
                context,
                PopularMoviesPage.ROUTE_NAME,
              ),
            ),
            Consumer<MovieListNotifier>(builder: (context, data, child) {
              final state = data.popularMoviesState;
              if (state == RequestState.Loading) {
                return const Center(
                  key: Key('center_loading_popular'),
                  child: CircularProgressIndicator(
                    key: Key('loading_popular'),
                  ),
                );
              } else if (state == RequestState.Loaded) {
                List<Key>? keyList = [];

                for (int i = 0; i < data.popularMovies.length; i++) {
                  final key = "movie_popular_$i";
                  keyList.add(Key(key));
                }

                if (keyList.isEmpty) {
                  keyList = null;
                }

                return _MovieList(
                  key: const Key('list_view_movies_popular'),
                  keyInkWellList: keyList,
                  data.popularMovies,
                );
              } else {
                return const Text(
                  key: Key('list_movies_popular_failed'),
                  'Failed',
                );
              }
            }),
            _buildSubHeading(
              title: 'Top Rated',
              onTap: () =>
                  Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
            ),
            Consumer<MovieListNotifier>(builder: (context, data, child) {
              final state = data.topRatedMoviesState;
              if (state == RequestState.Loading) {
                return const Center(
                  key: Key('center_loading_top_rated'),
                  child: CircularProgressIndicator(
                    key: Key('loading_top_rated'),
                  ),
                );
              } else if (state == RequestState.Loaded) {
                return _MovieList(
                  key: const Key('list_view_movies_top_rated'),
                  data.topRatedMovies,
                );
              } else {
                return const Text(
                  key: Key('list_movies_top_rated_failed'),
                  'Failed',
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

Row _buildSubHeading({required String title, required Function() onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: kHeading6,
      ),
      InkWell(
        onTap: onTap,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
          ),
        ),
      ),
    ],
  );
}

class _MovieList extends StatelessWidget {
  final List<Movie> movies;
  final List<Key>? keyInkWellList;

  const _MovieList(
    this.movies, {
    super.key,
    this.keyInkWellList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final keyInkWell = keyInkWellList?[index];
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              key: keyInkWell,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$kBaseImageUrl${movie.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
