import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/get_watchlist_tv_series_status.dart';

part 'tv_series_detail_load_watchlist_status_bloc.freezed.dart';
part 'tv_series_detail_load_watchlist_status_event.dart';
part 'tv_series_detail_load_watchlist_status_state.dart';

class TvSeriesDetailLoadWatchlistStatusBloc extends Bloc<
    TvSeriesDetailLoadWatchlistStatusEvent,
    TvSeriesDetailLoadWatchlistStatusState> {
  final GetWatchlistStatusTvSeries _getWatchlistStatusTvSeriesUseCase;

  TvSeriesDetailLoadWatchlistStatusBloc({
    required GetWatchlistStatusTvSeries getWatchlistStatusTvSeriesUseCase,
  })  : _getWatchlistStatusTvSeriesUseCase = getWatchlistStatusTvSeriesUseCase,
        super(const TvSeriesDetailLoadWatchlistStatusState(
            isAddedToWatchList: false)) {
    on<TvSeriesDetailLoadWatchlistStatusEvent>((event, emit) async {
      await event.map(
        started: (value) {
          final id = value.id;
          return loadWatchlistStatus(emit: emit, id: id);
        },
      );
    });
  }

  Future<void> loadWatchlistStatus({
    required Emitter<TvSeriesDetailLoadWatchlistStatusState> emit,
    required int id,
  }) async {
    final result = await _getWatchlistStatusTvSeriesUseCase.execute(
      GetWatchlistStatusTvSeriesParams(id: id),
    );

    emit(TvSeriesDetailLoadWatchlistStatusState(isAddedToWatchList: result));
  }
}
