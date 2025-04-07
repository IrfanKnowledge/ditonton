import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series_search_bloc/tv_series_search_bloc.dart';
import 'package:ditonton/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants.dart';

class SearchTvSeriesPage extends StatelessWidget {
  const SearchTvSeriesPage({super.key});

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
                final bloc = BlocProvider.of<TvSeriesSearchBloc>(
                  context,
                  listen: false,
                );

                bloc.add(TvSeriesSearchEvent.onQueryChanged(query));
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
            BlocBuilder<TvSeriesSearchBloc, RequestStateFr<List<TvSeries>>>(
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
                    final List<TvSeries> data = value.data;
                    final result = data;
                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, index) {
                          final tvSeries = data[index];
                          return TvSeriesCardList(
                            tvSeries: tvSeries,
                          );
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
