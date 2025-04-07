import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series_status.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_load_watchlist_status_bloc/tv_series_detail_load_watchlist_status_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_load_watchlist_status_bloc_test.mocks.dart';

///
/// Bloc [TvSeriesDetailLoadWatchlistStatusBloc],
/// bergantung pada usecase [GetWatchlistStatusTvSeries]
///
@GenerateMocks([
  GetWatchlistStatusTvSeries,
])
void main() {
  late TvSeriesDetailLoadWatchlistStatusBloc bloc;
  late MockGetWatchlistStatusTvSeries mockGetWatchlistStatusTvSeries;

  setUp(
    () {
      mockGetWatchlistStatusTvSeries = MockGetWatchlistStatusTvSeries();

      bloc = TvSeriesDetailLoadWatchlistStatusBloc(
        getWatchlistStatusTvSeriesUseCase: mockGetWatchlistStatusTvSeries,
      );
    },
  );

  int tId = tTvSeriesDetail.id!;

  bool tStatusTrue = false;

  test(
    'should have status false, '
    'when bloc still on initialState',
    () {
      expect(
        bloc.state,
        const TvSeriesDetailLoadWatchlistStatusState(
          isAddedToWatchList: false,
        ),
      );
    },
  );

  blocTest<TvSeriesDetailLoadWatchlistStatusBloc,
      TvSeriesDetailLoadWatchlistStatusState>(
    'should emit [isAddedToWatchList = true] when data is gotten successfully',
    setUp: () {
      tStatusTrue = true;
    },
    build: () {
      when(
        mockGetWatchlistStatusTvSeries
            .execute(GetWatchlistStatusTvSeriesParams(id: tId)),
      ).thenAnswer((_) async => tStatusTrue);

      return TvSeriesDetailLoadWatchlistStatusBloc(
        getWatchlistStatusTvSeriesUseCase: mockGetWatchlistStatusTvSeries,
      );
    },
    act: (bloc) {
      return bloc.add(TvSeriesDetailLoadWatchlistStatusEvent.started(tId));
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <TvSeriesDetailLoadWatchlistStatusState>[
      TvSeriesDetailLoadWatchlistStatusState(isAddedToWatchList: tStatusTrue),
    ],
    verify: (_) {
      verify(
        mockGetWatchlistStatusTvSeries
            .execute(GetWatchlistStatusTvSeriesParams(id: tId)),
      );
    },
  );

  blocTest<TvSeriesDetailLoadWatchlistStatusBloc,
      TvSeriesDetailLoadWatchlistStatusState>(
    'should emit [isAddedToWatchList = false] when data is gotten successfully',
    setUp: () {
      tStatusTrue = false;
    },
    build: () {
      when(
        mockGetWatchlistStatusTvSeries
            .execute(GetWatchlistStatusTvSeriesParams(id: tId)),
      ).thenAnswer((_) async => tStatusTrue);

      return TvSeriesDetailLoadWatchlistStatusBloc(
        getWatchlistStatusTvSeriesUseCase: mockGetWatchlistStatusTvSeries,
      );
    },
    act: (bloc) {
      return bloc.add(TvSeriesDetailLoadWatchlistStatusEvent.started(tId));
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <TvSeriesDetailLoadWatchlistStatusState>[
      TvSeriesDetailLoadWatchlistStatusState(isAddedToWatchList: tStatusTrue),
    ],
    verify: (_) {
      verify(
        mockGetWatchlistStatusTvSeries
            .execute(GetWatchlistStatusTvSeriesParams(id: tId)),
      );
    },
  );
}
