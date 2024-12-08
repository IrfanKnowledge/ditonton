import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail_recommendtaions.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv_series.dart';
import 'package:ditonton/presentation/provider/tv_series_detail_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_notifier_test.mocks.dart';

///
/// Provider (ChangeNotifier) [TvSeriesDetailNotifier],
/// bergantung pada:
///   - usecase [GetTvSeriesDetail]
///   - usecase [GetTvSeriesDetailRecommendations]
///   - usecase [GetWatchlistStatusTvSeries]
///   - usecase [SaveWatchlistTvSeries]
///   - usecase [RemoveWatchlistTvSeries]
///
@GenerateMocks([
  GetTvSeriesDetail,
  GetTvSeriesDetailRecommendations,
  GetWatchlistStatusTvSeries,
  SaveWatchlistTvSeries,
  RemoveWatchlistTvSeries,
])
void main() {
  late TvSeriesDetailNotifier provider;
  late MockGetTvSeriesDetail mockGetTvSeriesDetail;
  late MockGetTvSeriesDetailRecommendations
      mockGetTvSeriesDetailRecommendations;
  late MockGetWatchlistStatusTvSeries mockGetWatchlistStatusTvSeries;
  late MockSaveWatchlistTvSeries mockSaveWatchlistTvSeries;
  late MockRemoveWatchlistTvSeries mockRemoveWatchlistTvSeries;
  late int listenerCallCount;
  late int tId;

  setUp(
    () {
      listenerCallCount = 0;
      mockGetTvSeriesDetail = MockGetTvSeriesDetail();
      mockGetTvSeriesDetailRecommendations =
          MockGetTvSeriesDetailRecommendations();
      mockGetWatchlistStatusTvSeries = MockGetWatchlistStatusTvSeries();
      mockSaveWatchlistTvSeries = MockSaveWatchlistTvSeries();
      mockRemoveWatchlistTvSeries = MockRemoveWatchlistTvSeries();
      provider = TvSeriesDetailNotifier(
        getTvSeriesDetailUseCase: mockGetTvSeriesDetail,
        getTvSeriesDetailRecommendationsUseCase:
            mockGetTvSeriesDetailRecommendations,
        getWatchlistStatusTvSeriesUseCase: mockGetWatchlistStatusTvSeries,
        saveWatchlistTvSeriesUseCase: mockSaveWatchlistTvSeries,
        removeWatchlistTvSeriesUseCase: mockRemoveWatchlistTvSeries,
      )..addListener(
          () {
            listenerCallCount += 1;
          },
        );

      tId = tTvSeriesDetail.id!;
    },
  );

  void arrangeUseCase() {
    when(
      mockGetTvSeriesDetail.execute(GetTvSeriesDetailParams(id: tId)),
    ).thenAnswer((_) async => Right(tTvSeriesDetail));
    when(
      mockGetTvSeriesDetailRecommendations.execute(
        GetTvSeriesDetailRecommendationsParams(id: tId),
      ),
    ).thenAnswer(
      (_) async => Right(tTvSeriesDetailRecommendationList),
    );
  }

  group('Get Tv Series Detail', () {
    test('should get data from the usecase', () async {
      // arrange
      arrangeUseCase();

      // act
      await provider.fetchTvSeriesDetail(tId);

      // assert
      verify(
        mockGetTvSeriesDetail.execute(GetTvSeriesDetailParams(id: tId)),
      );
      verify(
        mockGetTvSeriesDetailRecommendations
            .execute(GetTvSeriesDetailRecommendationsParams(id: tId)),
      );
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      arrangeUseCase();

      // act
      provider.fetchTvSeriesDetail(tId);
      // assert
      expect(provider.tvSeriesState, RequestState.loading);
      expect(listenerCallCount, 1);
    });

    test('should change Tv Series when data is gotten successfully', () async {
      // arrange
      arrangeUseCase();

      // act
      await provider.fetchTvSeriesDetail(tId);

      // assert
      expect(provider.tvSeriesState, RequestState.loaded);
      expect(provider.tvSeriesDetail, tTvSeriesDetail);
      expect(listenerCallCount, 3);
    });

    test(
        'should change recommendation TvSeries when data is gotten successfully',
        () async {
      // arrange
      arrangeUseCase();
      // act
      await provider.fetchTvSeriesDetail(tId);
      // assert
      expect(provider.tvSeriesState, RequestState.loaded);
      expect(
          provider.tvSeriesRecommendations, tTvSeriesDetailRecommendationList);
    });
  });

  group('Get Tv Series Recommendations', () {
    test('should get data from the usecase', () async {
      // arrange
      arrangeUseCase();

      // act
      await provider.fetchTvSeriesDetail(tId);

      // assert
      verify(
        mockGetTvSeriesDetailRecommendations
            .execute(GetTvSeriesDetailRecommendationsParams(id: tId)),
      );
      expect(
          provider.tvSeriesRecommendations, tTvSeriesDetailRecommendationList);
    });

    test('should update recommendation state when data is gotten successfully',
        () async {
      // arrange
      arrangeUseCase();

      // act
      await provider.fetchTvSeriesDetail(tId);
      // assert
      expect(provider.recommendationState, RequestState.loaded);
      expect(
          provider.tvSeriesRecommendations, tTvSeriesDetailRecommendationList);
    });

    test('should update error message when request in successful', () async {
      // arrange
      when(
        mockGetTvSeriesDetail.execute(GetTvSeriesDetailParams(id: tId)),
      ).thenAnswer((_) async => Right(tTvSeriesDetail));

      when(
        mockGetTvSeriesDetailRecommendations
            .execute(GetTvSeriesDetailRecommendationsParams(id: tId)),
      ).thenAnswer((_) async => const Left(ServerFailure('Failed')));

      // act
      await provider.fetchTvSeriesDetail(tId);

      // assert
      expect(provider.recommendationState, RequestState.error);
      expect(provider.message, 'Failed');
    });
  });

  group('Watchlist', () {
    test('should get the watchlist status', () async {
      // arrange
      when(
        mockGetWatchlistStatusTvSeries.execute(
          GetWatchlistStatusTvSeriesParams(id: tId),
        ),
      ).thenAnswer((_) async => true);

      // act
      await provider.loadWatchlistStatus(tId);

      verify(mockGetWatchlistStatusTvSeries.execute(
        GetWatchlistStatusTvSeriesParams(id: tId),
      ));

      // assert
      expect(provider.isAddedToWatchlist, true);
    });

    test('should execute save watchlist when function called', () async {
      // arrange
      when(
        mockSaveWatchlistTvSeries.execute(
            SaveWatchlistTvSeriesParams(tvSeriesDetail: tTvSeriesDetail)),
      ).thenAnswer((_) async => const Right('Success'));

      when(
        mockGetWatchlistStatusTvSeries
            .execute(GetWatchlistStatusTvSeriesParams(id: tId)),
      ).thenAnswer((_) async => true);

      // act
      await provider.addWatchlist(tTvSeriesDetail);

      // assert
      verify(
        mockGetWatchlistStatusTvSeries
            .execute(GetWatchlistStatusTvSeriesParams(id: tId)),
      );
    });

    test('should execute remove watchlist when function called', () async {
      // arrange
      when(
        mockRemoveWatchlistTvSeries.execute(
            RemoveWatchlistTvSeriesParams(tvSeriesDetail: tTvSeriesDetail)),
      ).thenAnswer((_) async => const Right('Removed'));
      when(
        mockGetWatchlistStatusTvSeries
            .execute(GetWatchlistStatusTvSeriesParams(id: tId)),
      ).thenAnswer((_) async => false);

      // act
      await provider.removeFromWatchlist(tTvSeriesDetail);

      // assert
      verify(
        mockRemoveWatchlistTvSeries.execute(
            RemoveWatchlistTvSeriesParams(tvSeriesDetail: tTvSeriesDetail)),
      );
    });

    test('should update watchlist status when add watchlist success', () async {
      // arrange
      when(
        mockSaveWatchlistTvSeries.execute(
            SaveWatchlistTvSeriesParams(tvSeriesDetail: tTvSeriesDetail)),
      ).thenAnswer((_) async => const Right('Added to Watchlist'));
      when(
        mockGetWatchlistStatusTvSeries
            .execute(GetWatchlistStatusTvSeriesParams(id: tId)),
      ).thenAnswer((_) async => true);

      // act
      await provider.addWatchlist(tTvSeriesDetail);

      // assert
      verify(
        mockGetWatchlistStatusTvSeries
            .execute(GetWatchlistStatusTvSeriesParams(id: tId)),
      );
      expect(provider.isAddedToWatchlist, true);
      expect(provider.watchlistMessage, 'Added to Watchlist');
      expect(listenerCallCount, 1);
    });

    test('should update watchlist message when add watchlist failed', () async {
      // arrange
      when(
        mockSaveWatchlistTvSeries.execute(
            SaveWatchlistTvSeriesParams(tvSeriesDetail: tTvSeriesDetail)),
      ).thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
      when(
        mockGetWatchlistStatusTvSeries
            .execute(GetWatchlistStatusTvSeriesParams(id: tId)),
      ).thenAnswer((_) async => false);

      // act
      await provider.addWatchlist(tTvSeriesDetail);

      // assert
      expect(provider.watchlistMessage, 'Failed');
      expect(listenerCallCount, 1);
    });
  });

  group('on Error', () {
    test('should return error when data is unsuccessful', () async {
      // arrange
      when(
        mockGetTvSeriesDetail.execute(GetTvSeriesDetailParams(id: tId)),
      ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      when(
        mockGetTvSeriesDetailRecommendations
            .execute(GetTvSeriesDetailRecommendationsParams(id: tId)),
      ).thenAnswer((_) async => Right(tTvSeriesDetailRecommendationList));

      // act
      await provider.fetchTvSeriesDetail(tId);
      // assert
      expect(provider.tvSeriesState, RequestState.error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
