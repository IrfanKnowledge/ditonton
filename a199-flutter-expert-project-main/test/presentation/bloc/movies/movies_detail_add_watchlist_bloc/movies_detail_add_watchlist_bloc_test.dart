import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:ditonton/presentation/bloc/movies/movies_detail_add_watchlist_bloc/movies_detail_add_watchlist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movies_detail_add_watchlist_bloc_test.mocks.dart';

///
/// Bloc [MoviesDetailAddWatchlistBloc],
/// bergantung pada usecase [SaveWatchlist]
///
@GenerateMocks([
  SaveWatchlist,
])
void main() {
  late MoviesDetailAddWatchlistBloc bloc;
  late MockSaveWatchlist mockSaveWatchlist;

  setUp(
    () {
      mockSaveWatchlist = MockSaveWatchlist();

      bloc = MoviesDetailAddWatchlistBloc(
        saveWatchlistUseCase: mockSaveWatchlist,
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
        const MoviesDetailAddWatchlistState(
          watchlistMessage: '',
        ),
      );
    },
  );

  blocTest<MoviesDetailAddWatchlistBloc, MoviesDetailAddWatchlistState>(
    'should emit [watchlistMessage = "Added to Watchlist"] when data is saved successfully',
    setUp: () {
      tMessage = MoviesDetailAddWatchlistBloc.watchlistAddSuccessMessage;
    },
    build: () {
      when(
        mockSaveWatchlist.execute(testMovieDetail),
      ).thenAnswer((_) async => Right(tMessage));

      return MoviesDetailAddWatchlistBloc(
        saveWatchlistUseCase: mockSaveWatchlist,
      );
    },
    act: (bloc) {
      return bloc.add(
        const MoviesDetailAddWatchlistEvent.started(testMovieDetail),
      );
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <MoviesDetailAddWatchlistState>[
      MoviesDetailAddWatchlistState(watchlistMessage: tMessage),
      const MoviesDetailAddWatchlistState(
          watchlistMessage:
              MoviesDetailAddWatchlistBloc.watchlistAddResetMessage),
    ],
    verify: (_) {
      verify(
        mockSaveWatchlist.execute(
          testMovieDetail,
        ),
      );
    },
  );

  blocTest<MoviesDetailAddWatchlistBloc, MoviesDetailAddWatchlistState>(
    'should emit [watchlistMessage = "Error"] when data is saved successfully',
    setUp: () {
      tMessage = 'error';
    },
    build: () {
      when(
        mockSaveWatchlist.execute(testMovieDetail),
      ).thenAnswer((_) async => Left(DatabaseFailure(tMessage)));

      return MoviesDetailAddWatchlistBloc(
        saveWatchlistUseCase: mockSaveWatchlist,
      );
    },
    act: (bloc) {
      return bloc.add(
        const MoviesDetailAddWatchlistEvent.started(testMovieDetail),
      );
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <MoviesDetailAddWatchlistState>[
      MoviesDetailAddWatchlistState(watchlistMessage: tMessage),
    ],
    verify: (_) {
      verify(
        mockSaveWatchlist.execute(
          testMovieDetail,
        ),
      );
    },
  );
}
