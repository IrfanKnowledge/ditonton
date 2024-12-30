import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/state_freezed.dart';
import '../../../../domain/entities/movie.dart';
import '../../../../domain/usecases/get_watchlist_movies.dart';

part 'watchlist_movies_bloc.freezed.dart';
part 'watchlist_movies_event.dart';

class WatchlistMoviesBloc
    extends Bloc<WatchlistMoviesEvent, RequestStateFr<List<Movie>>> {
  final GetWatchlistMovies _getWatchlistMoviesUseCase;

  WatchlistMoviesBloc({
    required GetWatchlistMovies getWatchlistMoviesUseCase,
  })  : _getWatchlistMoviesUseCase = getWatchlistMoviesUseCase,
        super(const RequestStateFr.initial()) {
    on<WatchlistMoviesEvent>((event, emit) async {
      await event.map(
        started: (value) {
          return fetchWatchlistMovies(emit: emit);
        },
      );
    });
  }

  Future<void> fetchWatchlistMovies({
    required Emitter<RequestStateFr<List<Movie>>> emit,
  }) async {
    emit(const RequestStateFr.loading());

    final result = await _getWatchlistMoviesUseCase.execute();
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
