part of 'tv_series_detail_load_watchlist_status_bloc.dart';

@freezed
class TvSeriesDetailLoadWatchlistStatusEvent with _$TvSeriesDetailLoadWatchlistStatusEvent {
  const factory TvSeriesDetailLoadWatchlistStatusEvent.started(int id) = _Started;
}
