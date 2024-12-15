import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/tv_series_detail.dart';
import '../../../domain/usecases/save_watchlist_tv_series.dart';

part 'tv_series_detail_add_watchlist_event.dart';

part 'tv_series_detail_add_watchlist_state.dart';

part 'tv_series_detail_add_watchlist_bloc.freezed.dart';

class TvSeriesDetailAddWatchlistBloc extends Bloc<
    TvSeriesDetailAddWatchlistEvent, TvSeriesDetailAddWatchlistState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';

  final SaveWatchlistTvSeries _saveWatchlistTvSeriesUseCase;

  TvSeriesDetailAddWatchlistBloc({
    required SaveWatchlistTvSeries saveWatchlistTvSeriesUseCase,
  })  : _saveWatchlistTvSeriesUseCase = saveWatchlistTvSeriesUseCase,
        super(const TvSeriesDetailAddWatchlistState(watchlistMessage: '')) {
    on<TvSeriesDetailAddWatchlistEvent>((event, emit) {
      event.map(
        started: (value) {
          final TvSeriesDetail tvSeriesDetail = value.tvSeriesDetail;
          addWatchlist(emit: emit, tvSeriesDetail: tvSeriesDetail);
        },
      );
    });
  }

  Future<void> addWatchlist({
    required Emitter<TvSeriesDetailAddWatchlistState> emit,
    required TvSeriesDetail tvSeriesDetail,
  }) async {
    final result = await _saveWatchlistTvSeriesUseCase.execute(
      SaveWatchlistTvSeriesParams(tvSeriesDetail: tvSeriesDetail),
    );

    result.fold(
      (l) async {
        emit(
          TvSeriesDetailAddWatchlistState(watchlistMessage: l.message),
        );
      },
      (r) async {
        emit(
          TvSeriesDetailAddWatchlistState(watchlistMessage: r),
        );
      },
    );
  }
}
