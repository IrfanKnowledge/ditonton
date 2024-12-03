import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/usecases/get_watchedlist_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

///
/// UseCase[GetWatchlistTvSeries],
/// bergantung pada repository [TvSeriesRepository]
///
void main() {
  late GetWatchlistTvSeries useCase;
  late MockTvSeriesRepository mockRepository;

  setUp(
    () {
      mockRepository = MockTvSeriesRepository();
      useCase = GetWatchlistTvSeries(repository: mockRepository);
    },
  );

  test(
    "should get list of tv series from the repository",
    () async {
      // arrange
      when(mockRepository.getWatchlistTvSeries())
          .thenAnswer((_) async => Right(tTvSeriesList));

      // act
      final result = await useCase.execute();

      // assert
      verify(
        mockRepository.getWatchlistTvSeries(),
      );

      // assert
      expect(result, Right(tTvSeriesList));
    },
  );
}
