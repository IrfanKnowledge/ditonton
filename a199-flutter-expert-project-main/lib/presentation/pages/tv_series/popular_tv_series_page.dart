import 'package:ditonton/presentation/bloc/tv_series_popular_bloc/tv_series_popular_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/state_freezed.dart';
import '../../../domain/entities/tv_series.dart';
import '../../widgets/tv_series_card_list.dart';

class PopularTvSeriesPage extends StatefulWidget {
  const PopularTvSeriesPage({super.key});

  @override
  State<PopularTvSeriesPage> createState() => _PopularTvSeriesPageState();
}

class _PopularTvSeriesPageState extends State<PopularTvSeriesPage> {
  @override
  void initState() {
    super.initState();

    final bloc = BlocProvider.of<TvSeriesPopularBloc>(
      context,
      listen: false,
    );

    Future.microtask(() => bloc.add(const TvSeriesPopularEvent.started()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular TvSeries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvSeriesPopularBloc, RequestStateFr<List<TvSeries>>>(
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
                final List<TvSeries> data = value.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final tvSeries = data[index];
                    return TvSeriesCardList(tvSeries: tvSeries);
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
