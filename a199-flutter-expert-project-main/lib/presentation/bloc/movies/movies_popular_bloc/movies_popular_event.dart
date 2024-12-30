part of 'movies_popular_bloc.dart';

@freezed
class MoviesPopularEvent with _$MoviesPopularEvent {
  const factory MoviesPopularEvent.started() = _Started;
}
