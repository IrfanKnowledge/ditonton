import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/state_freezed.dart';
import '../../../domain/entities/movie.dart';
import '../../bloc/movies/movies_popular_bloc/movies_popular_bloc.dart';
import '../../widgets/movie_card_list.dart';

class PopularMoviesPage extends StatefulWidget {
  const PopularMoviesPage({super.key});

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  @override
  void initState() {
    super.initState();

    final bloc = BlocProvider.of<MoviesPopularBloc>(
      context,
      listen: false,
    );

    Future.microtask(() => bloc.add(const MoviesPopularEvent.started()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MoviesPopularBloc, RequestStateFr<List<Movie>>>(
          builder: (context, state) {
            return state.map(
              initial: (value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              loading: (value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              loaded: (value) {
                final List<Movie> data = value.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final movie = data[index];
                    return MovieCard(movie);
                  },
                  itemCount: data.length,
                );
              },
              error: (value) {
                return Center(
                  key: const Key('error_message'),
                  child: Text(value.message),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
