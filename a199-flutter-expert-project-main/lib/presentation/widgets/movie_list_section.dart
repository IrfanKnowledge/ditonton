import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/route_name.dart';
import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/presentation/bloc/movies/movies_list_now_playing_bloc/movies_list_now_playing_bloc.dart';
import 'package:ditonton/presentation/bloc/movies/movies_list_popular_bloc/movies_list_popular_bloc.dart';
import 'package:ditonton/presentation/bloc/movies/movies_list_top_rated_bloc/movies_list_top_rated_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants.dart';
import '../../domain/entities/movie.dart';

AppBar appBarMovieList(BuildContext context) {
  return AppBar(
    key: const Key('app_bar_movie_list'),
    title: const Text('Ditonton - Movie'),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, kRouteNameSearchMovies);
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
            BlocBuilder<MoviesListNowPlayingBloc, RequestStateFr<List<Movie>>>(
              builder: (context, state) {
                return state.map(
                  initial: (value) {
                    return const Center(
                      key: Key('center_loading_now_playing'),
                      child: CircularProgressIndicator(
                        key: Key('loading_now_playing'),
                      ),
                    );
                  },
                  loading: (value) {
                    return const Center(
                      key: Key('center_loading_now_playing'),
                      child: CircularProgressIndicator(
                        key: Key('loading_now_playing'),
                      ),
                    );
                  },
                  loaded: (value) {
                    final List<Movie> data = value.data;

                    return _MovieList(
                      key: const Key('list_view_movies_now_playing'),
                      data,
                    );
                  },
                  error: (value) {
                    return const Text(
                      key: Key('list_movies_now_playing_failed'),
                      'Failed',
                    );
                  },
                );
              },
            ),
            _buildSubHeading(
              title: 'Popular',
              onTap: () => Navigator.pushNamed(
                context,
                kRouteNamePopularMovies,
              ),
            ),
            BlocBuilder<MoviesListPopularBloc, RequestStateFr<List<Movie>>>(
              builder: (context, state) {
                return state.map(
                  initial: (value) {
                    return const Center(
                      key: Key('center_loading_popular'),
                      child: CircularProgressIndicator(
                        key: Key('loading_popular'),
                      ),
                    );
                  },
                  loading: (value) {
                    return const Center(
                      key: Key('center_loading_popular'),
                      child: CircularProgressIndicator(
                        key: Key('loading_popular'),
                      ),
                    );
                  },
                  loaded: (value) {
                    final List<Movie> data = value.data;
                    List<Key>? keyList = [];

                    for (int i = 0; i < data.length; i++) {
                      final key = "movie_popular_$i";
                      keyList.add(Key(key));
                    }

                    if (keyList.isEmpty) {
                      keyList = null;
                    }

                    return _MovieList(
                      key: const Key('list_view_movies_popular'),
                      keyInkWellList: keyList,
                      data,
                    );
                  },
                  error: (value) {
                    return const Text(
                      key: Key('list_movies_popular_failed'),
                      'Failed',
                    );
                  },
                );
              },
            ),
            _buildSubHeading(
              title: 'Top Rated',
              onTap: () =>
                  Navigator.pushNamed(context, kRouteNameTopRatedMovies),
            ),
            BlocBuilder<MoviesListTopRatedBloc, RequestStateFr<List<Movie>>>(
              builder: (context, state) {
                return state.map(
                  initial: (value) {
                    return const Center(
                      key: Key('center_loading_top_rated'),
                      child: CircularProgressIndicator(
                        key: Key('loading_top_rated'),
                      ),
                    );
                  },
                  loading: (value) {
                    return const Center(
                      key: Key('center_loading_top_rated'),
                      child: CircularProgressIndicator(
                        key: Key('loading_top_rated'),
                      ),
                    );
                  },
                  loaded: (value) {
                    final List<Movie> data = value.data;

                    return _MovieList(
                      key: const Key('list_view_movies_top_rated'),
                      data,
                    );
                  },
                  error: (value) {
                    return const Text(
                      key: Key('list_movies_top_rated_failed'),
                      'Failed',
                    );
                  },
                );
              },
            ),
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
                  kRouteNameMoviesDetail,
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
