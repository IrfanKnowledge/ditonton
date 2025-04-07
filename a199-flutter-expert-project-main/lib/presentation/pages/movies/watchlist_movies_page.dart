import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/state_freezed.dart';
import '../../../common/utils.dart';
import '../../../domain/entities/movie.dart';
import '../../bloc/movies/watchlist_movies_bloc/watchlist_movies_bloc.dart';
import '../../widgets/movie_card_list.dart';

class WatchlistMoviesPage extends StatefulWidget {
  const WatchlistMoviesPage({super.key});

  @override
  State<WatchlistMoviesPage> createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();

    final bloc = BlocProvider.of<WatchlistMoviesBloc>(
      context,
      listen: false,
    );

    Future.microtask(() => bloc.add(const WatchlistMoviesEvent.started()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    final bloc = BlocProvider.of<WatchlistMoviesBloc>(
      context,
      listen: false,
    );

    bloc.add(const WatchlistMoviesEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist - Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchlistMoviesBloc, RequestStateFr<List<Movie>>>(
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

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
