import 'package:ditonton/presentation/bloc/tv_series_top_rated_bloc/tv_series_top_rated_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/state_freezed.dart';
import '../../../domain/entities/tv_series.dart';
import '../../widgets/tv_series_card_list.dart';

class TopRatedTvSeriesPage extends StatefulWidget {
  const TopRatedTvSeriesPage({super.key});

  @override
  State<TopRatedTvSeriesPage> createState() => _TopRatedTvSeriesPageState();
}

class _TopRatedTvSeriesPageState extends State<TopRatedTvSeriesPage> {
  @override
  void initState() {
    super.initState();

    final bloc = BlocProvider.of<TvSeriesTopRatedBloc>(
      context,
      listen: false,
    );

    Future.microtask(() => bloc.add(const TvSeriesTopRatedEvent.started()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular TvSeries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            BlocBuilder<TvSeriesTopRatedBloc, RequestStateFr<List<TvSeries>>>(
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
