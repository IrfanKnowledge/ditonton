part of 'tv_series_search_bloc.dart';

@freezed
class TvSeriesSearchEvent with _$TvSeriesSearchEvent {
  const factory TvSeriesSearchEvent.onQueryChanged(String query) = _OnQueryChanged;
}
