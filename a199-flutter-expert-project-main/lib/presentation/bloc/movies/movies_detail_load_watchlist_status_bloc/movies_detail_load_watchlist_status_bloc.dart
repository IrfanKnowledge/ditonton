import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/usecases/get_watchlist_status.dart';

part 'movies_detail_load_watchlist_status_bloc.freezed.dart';

part 'movies_detail_load_watchlist_status_event.dart';

part 'movies_detail_load_watchlist_status_state.dart';

class MoviesDetailLoadWatchlistStatusBloc extends Bloc<
    MoviesDetailLoadWatchlistStatusEvent,
    MoviesDetailLoadWatchlistStatusState> {
  final GetWatchListStatus _getWatchListStatusUseCase;

  MoviesDetailLoadWatchlistStatusBloc({
    required GetWatchListStatus getWatchListStatusUseCase,
  })  : _getWatchListStatusUseCase = getWatchListStatusUseCase,
        super(const MoviesDetailLoadWatchlistStatusState(
            isAddedToWatchList: false)) {
    on<MoviesDetailLoadWatchlistStatusEvent>((event, emit) async {
      await event.map(
        started: (value) {
          final id = value.id;
          return loadWatchlistStatus(emit: emit, id: id);
        },
      );
    });
  }

  Future<void> loadWatchlistStatus({
    required Emitter<MoviesDetailLoadWatchlistStatusState> emit,
    required int id,
  }) async {
    final result = await _getWatchListStatusUseCase.execute(id);

    emit(MoviesDetailLoadWatchlistStatusState(isAddedToWatchList: result));
  }
}
