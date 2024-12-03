import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

///
/// UseCase[SaveWatchlistTvSeries],
/// bergantung pada repository [TvSeriesRepository]
///
void main() {
  late SaveWatchlistTvSeries useCase;
  late MockTvSeriesRepository mockRepository;
  late SaveWatchlistTvSeriesParams params;

  setUp(
    () {
      mockRepository = MockTvSeriesRepository();
      useCase = SaveWatchlistTvSeries(repository: mockRepository);
      params = SaveWatchlistTvSeriesParams(
        tvSeriesDetail: tTvSeriesDetail,
      );
    },
  );

  test(
    "should get successful response from the repository",
    () async {
      // arrange
      when(mockRepository.saveWatchlist(params))
          .thenAnswer((_) async => const Right('Added to Watchlist'));

      // act
      final result = await useCase.execute(params);

      // assert
      verify(
        mockRepository.saveWatchlist(params),
      );

      // assert
      expect(result, const Right('Added to Watchlist'));
    },
  );
}
