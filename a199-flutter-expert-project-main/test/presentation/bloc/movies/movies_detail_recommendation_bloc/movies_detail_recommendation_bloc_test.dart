import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/presentation/bloc/movies/movies_detail_recommendation_bloc/movies_detail_recommendation_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movies_detail_recommendation_bloc_test.mocks.dart';

///
/// Bloc [MoviesDetailRecommendationBloc],
/// bergantung pada usecase [GetMovieRecommendations]
///
@GenerateMocks([
  GetMovieRecommendations,
])
void main() {
  late MoviesDetailRecommendationBloc bloc;
  late MockGetMovieRecommendations mockGetMoviesDetailRecom;

  setUp(
    () {
      mockGetMoviesDetailRecom = MockGetMovieRecommendations();
      bloc = MoviesDetailRecommendationBloc(
        getMovieRecommendations: mockGetMoviesDetailRecom,
      );
    },
  );

  const tId = 1;

  const tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );
  final tMovies = <Movie>[tMovie];

  test(
    'should have state initial, '
    'when bloc still on initialState',
    () {
      expect(bloc.state, const RequestStateFr<List<Movie>>.initial());
    },
  );

  blocTest<MoviesDetailRecommendationBloc, RequestStateFr<List<Movie>>>(
    'should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(
        mockGetMoviesDetailRecom.execute(tId),
      ).thenAnswer((_) async => Right(tMovies));

      return MoviesDetailRecommendationBloc(
        getMovieRecommendations: mockGetMoviesDetailRecom,
      );
    },
    act: (bloc) {
      return bloc.add(const MoviesDetailRecommendationEvent.started(tId));
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<List<Movie>>>[
      const RequestStateFr.loading(),
      RequestStateFr.loaded(tMovies),
    ],
    verify: (_) {
      verify(
        mockGetMoviesDetailRecom.execute(tId),
      );
    },
  );

  blocTest<MoviesDetailRecommendationBloc, RequestStateFr<List<Movie>>>(
    'should emit [Loading, Error] when data is gotten unsuccessful',
    build: () {
      when(
        mockGetMoviesDetailRecom.execute(tId),
      ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      return MoviesDetailRecommendationBloc(
        getMovieRecommendations: mockGetMoviesDetailRecom,
      );
    },
    act: (bloc) {
      return bloc.add(const MoviesDetailRecommendationEvent.started(tId));
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<List<Movie>>>[
      const RequestStateFr.loading(),
      const RequestStateFr.error('Server Failure'),
    ],
    verify: (_) {
      verify(
        mockGetMoviesDetailRecom.execute(tId),
      );
    },
  );
}
