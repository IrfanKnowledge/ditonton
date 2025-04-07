import 'package:ditonton/presentation/bloc/watchlist_tv_series_bloc/watchlist_tv_series_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/state_freezed.dart';
import '../../../common/utils.dart';
import '../../../domain/entities/tv_series.dart';
import '../../widgets/tv_series_card_list.dart';

class WatchlistTvSeriesPage extends StatefulWidget {
  const WatchlistTvSeriesPage({super.key});

  @override
  State<WatchlistTvSeriesPage> createState() => _WatchlistTvSeriesPageState();
}

class _WatchlistTvSeriesPageState extends State<WatchlistTvSeriesPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();

    final bloc = BlocProvider.of<WatchlistTvSeriesBloc>(
      context,
      listen: false,
    );

    Future.microtask(() => bloc.add(const WatchlistTvSeriesEvent.started()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    final bloc = BlocProvider.of<WatchlistTvSeriesBloc>(
      context,
      listen: false,
    );

    bloc.add(const WatchlistTvSeriesEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist - Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            BlocBuilder<WatchlistTvSeriesBloc, RequestStateFr<List<TvSeries>>>(
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
                    return TvSeriesCardList(
                      tvSeries: tvSeries,
                    );
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
