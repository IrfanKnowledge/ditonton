import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';

import '../../../domain/usecases/get_tv_series_searched.dart';

part 'tv_series_search_bloc.freezed.dart';

part 'tv_series_search_event.dart';

class TvSeriesSearchBloc
    extends Bloc<TvSeriesSearchEvent, RequestStateFr<List<TvSeries>>> {
  final GetTvSeriesSearched _getTvSeriesSearchedUseCase;

  TvSeriesSearchBloc({
    required GetTvSeriesSearched getTvSeriesSearchedUseCase,
  })  : _getTvSeriesSearchedUseCase = getTvSeriesSearchedUseCase,
        super(const RequestStateFr.initial()) {
    on<TvSeriesSearchEvent>(
      (event, emit) async {
        await event.map(
          onQueryChanged: (value) {
            return fetchTvSeriesSearch(
              emit: emit,
              query: value.query,
            );
          },
        );
      },
      transformer: debounceTime(const Duration(milliseconds: 500)),
    );
  }

  Future<void> fetchTvSeriesSearch({
    required Emitter<RequestStateFr<List<TvSeries>>> emit,
    required String query,
  }) async {
    emit(const RequestStateFr.loading());

    final result = await _getTvSeriesSearchedUseCase.execute(
      GetTvSeriesSearchedParams(name: query),
    );
    result.fold(
      (l) {
        emit(RequestStateFr.error(l.message));
      },
      (r) {
        emit(RequestStateFr.loaded(r));
      },
    );
  }

  EventTransformer<T> debounceTime<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
