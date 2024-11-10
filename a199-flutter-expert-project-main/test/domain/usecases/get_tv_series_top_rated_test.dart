
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/get_tv_series_top_rated.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

///
/// UseCase [GetTvSeriesTopRated],
/// bergantung pada repository [TvSeriesRepository]
///
void main() {
  late GetTvSeriesTopRated useCase;
  late MockTvSeriesRepository mockRepository;

  setUp(
        () {
      mockRepository = MockTvSeriesRepository();
      useCase =
          GetTvSeriesTopRated(repository: mockRepository);
    },
  );

  test(
    "should get list of tv series top rated from the repository",
        () async {
      // arrange
      when(mockRepository.getTvSeriesTopRated())
          .thenAnswer((_) async => Right(tTvSeriesList));

      // act
      final result = await useCase.execute();

      // assert
      verify(mockRepository.getTvSeriesTopRated());

      // assert
      expect(result, Right(tTvSeriesList));
    },
  );
}