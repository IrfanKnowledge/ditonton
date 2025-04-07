import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../common/constants.dart';
import '../../../common/state_freezed.dart';
import '../../../domain/entities/genre.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/entities/movie_detail.dart';
import '../../bloc/movies/movies_detail_add_watchlist_bloc/movies_detail_add_watchlist_bloc.dart';
import '../../bloc/movies/movies_detail_bloc/movies_detail_bloc.dart';
import '../../bloc/movies/movies_detail_load_watchlist_status_bloc/movies_detail_load_watchlist_status_bloc.dart';
import '../../bloc/movies/movies_detail_recommendation_bloc/movies_detail_recommendation_bloc.dart';
import '../../bloc/movies/movies_detail_remove_watchlist_bloc/movies_detail_remove_watchlist_bloc.dart';

class MoviesDetailPage extends StatefulWidget {
  final int id;

  const MoviesDetailPage({
    super.key,
    required this.id,
  });

  @override
  State<MoviesDetailPage> createState() => _MoviesDetailPageState();
}

class _MoviesDetailPageState extends State<MoviesDetailPage> {
  @override
  void initState() {
    final blocMoviesDetail = BlocProvider.of<MoviesDetailBloc>(
      context,
      listen: false,
    );

    final blocMoviesDetailRecommendation =
        BlocProvider.of<MoviesDetailRecommendationBloc>(
      context,
      listen: false,
    );

    final blocMoviesDetailLoadWatchlistStatus =
        BlocProvider.of<MoviesDetailLoadWatchlistStatusBloc>(
      context,
      listen: false,
    );

    Future.microtask(
      () {
        blocMoviesDetail.add(MoviesDetailEvent.started(widget.id));
        blocMoviesDetailRecommendation
            .add(MoviesDetailRecommendationEvent.started(widget.id));
        blocMoviesDetailLoadWatchlistStatus
            .add(MoviesDetailLoadWatchlistStatusEvent.started(widget.id));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MoviesDetailBloc, RequestStateFr<MovieDetail>>(
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
              final MovieDetail movieDetail = value.data;

              return BlocBuilder<MoviesDetailRecommendationBloc,
                  RequestStateFr<List<Movie>>>(
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
                      final List<Movie> moviesRecommendations = value.data;

                      return BlocBuilder<MoviesDetailLoadWatchlistStatusBloc,
                          MoviesDetailLoadWatchlistStatusState>(
                        builder: (context, state) {
                          final bool isAddedToWatchlist =
                              state.isAddedToWatchList;

                          void showSnackBarWhenResponseSuccess(String message) {
                            ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar();
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

                          return BlocListener<MoviesDetailAddWatchlistBloc,
                              MoviesDetailAddWatchlistState>(
                            listener: (context, state) {
                              final message = state.watchlistMessage;
                              final isSuccess = message ==
                                  MoviesDetailAddWatchlistBloc
                                      .watchlistAddSuccessMessage;
                              final isReset = message ==
                                  MoviesDetailAddWatchlistBloc
                                      .watchlistAddResetMessage;

                              if (isSuccess) {
                                showSnackBarWhenResponseSuccess(message);

                                final blocLoad = BlocProvider.of<
                                    MoviesDetailLoadWatchlistStatusBloc>(
                                  context,
                                  listen: false,
                                );

                                blocLoad.add(
                                    MoviesDetailLoadWatchlistStatusEvent
                                        .started(widget.id));
                              } else if (isReset) {
                                return;
                              } else {
                                showDialogWhenResponseFailed(message);
                              }
                            },
                            child: BlocListener<MoviesDetailRemoveWatchlistBloc,
                                MoviesDetailRemoveWatchlistState>(
                              listener: (context, state) {
                                final message = state.watchlistMessage;
                                final isSuccess = message ==
                                    MoviesDetailRemoveWatchlistBloc
                                        .watchlistRemoveSuccessMessage;
                                final isReset = message ==
                                    MoviesDetailRemoveWatchlistBloc
                                        .watchlistRemoveResetMessage;

                                if (isSuccess) {
                                  showSnackBarWhenResponseSuccess(message);

                                  final blocLoad = BlocProvider.of<
                                      MoviesDetailLoadWatchlistStatusBloc>(
                                    context,
                                    listen: false,
                                  );
                                  blocLoad.add(
                                      MoviesDetailLoadWatchlistStatusEvent
                                          .started(widget.id));
                                } else if (isReset) {
                                  return;
                                } else {
                                  showDialogWhenResponseFailed(message);
                                }
                              },
                              child: SafeArea(
                                child: _DetailContent(
                                  movieDetail,
                                  moviesRecommendations,
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
    );
  }
}

class _DetailContent extends StatelessWidget {
  final MovieDetail moviesDetail;
  final List<Movie> recommendations;
  final bool isAddedWatchlist;

  const _DetailContent(
    this.moviesDetail,
    this.recommendations,
    this.isAddedWatchlist,
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${moviesDetail.posterPath}',
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
                              moviesDetail.title,
                              style: kHeading5,
                            ),
                            Builder(builder: (_) {
                              final blocMoviesDetailAddWatchlist =
                                  BlocProvider.of<MoviesDetailAddWatchlistBloc>(
                                context,
                                listen: false,
                              );

                              final blocMoviesDetailRemoveWatchlistBloc =
                                  BlocProvider.of<
                                      MoviesDetailRemoveWatchlistBloc>(
                                context,
                                listen: false,
                              );

                              return ElevatedButton(
                                onPressed: () async {
                                  if (!isAddedWatchlist) {
                                    blocMoviesDetailAddWatchlist.add(
                                      MoviesDetailAddWatchlistEvent.started(
                                        moviesDetail,
                                      ),
                                    );
                                  } else {
                                    blocMoviesDetailRemoveWatchlistBloc.add(
                                      MoviesDetailRemoveWatchlistEvent.started(
                                        moviesDetail,
                                      ),
                                    );
                                  }
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
                              _showGenres(moviesDetail.genres),
                            ),
                            Text(
                              _showDuration(moviesDetail.runtime),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: moviesDetail.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${moviesDetail.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              moviesDetail.overview,
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
                                  final movie = recommendations[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          kRouteNameMoviesDetail,
                                          arguments: movie.id,
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
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
              key: const Key('movie_detail_back'),
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

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
