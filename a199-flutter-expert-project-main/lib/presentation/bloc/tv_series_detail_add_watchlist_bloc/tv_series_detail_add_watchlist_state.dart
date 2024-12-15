part of 'tv_series_detail_add_watchlist_bloc.dart';

@freezed
class TvSeriesDetailAddWatchlistState extends Equatable
    with _$TvSeriesDetailAddWatchlistState {
  const TvSeriesDetailAddWatchlistState._();

  const factory TvSeriesDetailAddWatchlistState({
    @Default('') final String watchlistMessage,
  }) = _Initial;

  @override
  List<Object?> get props => [
        watchlistMessage,
      ];
}
