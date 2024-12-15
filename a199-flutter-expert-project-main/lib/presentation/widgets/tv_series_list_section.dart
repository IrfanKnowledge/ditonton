import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/route_name.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series_list_airing_today_bloc/tv_series_list_airing_today_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_list_popular_bloc/tv_series_list_popular_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_list_top_rated_bloc/tv_series_list_top_rated_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants.dart';
import '../../common/state_freezed.dart';

AppBar appBarTvSeriesList(BuildContext context) {
  return AppBar(
    key: const Key('app_bar_tv_series_list'),
    title: const Text('Ditonton - Tv Series'),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, kRouteNameSearchTvSeries);
        },
        icon: const Icon(Icons.search),
      )
    ],
  );
}

class BodyTvSeriesList extends StatelessWidget {
  const BodyTvSeriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSubHeading(
              title: 'Airing Today',
              onTap: () => Navigator.pushNamed(
                context,
                kRouteNameAiringTodayTvSeries,
              ),
            ),
            BlocBuilder<TvSeriesListAiringTodayBloc,
                RequestStateFr<List<TvSeries>>>(
              builder: (context, state) {
                return state.map(
                  initial: (value) {
                    return const Center(
                      key: Key('center_loading_airing_today'),
                      child: CircularProgressIndicator(
                        key: Key('loading_airing_today'),
                      ),
                    );
                  },
                  loading: (value) {
                    return const Center(
                      key: Key('center_loading_airing_today'),
                      child: CircularProgressIndicator(
                        key: Key('loading_airing_today'),
                      ),
                    );
                  },
                  loaded: (value) {
                    final List<TvSeries> data = value.data;
                    return _TvSeriesList(
                      key: const Key('list_view_tv_series_airing_today'),
                      data,
                    );
                  },
                  error: (value) {
                    return const Text(
                      key: Key('list_tv_series_airing_today_failed'),
                      'Failed',
                    );
                  },
                );
              },
            ),
            _buildSubHeading(
              title: 'Popular',
              onTap: () => Navigator.pushNamed(
                context,
                kRouteNamePopularTvSeries,
              ),
            ),
            BlocBuilder<TvSeriesListPopularBloc,
                RequestStateFr<List<TvSeries>>>(
              builder: (context, state) {
                return state.map(
                  initial: (value) {
                    return const Center(
                      key: Key('center_loading_popular'),
                      child: CircularProgressIndicator(
                        key: Key('loading_popular'),
                      ),
                    );
                  },
                  loading: (value) {
                    return const Center(
                      key: Key('center_loading_popular'),
                      child: CircularProgressIndicator(
                        key: Key('loading_popular'),
                      ),
                    );
                  },
                  loaded: (value) {
                    final List<TvSeries> data = value.data;
                    List<Key>? listKey = [];

                    for (int i = 0; i < data.length; i++) {
                      final key = "tv_series_popular_$i";
                      listKey.add(Key(key));
                    }

                    if (listKey.isEmpty) {
                      listKey = null;
                    }

                    return _TvSeriesList(
                      key: const Key('list_view_tv_series_popular'),
                      keyInkWellList: listKey,
                      data,
                    );
                  },
                  error: (value) {
                    return const Text(
                      key: Key('list_tv_series_popular_failed'),
                      'Failed',
                    );
                  },
                );
              },
            ),
            _buildSubHeading(
              title: 'Top Rated',
              onTap: () => Navigator.pushNamed(
                context,
                kRouteNameTopRatedTvSeries,
              ),
            ),
            BlocBuilder<TvSeriesListTopRatedBloc,
                RequestStateFr<List<TvSeries>>>(
              builder: (context, state) {
                return state.map(
                  initial: (value) {
                    return const Center(
                      key: Key('center_loading_top_rated'),
                      child: CircularProgressIndicator(
                        key: Key('loading_top_rated'),
                      ),
                    );
                  },
                  loading: (value) {
                    return const Center(
                      key: Key('center_loading_top_rated'),
                      child: CircularProgressIndicator(
                        key: Key('loading_top_rated'),
                      ),
                    );
                  },
                  loaded: (value) {
                    final List<TvSeries> data = value.data;
                    return _TvSeriesList(
                      key: const Key('list_view_tv_series_top_rated'),
                      data,
                    );
                  },
                  error: (value) {
                    return const Text(
                      key: Key('list_tv_series_top_rated_failed'),
                      'Failed',
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

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class _TvSeriesList extends StatelessWidget {
  final List<TvSeries> tvSeries;
  final List<Key>? keyInkWellList;

  const _TvSeriesList(
    this.tvSeries, {
    super.key,
    this.keyInkWellList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final keyInkWell = keyInkWellList?[index];
          final tvSeriesItem = tvSeries[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              key: keyInkWell,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  kRouteNameTvSeriesDetail,
                  arguments: tvSeriesItem.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$kBaseImageUrl${tvSeriesItem.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeries.length,
      ),
    );
  }
}
