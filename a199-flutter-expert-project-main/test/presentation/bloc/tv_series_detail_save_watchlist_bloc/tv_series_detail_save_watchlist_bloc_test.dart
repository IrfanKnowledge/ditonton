import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_add_watchlist_bloc/tv_series_detail_add_watchlist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_save_watchlist_bloc_test.mocks.dart';

///
/// Bloc [TvSeriesDetailAddWatchlistBloc],
/// bergantung pada usecase [SaveWatchlistTvSeries]
///
@GenerateMocks([
  SaveWatchlistTvSeries,
])
void main() {
  late TvSeriesDetailAddWatchlistBloc bloc;
  late MockSaveWatchlistTvSeries mockSaveWatchlistTvSeries;

  setUp(
    () {
      mockSaveWatchlistTvSeries = MockSaveWatchlistTvSeries();

      bloc = TvSeriesDetailAddWatchlistBloc(
        saveWatchlistTvSeriesUseCase: mockSaveWatchlistTvSeries,
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
        const TvSeriesDetailAddWatchlistState(
          watchlistMessage: '',
        ),
      );
    },
  );

  blocTest<TvSeriesDetailAddWatchlistBloc, TvSeriesDetailAddWatchlistState>(
    'should emit [watchlistMessage = "Added to Watchlist"] when data is saved successfully',
    setUp: () {
      tMessage = TvSeriesDetailAddWatchlistBloc.watchlistAddSuccessMessage;
    },
    build: () {
      when(
        mockSaveWatchlistTvSeries.execute(
            SaveWatchlistTvSeriesParams(tvSeriesDetail: tTvSeriesDetail)),
      ).thenAnswer((_) async => Right(tMessage));

      return TvSeriesDetailAddWatchlistBloc(
        saveWatchlistTvSeriesUseCase: mockSaveWatchlistTvSeries,
      );
    },
    act: (bloc) {
      return bloc.add(
        TvSeriesDetailAddWatchlistEvent.started(tTvSeriesDetail),
      );
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <TvSeriesDetailAddWatchlistState>[
      TvSeriesDetailAddWatchlistState(watchlistMessage: tMessage),
    ],
    verify: (_) {
      verify(
        mockSaveWatchlistTvSeries.execute(
          SaveWatchlistTvSeriesParams(tvSeriesDetail: tTvSeriesDetail),
        ),
      );
    },
  );

  blocTest<TvSeriesDetailAddWatchlistBloc, TvSeriesDetailAddWatchlistState>(
    'should emit [watchlistMessage = "Error"] when data is saved successfully',
    setUp: () {
      tMessage = 'error';
    },
    build: () {
      when(
        mockSaveWatchlistTvSeries.execute(
            SaveWatchlistTvSeriesParams(tvSeriesDetail: tTvSeriesDetail)),
      ).thenAnswer((_) async => Left(DatabaseFailure(tMessage)));

      return TvSeriesDetailAddWatchlistBloc(
        saveWatchlistTvSeriesUseCase: mockSaveWatchlistTvSeries,
      );
    },
    act: (bloc) {
      return bloc.add(
        TvSeriesDetailAddWatchlistEvent.started(tTvSeriesDetail),
      );
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <TvSeriesDetailAddWatchlistState>[
      TvSeriesDetailAddWatchlistState(watchlistMessage: tMessage),
    ],
    verify: (_) {
      verify(
        mockSaveWatchlistTvSeries.execute(
          SaveWatchlistTvSeriesParams(tvSeriesDetail: tTvSeriesDetail),
        ),
      );
    },
  );
}
