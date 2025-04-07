import 'package:ditonton/common/state_freezed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/tv_series.dart';
import '../../../domain/usecases/get_tv_series_airing_today.dart';

part 'tv_series_airing_today_event.dart';

part 'tv_series_airing_today_bloc.freezed.dart';

class TvSeriesAiringTodayBloc
    extends Bloc<TvSeriesAiringTodayEvent, RequestStateFr<List<TvSeries>>> {
  final GetTvSeriesAiringToday _getTvSeriesAiringTodayUseCase;

  TvSeriesAiringTodayBloc({
    required GetTvSeriesAiringToday getTvSeriesAiringTodayUseCase,
  })  : _getTvSeriesAiringTodayUseCase = getTvSeriesAiringTodayUseCase,
        super(const RequestStateFr.initial())  {

    on<TvSeriesAiringTodayEvent>((event, emit) async {
      await event.map(
        started: (value) {
          return fetchAiringToday(emit: emit);
        },
      );
    });
  }

  Future<void> fetchAiringToday({
    required Emitter<RequestStateFr<List<TvSeries>>> emit,
  }) async {
    emit(const RequestStateFr.loading());

    final result = await _getTvSeriesAiringTodayUseCase.execute();
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
