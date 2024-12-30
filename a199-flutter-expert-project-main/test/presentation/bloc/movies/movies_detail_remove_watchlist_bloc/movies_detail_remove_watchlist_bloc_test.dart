import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/presentation/bloc/movies/movies_detail_remove_watchlist_bloc/movies_detail_remove_watchlist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movies_detail_remove_watchlist_bloc_test.mocks.dart';

///
/// Bloc [MoviesDetailRemoveWatchlistBloc],
/// bergantung pada usecase [RemoveWatchlist]
///
@GenerateMocks([
  RemoveWatchlist,
])
void main() {
  late MoviesDetailRemoveWatchlistBloc bloc;
  late MockRemoveWatchlist mockRemoveWatchlist;

  setUp(
    () {
      mockRemoveWatchlist = MockRemoveWatchlist();

      bloc = MoviesDetailRemoveWatchlistBloc(
        removeWatchlistUseCase: mockRemoveWatchlist,
      );
    },
  );

  String tMessage = '';

  test(
    'should have message empty, '
    'when bloc still on initialState',
    () {
      expect(
        bloc.state,
        const MoviesDetailRemoveWatchlistState(
          watchlistMessage: '',
        ),
      );
    },
  );

  blocTest<MoviesDetailRemoveWatchlistBloc, MoviesDetailRemoveWatchlistState>(
    'should emit [watchlistMessage = "Removed from Watchlist"] when data is saved successfully',
    setUp: () {
      tMessage = MoviesDetailRemoveWatchlistBloc.watchlistRemoveSuccessMessage;
    },
    build: () {
      when(
        mockRemoveWatchlist.execute(testMovieDetail),
      ).thenAnswer((_) async => Right(tMessage));

      return MoviesDetailRemoveWatchlistBloc(
        removeWatchlistUseCase: mockRemoveWatchlist,
      );
    },
    act: (bloc) {
      return bloc.add(
        const MoviesDetailRemoveWatchlistEvent.started(testMovieDetail),
      );
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <MoviesDetailRemoveWatchlistState>[
      MoviesDetailRemoveWatchlistState(watchlistMessage: tMessage),
      const MoviesDetailRemoveWatchlistState(
          watchlistMessage:
              MoviesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage),
    ],
    verify: (_) {
      verify(
        mockRemoveWatchlist.execute(
          testMovieDetail,
        ),
      );
    },
  );

  blocTest<MoviesDetailRemoveWatchlistBloc, MoviesDetailRemoveWatchlistState>(
    'should emit [watchlistMessage = "Error"] when data is saved successfully',
    setUp: () {
      tMessage = 'error';
    },
    build: () {
      when(
        mockRemoveWatchlist.execute(testMovieDetail),
      ).thenAnswer((_) async => Left(DatabaseFailure(tMessage)));

      return MoviesDetailRemoveWatchlistBloc(
        removeWatchlistUseCase: mockRemoveWatchlist,
      );
    },
    act: (bloc) {
      return bloc.add(
        const MoviesDetailRemoveWatchlistEvent.started(testMovieDetail),
      );
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <MoviesDetailRemoveWatchlistState>[
      MoviesDetailRemoveWatchlistState(watchlistMessage: tMessage),
    ],
    verify: (_) {
      verify(
        mockRemoveWatchlist.execute(
          testMovieDetail,
        ),
      );
    },
  );
}
