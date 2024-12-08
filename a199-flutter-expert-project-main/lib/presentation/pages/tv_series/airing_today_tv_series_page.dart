
import 'package:ditonton/presentation/provider/tv_series_airing_today_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/state_enum.dart';
import '../../widgets/tv_series_card_list.dart';

class AiringTodayTvSeriesPage extends StatefulWidget {
  const AiringTodayTvSeriesPage({super.key});

  @override
  State<AiringTodayTvSeriesPage> createState() => _AiringTodayTvSeriesPageState();
}

class _AiringTodayTvSeriesPageState extends State<AiringTodayTvSeriesPage> {

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<TvSeriesAiringTodayNotifier>(
      context,
      listen: false,
    );
    Future.microtask(() => provider.fetchAiringToday());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Airing Today TvSeries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TvSeriesAiringTodayNotifier>(
          builder: (context, data, child) {
            if (data.airingTodayState == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.airingTodayState == RequestState.loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvSeries = data.tvSeriesList[index];
                  return TvSeriesCardList(tvSeries: tvSeries);
                },
                itemCount: data.tvSeriesList.length,
              );
            } else {
              return Center(
                key: const Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
}