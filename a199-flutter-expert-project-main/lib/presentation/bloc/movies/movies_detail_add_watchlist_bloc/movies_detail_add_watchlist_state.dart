part of 'movies_detail_add_watchlist_bloc.dart';

@freezed
class MoviesDetailAddWatchlistState extends Equatable
    with _$MoviesDetailAddWatchlistState {
  const MoviesDetailAddWatchlistState._();

  const factory MoviesDetailAddWatchlistState({
    @Default('') final String watchlistMessage,
  }) = _Initial;

  @override
  List<Object?> get props => [
        watchlistMessage,
      ];
}
