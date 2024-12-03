import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_tv_series_searched.dart';
import 'package:ditonton/presentation/provider/tv_series_search_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_search_notifier_test.mocks.dart';

///
/// Provider (ChangeNotifier) [TvSeriesSearchNotifier],
/// bergantung pada usecase [GetTvSeriesSearched]
///
@GenerateMocks([
  GetTvSeriesSearched,
])
void main() {
  late TvSeriesSearchNotifier provider;
  late MockGetTvSeriesSearched mockGetTvSeriesSearched;
  late int listenerCallCount;

  setUp(
    () {
      listenerCallCount = 0;
      mockGetTvSeriesSearched = MockGetTvSeriesSearched();
      provider = TvSeriesSearchNotifier(
        getTvSeriesSearchedUseCase: mockGetTvSeriesSearched,
      )..addListener(
          () {
            listenerCallCount += 1;
          },
        );
    },
  );

  group('search TvSeries', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(
        mockGetTvSeriesSearched
            .execute(GetTvSeriesSearchedParams(name: tTvSeriesSearched.name!)),
      ).thenAnswer((_) async => Right(tTvSeriesSearchedList));

      // act
      provider.fetchMovieSearch(tTvSeriesSearched.name!);

      // assert
      expect(provider.state, RequestState.Loading);
    });

    test('should change search result data when data is gotten successfully',
        () async {
      // arrange
      when(
        mockGetTvSeriesSearched
            .execute(GetTvSeriesSearchedParams(name: tTvSeriesSearched.name!)),
      ).thenAnswer((_) async => Right(tTvSeriesSearchedList));

      // act
      await provider.fetchMovieSearch(tTvSeriesSearched.name!);

      // assert
      expect(provider.state, RequestState.Loaded);
      expect(provider.searchResult, tTvSeriesSearchedList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(
        mockGetTvSeriesSearched
            .execute(GetTvSeriesSearchedParams(name: tTvSeriesSearched.name!)),
      ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      // act
      await provider.fetchMovieSearch(tTvSeriesSearched.name!);
      // assert
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
