import 'package:ditonton/domain/entities/movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/state_freezed.dart';
import '../../../../domain/usecases/get_now_playing_movies.dart';

part 'movies_list_now_playing_event.dart';

part 'movies_list_now_playing_bloc.freezed.dart';

class MoviesListNowPlayingBloc
    extends Bloc<MoviesListNowPlayingEvent, RequestStateFr<List<Movie>>> {
  final GetNowPlayingMovies _getNowPlayingMovies;

  MoviesListNowPlayingBloc({
    required GetNowPlayingMovies getNowPlayingMovies,
  })  : _getNowPlayingMovies = getNowPlayingMovies,
        super(const RequestStateFr.initial()) {
    on<MoviesListNowPlayingEvent>((event, emit) async {
      await event.map(
        started: (value) {
          return fetchNowPlaying(emit: emit);
        },
      );
    });
  }

  Future<void> fetchNowPlaying({
    required Emitter<RequestStateFr<List<Movie>>> emit,
  }) async {
    emit(const RequestStateFr.loading());

    final result = await _getNowPlayingMovies.execute();
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
