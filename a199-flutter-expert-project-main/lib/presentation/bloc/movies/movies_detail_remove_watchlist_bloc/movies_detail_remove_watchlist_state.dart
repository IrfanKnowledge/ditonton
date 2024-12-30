part of 'movies_detail_remove_watchlist_bloc.dart';

@freezed
class MoviesDetailRemoveWatchlistState extends Equatable
    with _$MoviesDetailRemoveWatchlistState {
  const MoviesDetailRemoveWatchlistState._();

  const factory MoviesDetailRemoveWatchlistState({
    @Default('') final String watchlistMessage,
  }) = _MoviesDetailRemoveWatchlistState;

  @override
  List<Object?> get props => [
        watchlistMessage,
      ];
}
