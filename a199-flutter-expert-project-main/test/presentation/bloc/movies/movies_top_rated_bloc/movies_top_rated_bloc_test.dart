import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/presentation/bloc/movies/movies_top_rated_bloc/movies_top_rated_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movies_top_rated_bloc_test.mocks.dart';

///
/// Bloc [MoviesTopRatedBloc],
/// bergantung pada usecase [GetTopRatedMovies]
///
@GenerateMocks([GetTopRatedMovies])
void main() {
  late MoviesTopRatedBloc bloc;
  late MockGetTopRatedMovies mockUseCase;

  setUp(
    () {
      mockUseCase = MockGetTopRatedMovies();
      bloc = MoviesTopRatedBloc(
        getTopRatedMovies: mockUseCase,
      );
    },
  );

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

  final tMovieList = <Movie>[tMovie];

  test(
    'should have state initial, '
    'when bloc still on initialState',
    () {
      expect(bloc.state, const RequestStateFr<List<Movie>>.initial());
    },
  );

  blocTest<MoviesTopRatedBloc, RequestStateFr<List<Movie>>>(
    'should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(
        mockUseCase.execute(),
      ).thenAnswer(
        (_) async => Right(tMovieList),
      );

      return MoviesTopRatedBloc(
        getTopRatedMovies: mockUseCase,
      );
    },
    act: (bloc) {
      return bloc.add(const MoviesTopRatedEvent.started());
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<List<Movie>>>[
      const RequestStateFr.loading(),
      RequestStateFr.loaded(tMovieList),
    ],
    verify: (_) {
      verify(mockUseCase.execute());
    },
  );

  blocTest<MoviesTopRatedBloc, RequestStateFr<List<Movie>>>(
    'should emit [Loading, Error] when data is gotten unsuccessful',
    build: () {
      when(
        mockUseCase.execute(),
      ).thenAnswer(
        (_) async => const Left(ServerFailure('Server Failure')),
      );

      return MoviesTopRatedBloc(
        getTopRatedMovies: mockUseCase,
      );
    },
    act: (bloc) {
      return bloc.add(const MoviesTopRatedEvent.started());
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<List<Movie>>>[
      const RequestStateFr.loading(),
      const RequestStateFr.error('Server Failure'),
    ],
    verify: (_) {
      verify(mockUseCase.execute());
    },
  );
}
