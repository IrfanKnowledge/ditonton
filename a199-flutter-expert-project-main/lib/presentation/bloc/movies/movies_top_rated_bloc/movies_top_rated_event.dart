part of 'movies_top_rated_bloc.dart';

@freezed
class MoviesTopRatedEvent with _$MoviesTopRatedEvent {
  const factory MoviesTopRatedEvent.started() = _Started;
}
