import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_tv_series_popular.dart';
import 'package:ditonton/presentation/bloc/tv_series_list_popular_bloc/tv_series_list_popular_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_series_list_popular_bloc_test.mocks.dart';

///
/// Bloc [TvSeriesListPopularBloc],
/// bergantung pada usecase [GetTvSeriesPopular]
///
@GenerateMocks([GetTvSeriesPopular])
void main() {
  late TvSeriesListPopularBloc bloc;
  late MockGetTvSeriesPopular mockUseCase;

  setUp(
    () {
      mockUseCase = MockGetTvSeriesPopular();
      bloc = TvSeriesListPopularBloc(
        getTvSeriesPopularUseCase: mockUseCase,
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

  blocTest<TvSeriesListPopularBloc, RequestStateFr<List<TvSeries>>>(
    'should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(
        mockUseCase.execute(),
      ).thenAnswer(
        (_) async => Right(tTvSeriesList),
      );

      return TvSeriesListPopularBloc(
        getTvSeriesPopularUseCase: mockUseCase,
      );
    },
    act: (bloc) {
      return bloc.add(const TvSeriesListPopularEvent.started());
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<List<TvSeries>>>[
      const RequestStateFr.loading(),
      RequestStateFr.loaded(tTvSeriesList),
    ],
    verify: (_) {
      verify(mockUseCase.execute());
    },
  );

  blocTest<TvSeriesListPopularBloc, RequestStateFr<List<TvSeries>>>(
    'should emit [Loading, Error] when data is gotten unsuccessful',
    build: () {
      when(
        mockUseCase.execute(),
      ).thenAnswer(
        (_) async => const Left(ServerFailure('Server Failure')),
      );

      return TvSeriesListPopularBloc(
        getTvSeriesPopularUseCase: mockUseCase,
      );
    },
    act: (bloc) {
      return bloc.add(const TvSeriesListPopularEvent.started());
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<List<TvSeries>>>[
      const RequestStateFr.loading(),
      const RequestStateFr.error('Server Failure'),
    ],
    verify: (_) {
      verify(mockUseCase.execute());
    },
  );
}
