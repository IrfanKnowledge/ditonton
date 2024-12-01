import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

///
/// UseCase[GetTvSeriesDetail],
/// bergantung pada repository [TvSeriesRepository]
///
void main() {
  late GetTvSeriesDetail useCase;
  late MockTvSeriesRepository mockRepository;
  late GetTvSeriesDetailParams params;

  setUp(
    () {
      mockRepository = MockTvSeriesRepository();
      useCase = GetTvSeriesDetail(repository: mockRepository);
      params = GetTvSeriesDetailParams(id: tTvSeriesDetail.id!);
    },
  );

  test(
    "should get list of tv series detail from the repository",
    () async {
      // arrange
      when(mockRepository.getTvSeriesDetail(params))
          .thenAnswer((_) async => Right(tTvSeriesDetail));

      // act
      final result = await useCase.execute(params);

      // assert
      verify(
        mockRepository.getTvSeriesDetail(params),
      );

      // assert
      expect(result, Right(tTvSeriesDetail));
    },
  );
}
