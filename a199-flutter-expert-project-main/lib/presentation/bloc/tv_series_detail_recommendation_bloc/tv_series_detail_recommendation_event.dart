part of 'tv_series_detail_recommendation_bloc.dart';

@freezed
class TvSeriesDetailRecommendationEvent with _$TvSeriesDetailRecommendationEvent {
  const factory TvSeriesDetailRecommendationEvent.started(int id) = _Started;
}
