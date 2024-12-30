part of 'watchlist_movies_bloc.dart';

@freezed
class WatchlistMoviesEvent with _$WatchlistMoviesEvent {
  const factory WatchlistMoviesEvent.started() = _Started;
}
