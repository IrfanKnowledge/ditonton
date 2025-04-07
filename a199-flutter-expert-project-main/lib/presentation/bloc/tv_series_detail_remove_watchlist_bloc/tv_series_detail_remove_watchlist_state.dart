part of 'tv_series_detail_remove_watchlist_bloc.dart';

@freezed
class TvSeriesDetailRemoveWatchlistState extends Equatable
    with _$TvSeriesDetailRemoveWatchlistState {
  const TvSeriesDetailRemoveWatchlistState._();

  const factory TvSeriesDetailRemoveWatchlistState({
    @Default('') final String watchlistMessage,
  }) = _TvSeriesDetailRemoveWatchlistState;

  @override
  List<Object?> get props => [
    watchlistMessage,
  ];
}
