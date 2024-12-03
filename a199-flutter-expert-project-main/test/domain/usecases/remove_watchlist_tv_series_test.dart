import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

///
/// UseCase[RemoveWatchlistTvSeries],
/// bergantung pada repository [TvSeriesRepository]
///
void main() {
  late RemoveWatchlistTvSeries useCase;
  late MockTvSeriesRepository mockRepository;
  late RemoveWatchlistTvSeriesParams params;

  setUp(
    () {
      mockRepository = MockTvSeriesRepository();
      useCase = RemoveWatchlistTvSeries(repository: mockRepository);
      params = RemoveWatchlistTvSeriesParams(
        tvSeriesDetail: tTvSeriesDetail,
      );
    },
  );

  test(
    "should get successful response from the repository",
    () async {
      // arrange
      when(mockRepository.removeWatchlist(params))
          .thenAnswer((_) async => const Right('Removed from watchlist'));

      // act
      final result = await useCase.execute(params);

      // assert
      verify(
        mockRepository.removeWatchlist(params),
      );

      // assert
      expect(result, const Right('Removed from watchlist'));
    },
  );
}
