import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../common/state_freezed.dart';
import '../../../../domain/entities/movie.dart';
import '../../../../domain/usecases/search_movies.dart';

part 'movies_search_event.dart';

part 'movies_search_bloc.freezed.dart';

class MoviesSearchBloc
    extends Bloc<MoviesSearchEvent, RequestStateFr<List<Movie>>> {
  final SearchMovies _searchMovies;

  MoviesSearchBloc({
    required SearchMovies searchMovies,
  })  : _searchMovies = searchMovies,
        super(const RequestStateFr.initial()) {
    on<MoviesSearchEvent>(
      (event, emit) async {
        await event.map(
          onQueryChanged: (value) {
            return fetchMoviesSearch(
              emit: emit,
              query: value.query,
            );
          },
        );
      },
      transformer: debounceTime(const Duration(milliseconds: 500)),
    );
  }

  Future<void> fetchMoviesSearch({
    required Emitter<RequestStateFr<List<Movie>>> emit,
    required String query,
  }) async {
    emit(const RequestStateFr.loading());

    final result = await _searchMovies.execute(query);
    result.fold(
      (l) {
        emit(RequestStateFr.error(l.message));
      },
      (r) {
        emit(RequestStateFr.loaded(r));
      },
    );
  }

  EventTransformer<T> debounceTime<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
