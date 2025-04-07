part of 'movies_detail_load_watchlist_status_bloc.dart';

@freezed
class MoviesDetailLoadWatchlistStatusEvent with _$MoviesDetailLoadWatchlistStatusEvent {
  const factory MoviesDetailLoadWatchlistStatusEvent.started(int id) = _Started;
}
