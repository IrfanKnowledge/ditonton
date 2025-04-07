import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/state_freezed.dart';
import '../../../../domain/entities/movie.dart';
import '../../../../domain/usecases/get_popular_movies.dart';

part 'movies_popular_bloc.freezed.dart';
part 'movies_popular_event.dart';

class MoviesPopularBloc
    extends Bloc<MoviesPopularEvent, RequestStateFr<List<Movie>>> {
  final GetPopularMovies _getPopularMovies;

  MoviesPopularBloc({
    required GetPopularMovies getPopularMovies,
  })  : _getPopularMovies = getPopularMovies,
        super(const RequestStateFr.initial()) {
    on<MoviesPopularEvent>((event, emit) async {
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
