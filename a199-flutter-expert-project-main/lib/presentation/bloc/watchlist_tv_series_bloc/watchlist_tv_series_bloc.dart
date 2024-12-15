import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/state_freezed.dart';
import '../../../domain/entities/tv_series.dart';
import '../../../domain/usecases/get_watchedlist_tv_series.dart';

part 'watchlist_tv_series_bloc.freezed.dart';
part 'watchlist_tv_series_event.dart';

class WatchlistTvSeriesBloc
    extends Bloc<WatchlistTvSeriesEvent, RequestStateFr<List<TvSeries>>> {
  final GetWatchlistTvSeries _getWatchlistTvSeriesUseCase;

  WatchlistTvSeriesBloc({
    required GetWatchlistTvSeries getWatchlistTvSeriesUseCase,
  })  : _getWatchlistTvSeriesUseCase = getWatchlistTvSeriesUseCase,
        super(const RequestStateFr.initial()) {
    on<WatchlistTvSeriesEvent>((event, emit) async {
      await event.map(
        started: (value) {
          return fetchWatchlistTvSeries(emit: emit);
        },
      );
    });
  }

  Future<void> fetchWatchlistTvSeries({
    required Emitter<RequestStateFr<List<TvSeries>>> emit,
  }) async {
    emit(const RequestStateFr.loading());

    final result = await _getWatchlistTvSeriesUseCase.execute();
    result.fold(
      (l) {
        emit(RequestStateFr.error(l.message));
      },
      (r) {
        emit(RequestStateFr.loaded(r));
      },
    );
  }
}
