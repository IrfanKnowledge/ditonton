import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/route_name.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/provider/tv_series_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/constants.dart';
import '../../common/state_enum.dart';

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
            Text(
              'Airing Today',
              style: kHeading6,
            ),
            Consumer<TvSeriesListNotifier>(builder: (context, data, child) {
              final state = data.airingTodayState;
              if (state == RequestState.Loading) {
                return const Center(
                  key: Key('center_loading_airing_today'),
                  child: CircularProgressIndicator(
                    key: Key('loading_airing_today'),
                  ),
                );
              } else if (state == RequestState.Loaded) {
                return _TvSeriesList(
                  key: const Key('list_view_tv_series_airing_today'),
                  data.tvSeriesAiringTodayList,
                );
              } else {
                return const Text(
                  key: Key('list_tv_series_airing_today_failed'),
                  'Failed',
                );
              }
            }),
            _buildSubHeading(
              title: 'Popular',
              onTap: () => Navigator.pushNamed(
                context,
                kRouteNamePopularTvSeries,
              ),
            ),
            Consumer<TvSeriesListNotifier>(builder: (context, data, child) {
              final state = data.popularState;
              if (state == RequestState.Loading) {
                return const Center(
                  key: Key('center_loading_popular'),
                  child: CircularProgressIndicator(
                    key: Key('loading_popular'),
                  ),
                );
              } else if (state == RequestState.Loaded) {
                return _TvSeriesList(
                  key: const Key('list_view_tv_series_popular'),
                  data.tvSeriesPopularList,
                );
              } else {
                return const Text(
                  key: Key('list_tv_series_popular_failed'),
                  'Failed',
                );
              }
            }),
            _buildSubHeading(
              title: 'Top Rated',
              onTap: () => Navigator.pushNamed(
                context,
                kRouteNameTopRatedTvSeries,
              ),
            ),
            Consumer<TvSeriesListNotifier>(builder: (context, data, child) {
              final state = data.topRatedState;
              if (state == RequestState.Loading) {
                return const Center(
                  key: Key('center_loading_top_rated'),
                  child: CircularProgressIndicator(
                    key: Key('loading_top_rated'),
                  ),
                );
              } else if (state == RequestState.Loaded) {
                return _TvSeriesList(
                  key: const Key('list_view_tv_series_top_rated'),
                  data.tvSeriesTopRatedList,
                );
              } else {
                return const Text(
                  key: Key('list_tv_series_top_rated_failed'),
                  'Failed',
                );
              }
            }),
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

  const _TvSeriesList(this.tvSeries, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = tvSeries[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  kRouteNameTvSeriesDetail,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
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
