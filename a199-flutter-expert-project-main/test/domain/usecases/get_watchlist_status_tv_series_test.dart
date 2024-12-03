import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

///
/// UseCase[GetWatchlistStatusTvSeries],
/// bergantung pada repository [TvSeriesRepository]
///
void main() {
  late GetWatchlistStatusTvSeries useCase;
  late MockTvSeriesRepository mockRepository;
  late GetWatchlistStatusTvSeriesParams params;

  setUp(
    () {
      mockRepository = MockTvSeriesRepository();
      useCase = GetWatchlistStatusTvSeries(repository: mockRepository);
      params = GetWatchlistStatusTvSeriesParams(
        id: tTvSeriesDetail.id!,
      );
    },
  );

  test(
    "should get status from the repository",
    () async {
      // arrange
      when(mockRepository.getWatchlistStatus(params))
          .thenAnswer((_) async => true);

      // act
      final result = await useCase.execute(params);

      // assert
      verify(
        mockRepository.getWatchlistStatus(params),
      );

      // assert
      expect(result, true);
    },
  );
}
