import 'package:ditonton/common/state_freezed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants.dart';
import '../../../domain/entities/movie.dart';
import '../../bloc/movies/movies_search_bloc/movies_search_bloc.dart';
import '../../widgets/movie_card_list.dart';

class SearchMoviesPage extends StatelessWidget {
  const SearchMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (query) {
                final bloc = BlocProvider.of<MoviesSearchBloc>(
                  context,
                  listen: false,
                );

                bloc.add(MoviesSearchEvent.onQueryChanged(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            BlocBuilder<MoviesSearchBloc, RequestStateFr<List<Movie>>>(
              builder: (context, state) {
                return state.map(
                  initial: (value) {
                    return Expanded(
                      child: Container(
                        key: const Key('container_empty'),
                      ),
                    );
                  },
                  loading: (value) {
                    return const Center(
                      key: Key('center_loading'),
                      child: CircularProgressIndicator(
                        key: Key('loading'),
                      ),
                    );
                  },
                  loaded: (value) {
                    final List<Movie> data = value.data;
                    final result = data;
                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, index) {
                          final movie = data[index];
                          return MovieCard(movie);
                        },
                        itemCount: result.length,
                      ),
                    );
                  },
                  error: (value) {
                    return Expanded(
                      child: Container(
                        key: const Key('container_empty'),
                      ),
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
