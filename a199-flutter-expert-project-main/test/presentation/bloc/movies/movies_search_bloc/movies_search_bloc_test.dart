import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/presentation/bloc/movies/movies_search_bloc/movies_search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movies_search_bloc_test.mocks.dart';

///
/// Bloc [MoviesSearchBloc],
/// bergantung pada usecase [SearchMovies]
///
@GenerateMocks([SearchMovies])
void main() {
  late MoviesSearchBloc bloc;
  late MockSearchMovies mockUseCase;

  setUp(
    () {
      mockUseCase = MockSearchMovies();
      bloc = MoviesSearchBloc(
        searchMovies: mockUseCase,
      );
    },
  );

  const tMovieModel = Movie(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );
  final tMovieList = <Movie>[tMovieModel];
  const tQuery = 'spiderman';

  test(
    'should have state initial, '
    'when bloc still on initialState',
    () {
      expect(bloc.state, const RequestStateFr<List<Movie>>.initial());
    },
  );

  blocTest<MoviesSearchBloc, RequestStateFr<List<Movie>>>(
    'should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(
        mockUseCase.execute(tQuery),
      ).thenAnswer(
        (_) async => Right(tMovieList),
      );

      return MoviesSearchBloc(
        searchMovies: mockUseCase,
      );
    },
    act: (bloc) {
      return bloc.add(const MoviesSearchEvent.onQueryChanged(tQuery));
    },
    wait: const Duration(milliseconds: 500),
    expect: () => <RequestStateFr<List<Movie>>>[
      const RequestStateFr.loading(),
      RequestStateFr.loaded(tMovieList),
    ],
    verify: (_) {
      verify(
        mockUseCase.execute(tQuery),
      );
    },
  );

  blocTest<MoviesSearchBloc, RequestStateFr<List<Movie>>>(
    'should emit [Loading, Error] when data is gotten successfully',
    build: () {
      when(
        mockUseCase.execute(tQuery),
      ).thenAnswer(
        (_) async => const Left(ServerFailure('Server Failure')),
      );

      return MoviesSearchBloc(
        searchMovies: mockUseCase,
      );
    },
    act: (bloc) {
      return bloc.add(const MoviesSearchEvent.onQueryChanged(tQuery));
    },
    wait: const Duration(milliseconds: 500),
    expect: () => <RequestStateFr<List<Movie>>>[
      const RequestStateFr.loading(),
      const RequestStateFr.error('Server Failure')
    ],
    verify: (_) {
      verify(
        mockUseCase.execute(tQuery),
      );
    },
  );
}
