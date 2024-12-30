import 'package:ditonton/domain/entities/movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/state_freezed.dart';
import '../../../../domain/usecases/get_top_rated_movies.dart';

part 'movies_list_top_rated_bloc.freezed.dart';
part 'movies_list_top_rated_event.dart';

class MoviesListTopRatedBloc
    extends Bloc<MoviesListTopRatedEvent, RequestStateFr<List<Movie>>> {
  final GetTopRatedMovies _getTopRatedMovies;

  MoviesListTopRatedBloc({
    required GetTopRatedMovies getTopRatedMovies,
  })  : _getTopRatedMovies = getTopRatedMovies,
        super(const RequestStateFr.initial()) {
    on<MoviesListTopRatedEvent>((event, emit) async {
      await event.map(
        started: (value) {
          return fetchTopRated(emit: emit);
        },
      );
    });
  }

  Future<void> fetchTopRated({
    required Emitter<RequestStateFr<List<Movie>>> emit,
  }) async {
    emit(const RequestStateFr.loading());

    final result = await _getTopRatedMovies.execute();
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
