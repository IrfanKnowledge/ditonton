import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail_recommendtaions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

///
/// UseCae [GetTvSeriesDetailRecommendations]
/// bergantung pada repository [TvSeriesRepository]
void main() {
  late GetTvSeriesDetailRecommendations useCase;
  late MockTvSeriesRepository mockRepository;
  late GetTvSeriesDetailRecommendationsParams params;

  setUp(
    () {
      mockRepository = MockTvSeriesRepository();
      useCase = GetTvSeriesDetailRecommendations(repository: mockRepository);
      params = GetTvSeriesDetailRecommendationsParams(
        id: tTvSeriesDetailRecommendation.id!,
      );
    },
  );

  test(
    "should get list of recommendations tv series from the repository",
    () async {
      // arrange
      when(mockRepository.getTvSeriesDetailRecommendations(params))
          .thenAnswer((_) async => Right(tTvSeriesDetailRecommendationList));

      // act
      final result = await useCase.execute(params);

      // assert
      verify(
        mockRepository.getTvSeriesDetailRecommendations(params),
      );

      // assert
      expect(result, Right(tTvSeriesDetailRecommendationList));
    },
  );
}
