import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_watchedlist_tv_series.dart';
import 'package:ditonton/presentation/bloc/watchlist_tv_series_bloc/watchlist_tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'watchlist_tv_series_bloc_test.mocks.dart';

///
/// Bloc [WatchlistTvSeriesBloc],
/// bergantung pada usecase [GetWatchlistTvSeries]
///
@GenerateMocks([
  GetWatchlistTvSeries,
])
void main() {
  late WatchlistTvSeriesBloc bloc;
  late MockGetWatchlistTvSeries mockUseCase;

  setUp(
    () {
      mockUseCase = MockGetWatchlistTvSeries();
      bloc = WatchlistTvSeriesBloc(
        getWatchlistTvSeriesUseCase: mockUseCase,
      );
    },
  );

  test(
    'should have state initial, '
    'when bloc still on initialState',
    () {
      expect(bloc.state, const RequestStateFr<List<TvSeries>>.initial());
    },
  );

  blocTest<WatchlistTvSeriesBloc, RequestStateFr<List<TvSeries>>>(
    'should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(
        mockUseCase.execute(),
      ).thenAnswer(
        (_) async => Right(tTvSeriesFromTableList),
      );

      return WatchlistTvSeriesBloc(getWatchlistTvSeriesUseCase: mockUseCase);
    },
    act: (bloc) {
      return bloc.add(const WatchlistTvSeriesEvent.started());
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<List<TvSeries>>>[
      const RequestStateFr.loading(),
      RequestStateFr.loaded(tTvSeriesFromTableList),
    ],
    verify: (_) {
      verify(mockUseCase.execute());
    },
  );

  blocTest<WatchlistTvSeriesBloc, RequestStateFr<List<TvSeries>>>(
    'should emit [Loading, Error] when data is gotten unsuccessful',
    build: () {
      when(
        mockUseCase.execute(),
      ).thenAnswer(
        (_) async => const Left(DatabaseFailure("Can't get data")),
      );

      return WatchlistTvSeriesBloc(getWatchlistTvSeriesUseCase: mockUseCase);
    },
    act: (bloc) {
      return bloc.add(const WatchlistTvSeriesEvent.started());
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<List<TvSeries>>>[
      const RequestStateFr.loading(),
      const RequestStateFr.error("Can't get data"),
    ],
    verify: (_) {
      verify(mockUseCase.execute());
    },
  );
}
