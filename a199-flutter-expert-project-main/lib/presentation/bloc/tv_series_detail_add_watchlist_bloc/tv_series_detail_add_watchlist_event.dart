part of 'tv_series_detail_add_watchlist_bloc.dart';

@freezed
class TvSeriesDetailAddWatchlistEvent with _$TvSeriesDetailAddWatchlistEvent {
  const factory TvSeriesDetailAddWatchlistEvent.started(TvSeriesDetail tvSeriesDetail) = _Started;
}
