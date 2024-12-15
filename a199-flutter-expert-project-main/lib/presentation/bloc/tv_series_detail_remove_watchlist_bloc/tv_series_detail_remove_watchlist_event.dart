part of 'tv_series_detail_remove_watchlist_bloc.dart';

@freezed
class TvSeriesDetailRemoveWatchlistEvent with _$TvSeriesDetailRemoveWatchlistEvent {
  const factory TvSeriesDetailRemoveWatchlistEvent.started(TvSeriesDetail tvSeriesDetail) = _Started;
}
