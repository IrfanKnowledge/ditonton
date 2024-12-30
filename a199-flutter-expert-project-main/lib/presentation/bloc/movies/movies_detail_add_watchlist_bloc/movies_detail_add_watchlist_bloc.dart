import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/movie_detail.dart';
import '../../../../domain/usecases/save_watchlist.dart';

part 'movies_detail_add_watchlist_event.dart';

part 'movies_detail_add_watchlist_state.dart';

part 'movies_detail_add_watchlist_bloc.freezed.dart';

class MoviesDetailAddWatchlistBloc
    extends Bloc<MoviesDetailAddWatchlistEvent, MoviesDetailAddWatchlistState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistAddResetMessage = '';

  final SaveWatchlist _saveWatchlistUseCase;

  MoviesDetailAddWatchlistBloc({
    required SaveWatchlist saveWatchlistUseCase,
  })  : _saveWatchlistUseCase = saveWatchlistUseCase,
        super(const MoviesDetailAddWatchlistState(watchlistMessage: '')) {
    on<MoviesDetailAddWatchlistEvent>((event, emit) async {
      await event.map(
        started: (value) {
          final MovieDetail movieDetail = value.movieDetail;
          return addWatchlist(emit: emit, movieDetail: movieDetail);
        },
      );
    });
  }

  Future<void> addWatchlist({
    required Emitter<MoviesDetailAddWatchlistState> emit,
    required MovieDetail movieDetail,
  }) async {
    final result = await _saveWatchlistUseCase.execute(movieDetail);

    result.fold(
      (l) async {
        emit(MoviesDetailAddWatchlistState(watchlistMessage: l.message));
      },
      (r) async {
        emit(MoviesDetailAddWatchlistState(watchlistMessage: r));
        emit(const MoviesDetailAddWatchlistState(
            watchlistMessage: watchlistAddResetMessage));
      },
    );
  }
}
