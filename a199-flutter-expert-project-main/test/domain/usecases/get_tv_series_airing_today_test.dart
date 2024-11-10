import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/usecases/get_tv_series_airing_today.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

///
/// UseCase [GetTvSeriesAiringToday],
/// bergantung pada repository [TvSeriesRepository]
///
void main() {
  late GetTvSeriesAiringToday getTvSeriesAiringTodayUseCase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(
    () {
      mockTvSeriesRepository = MockTvSeriesRepository();
      getTvSeriesAiringTodayUseCase =
          GetTvSeriesAiringToday(repository: mockTvSeriesRepository);
    },
  );

  test(
    "should get list of tv series airing today from the repository",
    () async {
      // arrange
      when(mockTvSeriesRepository.getTvSeriesAiringToday())
          .thenAnswer((_) async => Right(tTvSeriesList));

      // act
      final result = await getTvSeriesAiringTodayUseCase.execute();

      // assert
      verify(mockTvSeriesRepository.getTvSeriesAiringToday());

      // assert
      expect(result, Right(tTvSeriesList));
    },
  );
}
