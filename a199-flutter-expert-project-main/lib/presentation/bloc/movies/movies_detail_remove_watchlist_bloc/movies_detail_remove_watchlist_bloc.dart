import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/movie_detail.dart';
import '../../../../domain/usecases/remove_watchlist.dart';

part 'movies_detail_remove_watchlist_bloc.freezed.dart';

part 'movies_detail_remove_watchlist_event.dart';

part 'movies_detail_remove_watchlist_state.dart';

class MoviesDetailRemoveWatchlistBloc extends Bloc<
    MoviesDetailRemoveWatchlistEvent, MoviesDetailRemoveWatchlistState> {
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';
  static const watchlistRemoveResetMessage = '';

  final RemoveWatchlist _removeWatchlistUseCase;

  MoviesDetailRemoveWatchlistBloc({
    required RemoveWatchlist removeWatchlistUseCase,
  })  : _removeWatchlistUseCase = removeWatchlistUseCase,
        super(const MoviesDetailRemoveWatchlistState(watchlistMessage: '')) {
    on<MoviesDetailRemoveWatchlistEvent>((event, emit) async {
      await event.map(
        started: (value) {
          final MovieDetail movieDetail = value.movieDetail;
          return removeFromWatchlist(emit: emit, movieDetail: movieDetail);
        },
      );
    });
  }

  Future<void> removeFromWatchlist({
    required Emitter<MoviesDetailRemoveWatchlistState> emit,
    required MovieDetail movieDetail,
  }) async {
    final result = await _removeWatchlistUseCase.execute(
      movieDetail,
    );

    result.fold(
      (l) async {
        emit(MoviesDetailRemoveWatchlistState(watchlistMessage: l.message));
      },
      (r) async {
        emit(MoviesDetailRemoveWatchlistState(watchlistMessage: r));
        emit(const MoviesDetailRemoveWatchlistState(
            watchlistMessage: watchlistRemoveResetMessage));
      },
    );
  }
}
