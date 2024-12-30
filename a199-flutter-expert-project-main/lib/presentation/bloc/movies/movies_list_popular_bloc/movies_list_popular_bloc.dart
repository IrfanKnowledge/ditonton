import 'package:ditonton/domain/entities/movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/state_freezed.dart';
import '../../../../domain/usecases/get_popular_movies.dart';

part 'movies_list_popular_event.dart';

part 'movies_list_popular_bloc.freezed.dart';

class MoviesListPopularBloc
    extends Bloc<MoviesListPopularEvent, RequestStateFr<List<Movie>>> {
  final GetPopularMovies _getPopularMovies;

  MoviesListPopularBloc({
    required GetPopularMovies getPopularMovies,
  })  : _getPopularMovies = getPopularMovies,
        super(const RequestStateFr.initial()) {
    on<MoviesListPopularEvent>((event, emit) async {
      await event.map(
        started: (value) {
          return fetchPopular(emit: emit);
        },
      );
    });
  }

  Future<void> fetchPopular({
    required Emitter<RequestStateFr<List<Movie>>> emit,
  }) async {
    emit(const RequestStateFr.loading());

    final result = await _getPopularMovies.execute();
    result.fold(
      (l) {
        emit(RequestStateFr.error(l.message));
      },
      (r) {
        emit(RequestStateFr.loaded(r));
      },
    );
  }
}
