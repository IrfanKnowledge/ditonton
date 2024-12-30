import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/state_freezed.dart';
import '../../../domain/entities/movie.dart';
import '../../bloc/movies/movies_top_rated_bloc/movies_top_rated_bloc.dart';
import '../../widgets/movie_card_list.dart';

class TopRatedMoviesPage extends StatefulWidget {
  const TopRatedMoviesPage({super.key});

  @override
  State<TopRatedMoviesPage> createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends State<TopRatedMoviesPage> {
  @override
  void initState() {
    super.initState();

    final bloc = BlocProvider.of<MoviesTopRatedBloc>(
      context,
      listen: false,
    );

    Future.microtask(() => bloc.add(const MoviesTopRatedEvent.started()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MoviesTopRatedBloc, RequestStateFr<List<Movie>>>(
          builder: (context, state) {
            return state.map(
              initial: (_) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              loading: (_) {
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
