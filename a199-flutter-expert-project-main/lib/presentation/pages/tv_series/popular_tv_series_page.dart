import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_series_popular_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final provider = Provider.of<TvSeriesPopularNotifier>(
      context,
      listen: false,
    );
    Future.microtask(() => provider.fetchPopular());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular TvSeries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TvSeriesPopularNotifier>(
          builder: (context, data, child) {
            if (data.popularState == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.popularState == RequestState.loaded) {
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
