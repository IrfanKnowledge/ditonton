part of 'tv_series_detail_load_watchlist_status_bloc.dart';

@freezed
class TvSeriesDetailLoadWatchlistStatusState extends Equatable with _$TvSeriesDetailLoadWatchlistStatusState {
  const TvSeriesDetailLoadWatchlistStatusState._();

  const factory TvSeriesDetailLoadWatchlistStatusState({
    @Default(false) final bool isAddedToWatchList,
  }) = _TvSeriesDetailLoadWatchlistStatusState;

  @override
  List<Object?> get props => [
    isAddedToWatchList,
  ];
}
