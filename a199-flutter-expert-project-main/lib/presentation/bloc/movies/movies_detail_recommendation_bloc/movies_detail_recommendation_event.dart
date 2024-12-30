part of 'movies_detail_recommendation_bloc.dart';

@freezed
class MoviesDetailRecommendationEvent with _$MoviesDetailRecommendationEvent {
  const factory MoviesDetailRecommendationEvent.started(int id) = _Started;
}
