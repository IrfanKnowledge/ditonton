part of 'movies_detail_bloc.dart';

@freezed
class MoviesDetailEvent with _$MoviesDetailEvent {
  const factory MoviesDetailEvent.started(int id) = _Started;
}
