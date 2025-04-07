import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail_recommendtaions.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_recommendation_bloc/tv_series_detail_recommendation_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_recommendation_bloc_test.mocks.dart';

///
/// Bloc [TvSeriesDetailRecommendationBloc],
/// bergantung pada usecase [GetTvSeriesDetailRecommendations]
///
@GenerateMocks([
  GetTvSeriesDetailRecommendations,
])
void main() {
  late TvSeriesDetailRecommendationBloc bloc;
  late MockGetTvSeriesDetailRecommendations mockGetTvSeriesDetailRecom;
  late int tId;

  setUp(
    () {
      mockGetTvSeriesDetailRecom = MockGetTvSeriesDetailRecommendations();
      bloc = TvSeriesDetailRecommendationBloc(
        getTvSeriesDetailRecommendations: mockGetTvSeriesDetailRecom,
      );
      tId = tTvSeriesDetail.id!;
    },
  );

  test(
    'should have state initial, '
    'when bloc still on initialState',
    () {
      expect(bloc.state, const RequestStateFr<List<TvSeries>>.initial());
    },
  );

  blocTest<TvSeriesDetailRecommendationBloc, RequestStateFr<List<TvSeries>>>(
    'should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(
        mockGetTvSeriesDetailRecom
            .execute(GetTvSeriesDetailRecommendationsParams(id: tId)),
      ).thenAnswer((_) async => Right(tTvSeriesDetailRecommendationList));

      return TvSeriesDetailRecommendationBloc(
        getTvSeriesDetailRecommendations: mockGetTvSeriesDetailRecom,
      );
    },
    act: (bloc) {
      return bloc.add(TvSeriesDetailRecommendationEvent.started(tId));
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<List<TvSeries>>>[
      const RequestStateFr.loading(),
      RequestStateFr.loaded(tTvSeriesDetailRecommendationList),
    ],
    verify: (_) {
      verify(
        mockGetTvSeriesDetailRecom
            .execute(GetTvSeriesDetailRecommendationsParams(id: tId)),
      );
    },
  );

  blocTest<TvSeriesDetailRecommendationBloc, RequestStateFr<List<TvSeries>>>(
    'should emit [Loading, Error] when data is gotten unsuccessful',
    build: () {
      when(
        mockGetTvSeriesDetailRecom
            .execute(GetTvSeriesDetailRecommendationsParams(id: tId)),
      ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      return TvSeriesDetailRecommendationBloc(
        getTvSeriesDetailRecommendations: mockGetTvSeriesDetailRecom,
      );
    },
    act: (bloc) {
      return bloc.add(TvSeriesDetailRecommendationEvent.started(tId));
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<List<TvSeries>>>[
      const RequestStateFr.loading(),
      const RequestStateFr.error('Server Failure'),
    ],
    verify: (_) {
      verify(
        mockGetTvSeriesDetailRecom
            .execute(GetTvSeriesDetailRecommendationsParams(id: tId)),
      );
    },
  );
}
