import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/get_tv_series_detail_recommendtaions.dart';

part 'tv_series_detail_recommendation_bloc.freezed.dart';
part 'tv_series_detail_recommendation_event.dart';

class TvSeriesDetailRecommendationBloc extends Bloc<
    TvSeriesDetailRecommendationEvent, RequestStateFr<List<TvSeries>>> {
  final GetTvSeriesDetailRecommendations _getTvSeriesDetailRecommendations;

  TvSeriesDetailRecommendationBloc({
    required GetTvSeriesDetailRecommendations getTvSeriesDetailRecommendations,
  })  : _getTvSeriesDetailRecommendations = getTvSeriesDetailRecommendations,
        super(const RequestStateFr.initial()) {
    on<TvSeriesDetailRecommendationEvent>((event, emit) {
      event.map(
        started: (value) {
          final int id = value.id;
          fetchTvSeriesDetailRecommendation(emit: emit, id: id);
        },
      );
    });
  }

  Future<void> fetchTvSeriesDetailRecommendation({
    required Emitter<RequestStateFr<List<TvSeries>>> emit,
    required int id,
  }) async {
    emit(const RequestStateFr.loading());

    final recommendationResult =
        await _getTvSeriesDetailRecommendations.execute(
      GetTvSeriesDetailRecommendationsParams(id: id),
    );

    recommendationResult.fold(
      (l) {
        emit(RequestStateFr.error(l.message));
      },
      (r) {
        emit(RequestStateFr.loaded(r));
      },
    );
  }
}
