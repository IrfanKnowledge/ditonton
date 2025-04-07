import 'package:ditonton/common/state_freezed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/movie_detail.dart';
import '../../../../domain/usecases/get_movie_detail.dart';

part 'movie_detail_event.dart';
part 'movies_detail_bloc.freezed.dart';

class MoviesDetailBloc
    extends Bloc<MoviesDetailEvent, RequestStateFr<MovieDetail>> {
  final GetMovieDetail _getMovieDetailUseCase;

  MoviesDetailBloc({
    required GetMovieDetail getMovieDetailUseCase,
  })  : _getMovieDetailUseCase = getMovieDetailUseCase,
        super(const RequestStateFr.initial()) {
    on<MoviesDetailEvent>((event, emit) async {
      await event.map(
        started: (value) {
          final int id = value.id;
          return fetchMoviesDetail(emit: emit, id: id);
        },
      );
    });
  }

  Future<void> fetchMoviesDetail({
    required Emitter<RequestStateFr<MovieDetail>> emit,
    required int id,
  }) async {
    emit(const RequestStateFr.loading());

    final detailResult = await _getMovieDetailUseCase.execute(id);

    detailResult.fold(
      (failure) {
        emit(RequestStateFr.error(failure.message));
      },
      (movieDetail) {
        emit(RequestStateFr.loaded(movieDetail));
      },
    );
  }
}
