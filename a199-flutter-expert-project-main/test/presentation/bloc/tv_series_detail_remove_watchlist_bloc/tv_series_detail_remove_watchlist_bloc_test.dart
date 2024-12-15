import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_remove_watchlist_bloc/tv_series_detail_remove_watchlist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_remove_watchlist_bloc_test.mocks.dart';

///
/// Bloc [TvSeriesDetailRemoveWatchlistBloc],
/// bergantung pada usecase [RemoveWatchlistTvSeries]
///
@GenerateMocks([
  RemoveWatchlistTvSeries,
])
void main() {
  late TvSeriesDetailRemoveWatchlistBloc bloc;
  late MockRemoveWatchlistTvSeries mockRemoveWatchlistTvSeries;

  setUp(
    () {
      mockRemoveWatchlistTvSeries = MockRemoveWatchlistTvSeries();

      bloc = TvSeriesDetailRemoveWatchlistBloc(
        removeWatchlistTvSeriesUseCase: mockRemoveWatchlistTvSeries,
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
        const TvSeriesDetailRemoveWatchlistState(
          watchlistMessage: '',
        ),
      );
    },
  );

  blocTest<TvSeriesDetailRemoveWatchlistBloc,
      TvSeriesDetailRemoveWatchlistState>(
    'should emit [watchlistMessage = "Removed from Watchlist"] when data is saved successfully',
    setUp: () {
      tMessage =
          TvSeriesDetailRemoveWatchlistBloc.watchlistRemoveSuccessMessage;
    },
    build: () {
      when(
        mockRemoveWatchlistTvSeries.execute(
            RemoveWatchlistTvSeriesParams(tvSeriesDetail: tTvSeriesDetail)),
      ).thenAnswer((_) async => Right(tMessage));

      return TvSeriesDetailRemoveWatchlistBloc(
        removeWatchlistTvSeriesUseCase: mockRemoveWatchlistTvSeries,
      );
    },
    act: (bloc) {
      return bloc.add(
        TvSeriesDetailRemoveWatchlistEvent.started(tTvSeriesDetail),
      );
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <TvSeriesDetailRemoveWatchlistState>[
      TvSeriesDetailRemoveWatchlistState(watchlistMessage: tMessage),
    ],
    verify: (_) {
      verify(
        mockRemoveWatchlistTvSeries.execute(
          RemoveWatchlistTvSeriesParams(tvSeriesDetail: tTvSeriesDetail),
        ),
      );
    },
  );

  blocTest<TvSeriesDetailRemoveWatchlistBloc,
      TvSeriesDetailRemoveWatchlistState>(
    'should emit [watchlistMessage = "Error"] when data is saved successfully',
    setUp: () {
      tMessage = 'error';
    },
    build: () {
      when(
        mockRemoveWatchlistTvSeries.execute(
            RemoveWatchlistTvSeriesParams(tvSeriesDetail: tTvSeriesDetail)),
      ).thenAnswer((_) async => Left(DatabaseFailure(tMessage)));

      return TvSeriesDetailRemoveWatchlistBloc(
        removeWatchlistTvSeriesUseCase: mockRemoveWatchlistTvSeries,
      );
    },
    act: (bloc) {
      return bloc.add(
        TvSeriesDetailRemoveWatchlistEvent.started(tTvSeriesDetail),
      );
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <TvSeriesDetailRemoveWatchlistState>[
      TvSeriesDetailRemoveWatchlistState(watchlistMessage: tMessage),
    ],
    verify: (_) {
      verify(
        mockRemoveWatchlistTvSeries.execute(
          RemoveWatchlistTvSeriesParams(tvSeriesDetail: tTvSeriesDetail),
        ),
      );
    },
  );
}
