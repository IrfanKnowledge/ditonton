part of 'movies_detail_load_watchlist_status_bloc.dart';

@freezed
class MoviesDetailLoadWatchlistStatusState extends Equatable with _$MoviesDetailLoadWatchlistStatusState {
  const MoviesDetailLoadWatchlistStatusState._();

  const factory MoviesDetailLoadWatchlistStatusState({
    @Default(false) final bool isAddedToWatchList,
  }) = _MoviesDetailLoadWatchlistStatusState;

  @override
  List<Object?> get props => [
    isAddedToWatchList,
  ];
}
