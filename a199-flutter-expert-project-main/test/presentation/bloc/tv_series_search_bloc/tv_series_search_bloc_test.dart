import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_tv_series_searched.dart';
import 'package:ditonton/presentation/bloc/tv_series_search_bloc/tv_series_search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_series_search_bloc_test.mocks.dart';

///
/// Bloc [TvSeriesSearchBloc],
/// bergantung pada usecase [GetTvSeriesSearched]
///
@GenerateMocks([GetTvSeriesSearched])
void main() {
  late TvSeriesSearchBloc bloc;
  late MockGetTvSeriesSearched mockUseCase;

  setUp(
    () {
      mockUseCase = MockGetTvSeriesSearched();
      bloc = TvSeriesSearchBloc(
        getTvSeriesSearchedUseCase: mockUseCase,
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

  blocTest<TvSeriesSearchBloc, RequestStateFr<List<TvSeries>>>(
    'should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(
        mockUseCase
            .execute(GetTvSeriesSearchedParams(name: tTvSeriesSearched.name!)),
      ).thenAnswer(
        (_) async => Right(tTvSeriesSearchedList),
      );

      return TvSeriesSearchBloc(
        getTvSeriesSearchedUseCase: mockUseCase,
      );
    },
    act: (bloc) {
      return bloc.add(TvSeriesSearchEvent.onQueryChanged(tTvSeriesSearched.name!));
    },
    wait: const Duration(milliseconds: 500),
    expect: () => <RequestStateFr<List<TvSeries>>>[
      const RequestStateFr.loading(),
      RequestStateFr.loaded(tTvSeriesSearchedList),
    ],
    verify: (_) {
      verify(
        mockUseCase
            .execute(GetTvSeriesSearchedParams(name: tTvSeriesSearched.name!)),
      );
    },
  );

  blocTest<TvSeriesSearchBloc, RequestStateFr<List<TvSeries>>>(
    'should emit [Loading, Error] when data is gotten successfully',
    build: () {
      when(
        mockUseCase
            .execute(GetTvSeriesSearchedParams(name: tTvSeriesSearched.name!)),
      ).thenAnswer(
        (_) async => const Left(ServerFailure('Server Failure')),
      );

      return TvSeriesSearchBloc(
        getTvSeriesSearchedUseCase: mockUseCase,
      );
    },
    act: (bloc) {
      return bloc.add(TvSeriesSearchEvent.onQueryChanged(tTvSeriesSearched.name!));
    },
    wait: const Duration(milliseconds: 500),
    expect: () => <RequestStateFr<List<TvSeries>>>[
      const RequestStateFr.loading(),
      const RequestStateFr.error('Server Failure')
    ],
    verify: (_) {
      verify(
        mockUseCase
            .execute(GetTvSeriesSearchedParams(name: tTvSeriesSearched.name!)),
      );
    },
  );
}
