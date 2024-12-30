part of 'movies_detail_remove_watchlist_bloc.dart';

@freezed
class MoviesDetailRemoveWatchlistEvent with _$MoviesDetailRemoveWatchlistEvent {
  const factory MoviesDetailRemoveWatchlistEvent.started(
      MovieDetail movieDetail) = _Started;
}
