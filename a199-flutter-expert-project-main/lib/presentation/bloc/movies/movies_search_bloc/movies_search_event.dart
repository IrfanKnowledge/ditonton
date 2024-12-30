part of 'movies_search_bloc.dart';

@freezed
class MoviesSearchEvent with _$MoviesSearchEvent {
  const factory MoviesSearchEvent.onQueryChanged(String query) = _OnQueryChanged;
}
