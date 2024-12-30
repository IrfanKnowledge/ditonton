import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/presentation/bloc/movies/movies_detail_load_watchlist_status_bloc/movies_detail_load_watchlist_status_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movies_detail_load_watchlist_status_bloc_test.mocks.dart';

///
/// Bloc [MoviesDetailLoadWatchlistStatusBloc],
/// bergantung pada usecase [GetWatchListStatus]
///
@GenerateMocks([
  GetWatchListStatus,
])
void main() {
  late MoviesDetailLoadWatchlistStatusBloc bloc;
  late MockGetWatchListStatus mockGetWatchListStatus;

  setUp(
    () {
      mockGetWatchListStatus = MockGetWatchListStatus();

      bloc = MoviesDetailLoadWatchlistStatusBloc(
        getWatchListStatusUseCase: mockGetWatchListStatus,
      );
    },
  );

  const tId = 1;

  bool tStatusTrue = false;

  test(
    'should have status false, '
    'when bloc still on initialState',
    () {
      expect(
        bloc.state,
        const MoviesDetailLoadWatchlistStatusState(
          isAddedToWatchList: false,
        ),
      );
    },
  );

  blocTest<MoviesDetailLoadWatchlistStatusBloc,
      MoviesDetailLoadWatchlistStatusState>(
    'should emit [isAddedToWatchList = true] when data is gotten successfully',
    setUp: () {
      tStatusTrue = true;
    },
    build: () {
      when(
        mockGetWatchListStatus.execute(tId),
      ).thenAnswer((_) async => tStatusTrue);

      return MoviesDetailLoadWatchlistStatusBloc(
        getWatchListStatusUseCase: mockGetWatchListStatus,
      );
    },
    act: (bloc) {
      return bloc.add(const MoviesDetailLoadWatchlistStatusEvent.started(tId));
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <MoviesDetailLoadWatchlistStatusState>[
      MoviesDetailLoadWatchlistStatusState(isAddedToWatchList: tStatusTrue),
    ],
    verify: (_) {
      verify(
        mockGetWatchListStatus.execute(tId),
      );
    },
  );

  blocTest<MoviesDetailLoadWatchlistStatusBloc,
      MoviesDetailLoadWatchlistStatusState>(
    'should emit [isAddedToWatchList = false] when data is gotten successfully',
    setUp: () {
      tStatusTrue = false;
    },
    build: () {
      when(
        mockGetWatchListStatus.execute(tId),
      ).thenAnswer((_) async => tStatusTrue);

      return MoviesDetailLoadWatchlistStatusBloc(
        getWatchListStatusUseCase: mockGetWatchListStatus,
      );
    },
    act: (bloc) {
      return bloc.add(const MoviesDetailLoadWatchlistStatusEvent.started(tId));
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <MoviesDetailLoadWatchlistStatusState>[
      MoviesDetailLoadWatchlistStatusState(isAddedToWatchList: tStatusTrue),
    ],
    verify: (_) {
      verify(
        mockGetWatchListStatus.execute(tId),
      );
    },
  );
}
