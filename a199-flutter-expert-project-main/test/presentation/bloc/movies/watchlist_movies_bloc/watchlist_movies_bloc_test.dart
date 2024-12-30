import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton/presentation/bloc/movies/watchlist_movies_bloc/watchlist_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'watchlist_movies_bloc_test.mocks.dart';

///
/// Bloc [WatchlistMoviesBloc],
/// bergantung pada usecase [GetWatchlistMovies]
///
@GenerateMocks([
  GetWatchlistMovies,
])
void main() {
  late WatchlistMoviesBloc bloc;
  late MockGetWatchlistMovies mockUseCase;

  setUp(
    () {
      mockUseCase = MockGetWatchlistMovies();
      bloc = WatchlistMoviesBloc(
        getWatchlistMoviesUseCase: mockUseCase,
      );
    },
  );

  test(
    'should have state initial, '
    'when bloc still on initialState',
    () {
      expect(bloc.state, const RequestStateFr<List<Movie>>.initial());
    },
  );

  blocTest<WatchlistMoviesBloc, RequestStateFr<List<Movie>>>(
    'should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(
        mockUseCase.execute(),
      ).thenAnswer(
        (_) async => const Right([testWatchlistMovie]),
      );

      return WatchlistMoviesBloc(getWatchlistMoviesUseCase: mockUseCase);
    },
    act: (bloc) {
      return bloc.add(const WatchlistMoviesEvent.started());
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<List<Movie>>>[
      const RequestStateFr.loading(),
      const RequestStateFr.loaded([testWatchlistMovie]),
    ],
    verify: (_) {
      verify(mockUseCase.execute());
    },
  );

  blocTest<WatchlistMoviesBloc, RequestStateFr<List<Movie>>>(
    'should emit [Loading, Error] when data is gotten unsuccessful',
    build: () {
      when(
        mockUseCase.execute(),
      ).thenAnswer(
        (_) async => const Left(DatabaseFailure("Can't get data")),
      );

      return WatchlistMoviesBloc(getWatchlistMoviesUseCase: mockUseCase);
    },
    act: (bloc) {
      return bloc.add(const WatchlistMoviesEvent.started());
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<List<Movie>>>[
      const RequestStateFr.loading(),
      const RequestStateFr.error("Can't get data"),
    ],
    verify: (_) {
      verify(mockUseCase.execute());
    },
  );
}
