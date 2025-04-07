import 'package:ditonton/common/state_freezed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/tv_series.dart';
import '../../../domain/usecases/get_tv_series_top_rated.dart';

part 'tv_series_top_rated_bloc.freezed.dart';
part 'tv_series_top_rated_event.dart';

class TvSeriesTopRatedBloc
    extends Bloc<TvSeriesTopRatedEvent, RequestStateFr<List<TvSeries>>> {
  final GetTvSeriesTopRated _getTvSeriesTopRatedUseCase;

  TvSeriesTopRatedBloc({
    required GetTvSeriesTopRated getTvSeriesTopRatedUseCase,
  })  : _getTvSeriesTopRatedUseCase = getTvSeriesTopRatedUseCase,
        super(const RequestStateFr.initial()) {
    on<TvSeriesTopRatedEvent>((event, emit) async {
      await event.map(
        started: (value) {
          return fetchTopRated(emit: emit);
        },
      );
    });
  }

  Future<void> fetchTopRated({
    required Emitter<RequestStateFr<List<TvSeries>>> emit,
  }) async {
    emit(const RequestStateFr.loading());

    final result = await _getTvSeriesTopRatedUseCase.execute();
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
