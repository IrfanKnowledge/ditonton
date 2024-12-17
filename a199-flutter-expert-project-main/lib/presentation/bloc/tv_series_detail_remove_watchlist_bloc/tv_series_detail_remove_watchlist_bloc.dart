import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/tv_series_detail.dart';
import '../../../domain/usecases/remove_watchlist_tv_series.dart';

part 'tv_series_detail_remove_watchlist_event.dart';

part 'tv_series_detail_remove_watchlist_state.dart';

part 'tv_series_detail_remove_watchlist_bloc.freezed.dart';

class TvSeriesDetailRemoveWatchlistBloc extends Bloc<
    TvSeriesDetailRemoveWatchlistEvent, TvSeriesDetailRemoveWatchlistState> {
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';
  static const watchlistRemoveResetMessage = '';

  final RemoveWatchlistTvSeries _removeWatchlistTvSeriesUseCase;

  TvSeriesDetailRemoveWatchlistBloc({
    required RemoveWatchlistTvSeries removeWatchlistTvSeriesUseCase,
  })  : _removeWatchlistTvSeriesUseCase = removeWatchlistTvSeriesUseCase,
        super(const TvSeriesDetailRemoveWatchlistState(watchlistMessage: '')) {
    on<TvSeriesDetailRemoveWatchlistEvent>((event, emit) async {
      await event.map(
        started: (value) {
          final TvSeriesDetail tvSeriesDetail = value.tvSeriesDetail;
          return removeFromWatchlist(emit: emit, tvSeriesDetail: tvSeriesDetail);
        },
      );
    });
  }

  Future<void> removeFromWatchlist({
    required Emitter<TvSeriesDetailRemoveWatchlistState> emit,
    required TvSeriesDetail tvSeriesDetail,
  }) async {
    final result = await _removeWatchlistTvSeriesUseCase.execute(
      RemoveWatchlistTvSeriesParams(tvSeriesDetail: tvSeriesDetail),
    );

    result.fold(
      (l) async {
        emit(TvSeriesDetailRemoveWatchlistState(watchlistMessage: l.message));
      },
      (r) async {
        emit(TvSeriesDetailRemoveWatchlistState(watchlistMessage: r));
        emit(const TvSeriesDetailRemoveWatchlistState(watchlistMessage: watchlistRemoveResetMessage));
      },
    );
  }
}
