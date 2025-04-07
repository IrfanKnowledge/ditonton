part of 'tv_series_detail_bloc.dart';

@freezed
class TvSeriesDetailEvent with _$TvSeriesDetailEvent {
  const factory TvSeriesDetailEvent.started(int id) = _Started;
}
