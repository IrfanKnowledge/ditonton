import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail_recommendtaions.dart';
import 'package:ditonton/domain/usecases/get_tv_series_searched.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

///
/// UseCae [GetTvSeriesSearched]
/// bergantung pada repository [TvSeriesRepository]
void main() {
  late GetTvSeriesSearched useCase;
  late MockTvSeriesRepository mockRepository;
  late GetTvSeriesSearchedParams params;

  setUp(
    () {
      mockRepository = MockTvSeriesRepository();
      useCase = GetTvSeriesSearched(repository: mockRepository);
      params = GetTvSeriesSearchedParams(
        name: tTvSeriesSearched.name!,
      );
    },
  );

  test(
    "should get list of recommendations tv series from the repository",
    () async {
      // arrange
      when(mockRepository.getTvSeriesSearched(params))
          .thenAnswer((_) async => Right(tTvSeriesSearchedList));

      // act
      final result = await useCase.execute(params);

      // assert
      verify(
        mockRepository.getTvSeriesSearched(params),
      );

      // assert
      expect(result, Right(tTvSeriesSearchedList));
    },
  );
}
