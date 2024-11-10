
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/get_tv_series_popular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

///
/// UseCase [GetTvSeriesPopular],
/// bergantung pada repository [TvSeriesRepository]
///
void main() {
  late GetTvSeriesPopular useCase;
  late MockTvSeriesRepository mockRepository;

  setUp(
        () {
      mockRepository = MockTvSeriesRepository();
      useCase =
          GetTvSeriesPopular(repository: mockRepository);
    },
  );

  test(
    "should get list of tv series popular from the repository",
        () async {
      // arrange
      when(mockRepository.getTvSeriesPopular())
          .thenAnswer((_) async => Right(tTvSeriesList));

      // act
      final result = await useCase.execute();

      // assert
      verify(mockRepository.getTvSeriesPopular());

      // assert
      expect(result, Right(tTvSeriesList));
    },
  );
}
