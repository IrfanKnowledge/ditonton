part of 'movies_list_now_playing_bloc.dart';

@freezed
class MoviesListNowPlayingEvent with _$MoviesListNowPlayingEvent {
  const factory MoviesListNowPlayingEvent.started() = _Started;
}
