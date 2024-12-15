import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/state_freezed.dart';
import '../../../domain/entities/tv_series.dart';
import '../../../domain/usecases/get_tv_series_popular.dart';

part 'tv_series_list_popular_event.dart';
part 'tv_series_list_popular_bloc.freezed.dart';

class TvSeriesListPopularBloc extends Bloc<TvSeriesListPopularEvent, RequestStateFr<List<TvSeries>>> {
  final GetTvSeriesPopular _getTvSeriesPopularUseCase;

  TvSeriesListPopularBloc({
    required GetTvSeriesPopular getTvSeriesPopularUseCase,
  }) : _getTvSeriesPopularUseCase = getTvSeriesPopularUseCase, super(const RequestStateFr.initial()) {
    on<TvSeriesListPopularEvent>((event, emit) async {
      await event.map(
        started: (value) {
          return fetchPopular(emit: emit);
        },
      );
    });
  }

  Future<void> fetchPopular({
    required Emitter<RequestStateFr<List<TvSeries>>> emit,
  }) async {
    emit(const RequestStateFr.loading());

    final result = await _getTvSeriesPopularUseCase.execute();
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
