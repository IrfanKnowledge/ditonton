import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_tv_series_top_rated.dart';
import 'package:ditonton/presentation/bloc/tv_series_list_top_rated_bloc/tv_series_list_top_rated_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_series_list_top_rated_bloc_test.mocks.dart';

///
/// Bloc [TvSeriesListTopRatedBloc],
/// bergantung pada usecase [GetTvSeriesTopRated]
///
@GenerateMocks([GetTvSeriesTopRated])
void main() {
  late TvSeriesListTopRatedBloc bloc;
  late MockGetTvSeriesTopRated mockUseCase;

  setUp(
    () {
      mockUseCase = MockGetTvSeriesTopRated();
      bloc = TvSeriesListTopRatedBloc(
        getTvSeriesTopRatedUseCase: mockUseCase,
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

  blocTest<TvSeriesListTopRatedBloc, RequestStateFr<List<TvSeries>>>(
    'should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(
        mockUseCase.execute(),
      ).thenAnswer(
        (_) async => Right(tTvSeriesList),
      );

      return TvSeriesListTopRatedBloc(
        getTvSeriesTopRatedUseCase: mockUseCase,
      );
    },
    act: (bloc) {
      return bloc.add(const TvSeriesListTopRatedEvent.started());
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

  blocTest<TvSeriesListTopRatedBloc, RequestStateFr<List<TvSeries>>>(
    'should emit [Loading, Error] when data is gotten unsuccessful',
    build: () {
      when(
        mockUseCase.execute(),
      ).thenAnswer(
        (_) async => const Left(ServerFailure('Server Failure')),
      );

      return TvSeriesListTopRatedBloc(
        getTvSeriesTopRatedUseCase: mockUseCase,
      );
    },
    act: (bloc) {
      return bloc.add(const TvSeriesListTopRatedEvent.started());
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