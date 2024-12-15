import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/route_name.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_add_watchlist_bloc/tv_series_detail_add_watchlist_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_bloc/tv_series_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_load_watchlist_status_bloc/tv_series_detail_load_watchlist_status_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_recommendation_bloc/tv_series_detail_recommendation_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_remove_watchlist_bloc/tv_series_detail_remove_watchlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../common/constants.dart';
import '../../../common/state_freezed.dart';
import '../../../domain/entities/genre.dart';

class TvSeriesDetailPage extends StatefulWidget {
  final int id;

  const TvSeriesDetailPage({
    super.key,
    required this.id,
  });

  @override
  State<TvSeriesDetailPage> createState() => _TvSeriesDetailPageState();
}

class _TvSeriesDetailPageState extends State<TvSeriesDetailPage> {

  @override
  void initState() {
    // final provider =
    //     Provider.of<TvSeriesDetailNotifier>(context, listen: false);

    final blocTvSeriesDetail = BlocProvider.of<TvSeriesDetailBloc>(
      context,
      listen: false,
    );

    final blocTvSeriesDetailRecommendation =
        BlocProvider.of<TvSeriesDetailRecommendationBloc>(
      context,
      listen: false,
    );

    final blocTvSeriesDetailLoadWatchlistStatus =
        BlocProvider.of<TvSeriesDetailLoadWatchlistStatusBloc>(
      context,
      listen: false,
    );

    Future.microtask(
      () {
        // provider
        //   ..fetchTvSeriesDetail(widget.id)
        //   ..loadWatchlistStatus(widget.id);

        blocTvSeriesDetail.add(TvSeriesDetailEvent.started(widget.id));
        blocTvSeriesDetailRecommendation
            .add(TvSeriesDetailRecommendationEvent.started(widget.id));
        blocTvSeriesDetailLoadWatchlistStatus
            .add(TvSeriesDetailLoadWatchlistStatusEvent.started(widget.id));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TvSeriesDetailBloc, RequestStateFr<TvSeriesDetail>>(
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
              final TvSeriesDetail tvSeriesDetail = value.data;

              return BlocBuilder<TvSeriesDetailRecommendationBloc,
                  RequestStateFr<List<TvSeries>>>(
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
                      final List<TvSeries> tvSeriesRecommendations = value.data;

                      return BlocBuilder<TvSeriesDetailLoadWatchlistStatusBloc,
                          TvSeriesDetailLoadWatchlistStatusState>(
                        builder: (context, state) {
                          final bool isAddedToWatchlist =
                              state.isAddedToWatchList;

                          void showSnackBarWhenResponseSuccess(String message) {
                            ScaffoldMessenger.of(context).removeCurrentSnackBar();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(message)));
                          }

                          void showDialogWhenResponseFailed(String message) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(message),
                                  );
                                });
                          }

                          return BlocListener<TvSeriesDetailAddWatchlistBloc,
                              TvSeriesDetailAddWatchlistState>(
                            listener: (context, state) {
                              final message = state.watchlistMessage;
                              final isSuccess = message ==
                                  TvSeriesDetailAddWatchlistBloc
                                      .watchlistAddSuccessMessage;
                              final isReset = message ==
                                  TvSeriesDetailAddWatchlistBloc
                                      .watchlistAddResetMessage;

                              if (isSuccess) {
                                showSnackBarWhenResponseSuccess(message);

                                final blocLoad = BlocProvider.of<
                                    TvSeriesDetailLoadWatchlistStatusBloc>(
                                  context,
                                  listen: false,
                                );

                                blocLoad.add(
                                    TvSeriesDetailLoadWatchlistStatusEvent
                                        .started(widget.id));
                              } else if (isReset) {
                                return;
                              } else {
                                showDialogWhenResponseFailed(message);
                              }
                            },
                            child: BlocListener<
                                TvSeriesDetailRemoveWatchlistBloc,
                                TvSeriesDetailRemoveWatchlistState>(
                              listener: (context, state) {
                                final message = state.watchlistMessage;
                                final isSuccess = message ==
                                    TvSeriesDetailRemoveWatchlistBloc
                                        .watchlistRemoveSuccessMessage;
                                final isReset = message ==
                                    TvSeriesDetailRemoveWatchlistBloc
                                        .watchlistRemoveResetMessage;

                                if (isSuccess) {
                                  showSnackBarWhenResponseSuccess(message);

                                  final blocLoad = BlocProvider.of<
                                      TvSeriesDetailLoadWatchlistStatusBloc>(
                                    context,
                                    listen: false,
                                  );
                                  blocLoad.add(
                                      TvSeriesDetailLoadWatchlistStatusEvent
                                          .started(widget.id));
                                } else if (isReset) {
                                  return;
                                } else {
                                  showDialogWhenResponseFailed(message);
                                }
                              },
                              child: SafeArea(
                                child: _DetailContent(
                                  tvSeriesDetail,
                                  tvSeriesRecommendations,
                                  isAddedToWatchlist,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    error: (value) {
                      return Text(value.message);
                    },
                  );
                },
              );
            },
            error: (value) {
              return Text(value.message);
            },
          );
        },
      ),
      // body: Consumer<TvSeriesDetailNotifier>(
      //   builder: (context, provider, child) {
      //     if (provider.tvSeriesState == RequestState.loading) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (provider.tvSeriesState == RequestState.loaded) {
      //       final tvSeries = provider.tvSeriesDetail;
      //       return SafeArea(
      //         child: _DetailContent(
      //           tvSeries,
      //           provider.tvSeriesRecommendations,
      //           provider.isAddedToWatchlist,
      //         ),
      //       );
      //     } else {
      //       return Text(provider.message);
      //     }
      //   },
      // ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  final TvSeriesDetail tvSeriesDetail;
  final List<TvSeries> recommendations;
  final bool isAddedWatchlist;

  const _DetailContent(
    this.tvSeriesDetail,
    this.recommendations,
    this.isAddedWatchlist,
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
              'https://image.tmdb.org/t/p/w500${tvSeriesDetail.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tvSeriesDetail.name ?? "",
                              style: kHeading5,
                            ),
                            Builder(builder: (_) {
                              // final provider =
                              //     Provider.of<TvSeriesDetailNotifier>(
                              //   context,
                              //   listen: false,
                              // );

                              final blocTvSeriesDetailAddWatchlist =
                                  BlocProvider.of<
                                      TvSeriesDetailAddWatchlistBloc>(
                                context,
                                listen: false,
                              );

                              final blocTvSeriesDetailRemoveWatchlistBloc =
                                  BlocProvider.of<
                                      TvSeriesDetailRemoveWatchlistBloc>(
                                context,
                                listen: false,
                              );

                              // void showSnackBarWhenResponseSuccess(
                              //     String message) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       SnackBar(content: Text(message)));
                              // }
                              //
                              // void showDialogWhenResponseFailed(
                              //     String message) {
                              //   showDialog(
                              //       context: context,
                              //       builder: (context) {
                              //         return AlertDialog(
                              //           content: Text(message),
                              //         );
                              //       });
                              // }

                              return ElevatedButton(
                                onPressed: () async {
                                  if (!isAddedWatchlist) {
                                    // await provider.addWatchlist(tvSeriesDetail);
                                    blocTvSeriesDetailAddWatchlist.add(
                                      TvSeriesDetailAddWatchlistEvent.started(
                                        tvSeriesDetail,
                                      ),
                                    );
                                  } else {
                                    // await provider
                                    //     .removeFromWatchlist(tvSeriesDetail);
                                    blocTvSeriesDetailRemoveWatchlistBloc.add(
                                      TvSeriesDetailRemoveWatchlistEvent
                                          .started(
                                        tvSeriesDetail,
                                      ),
                                    );
                                  }

                                  // final message = provider.watchlistMessage;
                                  //
                                  // if (message ==
                                  //         TvSeriesDetailNotifier
                                  //             .watchlistAddSuccessMessage ||
                                  //     message ==
                                  //         TvSeriesDetailNotifier
                                  //             .watchlistRemoveSuccessMessage) {
                                  //   showSnackBarWhenResponseSuccess(message);
                                  // } else {
                                  //   showDialogWhenResponseFailed(message);
                                  // }
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    isAddedWatchlist
                                        ? const Icon(Icons.check)
                                        : const Icon(Icons.add),
                                    const Text('Watchlist'),
                                  ],
                                ),
                              );
                            }),
                            Text(
                              _showGenres(tvSeriesDetail.genres ?? []),
                            ),
                            Builder(builder: (_) {
                              String text;
                              if (tvSeriesDetail.numberOfSeasons != null) {
                                text =
                                    "${tvSeriesDetail.numberOfSeasons!} seasons";
                              } else if (tvSeriesDetail.numberOfEpisodes !=
                                  null) {
                                text =
                                    "${tvSeriesDetail.numberOfEpisodes!} episodes";
                              } else {
                                text = "";
                              }

                              return Text(
                                text,
                              );
                            }),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: (tvSeriesDetail.voteAverage ?? 0) / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${tvSeriesDetail.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              tvSeriesDetail.overview ?? "",
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            SizedBox(
                              height: 150,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final tvSeries = recommendations[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          kRouteNameTvSeriesDetail,
                                          arguments: tvSeries.id,
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}',
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: recommendations.length,
                              ),
                            ),
                            // Consumer<TvSeriesDetailNotifier>(
                            //   builder: (context, data, child) {
                            //     if (data.recommendationState ==
                            //         RequestState.loading) {
                            //       return const Center(
                            //         child: CircularProgressIndicator(),
                            //       );
                            //     } else if (data.recommendationState ==
                            //         RequestState.error) {
                            //       return Text(data.message);
                            //     } else if (data.recommendationState ==
                            //         RequestState.loaded) {
                            //       return SizedBox(
                            //         height: 150,
                            //         child: ListView.builder(
                            //           scrollDirection: Axis.horizontal,
                            //           itemBuilder: (context, index) {
                            //             final tvSeries = recommendations[index];
                            //             return Padding(
                            //               padding: const EdgeInsets.all(4.0),
                            //               child: InkWell(
                            //                 onTap: () {
                            //                   Navigator.pushReplacementNamed(
                            //                     context,
                            //                     kRouteNameTvSeriesDetail,
                            //                     arguments: tvSeries.id,
                            //                   );
                            //                 },
                            //                 child: ClipRRect(
                            //                   borderRadius:
                            //                       const BorderRadius.all(
                            //                     Radius.circular(8),
                            //                   ),
                            //                   child: CachedNetworkImage(
                            //                     imageUrl:
                            //                         'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}',
                            //                     placeholder: (context, url) =>
                            //                         const Center(
                            //                       child:
                            //                           CircularProgressIndicator(),
                            //                     ),
                            //                     errorWidget:
                            //                         (context, url, error) =>
                            //                             const Icon(Icons.error),
                            //                   ),
                            //                 ),
                            //               ),
                            //             );
                            //           },
                            //           itemCount: recommendations.length,
                            //         ),
                            //       );
                            //     } else {
                            //       return Container();
                            //     }
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              key: const Key('tv_series_detail_back'),
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
