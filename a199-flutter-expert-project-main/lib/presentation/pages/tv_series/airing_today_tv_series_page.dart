import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/presentation/bloc/tv_series_airing_today_bloc/tv_series_airing_today_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/tv_series.dart';
import '../../widgets/tv_series_card_list.dart';

class AiringTodayTvSeriesPage extends StatefulWidget {
  const AiringTodayTvSeriesPage({super.key});

  @override
  State<AiringTodayTvSeriesPage> createState() =>
      _AiringTodayTvSeriesPageState();
}

class _AiringTodayTvSeriesPageState extends State<AiringTodayTvSeriesPage> {
  @override
  void initState() {
    super.initState();

    final bloc = BlocProvider.of<TvSeriesAiringTodayBloc>(
      context,
      listen: false,
    );

    Future.microtask(() => bloc.add(const TvSeriesAiringTodayEvent.started()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Airing Today TvSeries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvSeriesAiringTodayBloc,
            RequestStateFr<List<TvSeries>>>(
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
