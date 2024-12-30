import 'package:ditonton/common/state_freezed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/movie.dart';
import '../../../../domain/usecases/get_movie_recommendations.dart';

part 'movies_detail_recommendation_bloc.freezed.dart';

part 'movies_detail_recommendation_event.dart';

class MoviesDetailRecommendationBloc extends Bloc<
    MoviesDetailRecommendationEvent, RequestStateFr<List<Movie>>> {
  final GetMovieRecommendations _getMovieRecommendations;

  MoviesDetailRecommendationBloc({
    required GetMovieRecommendations getMovieRecommendations,
  })  : _getMovieRecommendations = getMovieRecommendations,
        super(const RequestStateFr.initial()) {
    on<MoviesDetailRecommendationEvent>((event, emit) async {
      await event.map(
        started: (value) {
          final int id = value.id;
          return fetchMoviesDetailRecommendation(emit: emit, id: id);
        },
      );
    });
  }

  Future<void> fetchMoviesDetailRecommendation({
    required Emitter<RequestStateFr<List<Movie>>> emit,
    required int id,
  }) async {
    emit(const RequestStateFr.loading());

    final recommendationResult = await _getMovieRecommendations.execute(id);

    recommendationResult.fold(
      (l) {
        emit(RequestStateFr.error(l.message));
      },
      (r) {
        emit(RequestStateFr.loaded(r));
      },
    );
  }
}
