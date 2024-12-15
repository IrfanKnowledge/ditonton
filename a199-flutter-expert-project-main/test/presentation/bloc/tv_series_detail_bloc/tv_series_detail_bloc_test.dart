import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_bloc/tv_series_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_bloc_test.mocks.dart';

///
/// Bloc [TvSeriesDetailBloc],
/// bergantung pada usecase [GetTvSeriesDetail]
///
@GenerateMocks([
  GetTvSeriesDetail,
])
void main() {
  late TvSeriesDetailBloc bloc;
  late MockGetTvSeriesDetail mockGetTvSeriesDetail;
  late int tId;

  setUp(
    () {
      mockGetTvSeriesDetail = MockGetTvSeriesDetail();
      bloc = TvSeriesDetailBloc(
        getTvSeriesDetailUseCase: mockGetTvSeriesDetail,
      );
      tId = tTvSeriesDetail.id!;
    },
  );

  test(
    'should have state initial, '
    'when bloc still on initialState',
    () {
      expect(bloc.state, const RequestStateFr<TvSeriesDetail>.initial());
    },
  );

  blocTest<TvSeriesDetailBloc, RequestStateFr<TvSeriesDetail>>(
    'should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(
        mockGetTvSeriesDetail.execute(GetTvSeriesDetailParams(id: tId)),
      ).thenAnswer((_) async => Right(tTvSeriesDetail));

      return TvSeriesDetailBloc(
        getTvSeriesDetailUseCase: mockGetTvSeriesDetail,
      );
    },
    act: (bloc) {
      return bloc.add(TvSeriesDetailEvent.started(tId));
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<TvSeriesDetail>>[
      const RequestStateFr.loading(),
      RequestStateFr.loaded(tTvSeriesDetail),
    ],
    verify: (_) {
      verify(
        mockGetTvSeriesDetail.execute(GetTvSeriesDetailParams(id: tId)),
      );
    },
  );

  blocTest<TvSeriesDetailBloc, RequestStateFr<TvSeriesDetail>>(
    'should emit [Loading, Error] when data is gotten unsuccessful',
    build: () {
      when(
        mockGetTvSeriesDetail.execute(GetTvSeriesDetailParams(id: tId)),
      ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      return TvSeriesDetailBloc(
        getTvSeriesDetailUseCase: mockGetTvSeriesDetail,
      );
    },
    act: (bloc) {
      return bloc.add(TvSeriesDetailEvent.started(tId));
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<TvSeriesDetail>>[
      const RequestStateFr.loading(),
      const RequestStateFr.error('Server Failure'),
    ],
    verify: (_) {
      verify(
        mockGetTvSeriesDetail.execute(GetTvSeriesDetailParams(id: tId)),
      );
    },
  );
}
