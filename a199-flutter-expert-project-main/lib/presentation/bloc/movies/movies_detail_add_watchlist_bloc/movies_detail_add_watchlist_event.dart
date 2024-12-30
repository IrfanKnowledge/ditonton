part of 'movies_detail_add_watchlist_bloc.dart';

@freezed
class MoviesDetailAddWatchlistEvent with _$MoviesDetailAddWatchlistEvent {
  const factory MoviesDetailAddWatchlistEvent.started(MovieDetail movieDetail) = _Started;
}
