import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_tv_series_airing_today.dart';
import 'package:ditonton/domain/usecases/get_tv_series_popular.dart';
import 'package:ditonton/domain/usecases/get_tv_series_top_rated.dart';
import 'package:ditonton/presentation/provider/tv_series_list_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_list_notifier_test.mocks.dart';

///
/// Provider (ChangeNotifier) [TvSeriesListNotifier],
/// bergantung pada:
///   -usecase [GetTvSeriesAiringToday]
///   -usecase [GetTvSeriesPopular]
///   -usecase [GetTvSeriesTopRated]
///
@GenerateMocks([
  GetTvSeriesAiringToday,
  GetTvSeriesPopular,
  GetTvSeriesTopRated,
])
void main() {
  late TvSeriesListNotifier provider;
  late MockGetTvSeriesAiringToday mockGetTvSeriesAiringToday;
  late MockGetTvSeriesPopular mockGetTvSeriesPopular;
  late MockGetTvSeriesTopRated mockGetTvSeriesTopRated;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTvSeriesAiringToday = MockGetTvSeriesAiringToday();
    mockGetTvSeriesPopular = MockGetTvSeriesPopular();
    mockGetTvSeriesTopRated = MockGetTvSeriesTopRated();
    provider = TvSeriesListNotifier(
      getTvSeriesAiringTodayUseCase: mockGetTvSeriesAiringToday,
      getTvSeriesPopularUseCase: mockGetTvSeriesPopular,
      getTvSeriesTopRatedUseCase: mockGetTvSeriesTopRated,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  group(
    'Tv Series Airing Today',
    () {
      test(
        'should have RequestState.empty on airingTodayState, '
        'when provider still on initialState',
        () {
          // assert
          expect(provider.airingTodayState, RequestState.Empty);
        },
      );

      test(
        'should called the usecase',
        () {
          // arrange
          when(
            mockGetTvSeriesAiringToday.execute(),
          ).thenAnswer(
            (_) async => Right(tTvSeriesList),
          );

          // act
          provider.fetchAiringToday();

          // assert
          verify(mockGetTvSeriesAiringToday.execute());
        },
      );

      test(
        'should change state to loading, '
        'when usecase is called',
        () {
          // arrange
          when(
            mockGetTvSeriesAiringToday.execute(),
          ).thenAnswer(
            (_) async => Right(tTvSeriesList),
          );

          // act
          provider.fetchAiringToday();

          // assert
          verify(mockGetTvSeriesAiringToday.execute());

          final result = provider.airingTodayState;
          expect(result, RequestState.Loading);
        },
      );

      test(
        'should change tv series airing today list when data is gotten successfully',
        () async {
          // arrange
          when(mockGetTvSeriesAiringToday.execute()).thenAnswer(
            (_) async => Right(tTvSeriesList),
          );

          // act
          await provider.fetchAiringToday();

          // assert
          expect(provider.airingTodayState, RequestState.Loaded);
          expect(provider.tvSeriesAiringTodayList, tTvSeriesList);
          expect(listenerCallCount, 2);
        },
      );

      test(
        'should return error when data is gotten unsuccessful',
        () async {
          // arrange
          when(mockGetTvSeriesAiringToday.execute()).thenAnswer(
            (_) async => Left(ServerFailure('')),
          );

          // act
          await provider.fetchAiringToday();

          // assert
          expect(provider.airingTodayState, RequestState.Error);
          expect(listenerCallCount, 2);
        },
      );

      test(
        'should return error when data is gotten unsuccessful',
        () async {
          // arrange
          when(mockGetTvSeriesAiringToday.execute()).thenAnswer(
            (_) async => Left(ServerFailure('Server Failure')),
          );

          // act
          await provider.fetchAiringToday();

          // assert
          expect(provider.airingTodayState, RequestState.Error);
          expect(provider.message, 'Server Failure');
          expect(listenerCallCount, 2);
        },
      );
    },
  );

  group(
    'Tv Series Popular',
    () {
      test(
        'should have RequestState.empty on popularState, '
        'when provider still on initialState',
        () {
          // assert
          expect(provider.popularState, RequestState.Empty);
        },
      );

      test(
        'should called the usecase',
        () {
          // arrange
          when(
            mockGetTvSeriesPopular.execute(),
          ).thenAnswer(
            (_) async => Right(tTvSeriesList),
          );

          // act
          provider.fetchPopular();

          // assert
          verify(mockGetTvSeriesPopular.execute());
        },
      );

      test(
        'should change state to loading, '
        'when usecase is called',
        () {
          // arrange
          when(
            mockGetTvSeriesPopular.execute(),
          ).thenAnswer(
            (_) async => Right(tTvSeriesList),
          );

          // act
          provider.fetchPopular();

          // assert
          verify(mockGetTvSeriesPopular.execute());

          final result = provider.popularState;
          expect(result, RequestState.Loading);
        },
      );

      test(
        'should change tv series popular list when data is gotten successfully',
        () async {
          // arrange
          when(mockGetTvSeriesPopular.execute()).thenAnswer(
            (_) async => Right(tTvSeriesList),
          );

          // act
          await provider.fetchPopular();

          // assert
          expect(provider.popularState, RequestState.Loaded);
          expect(provider.tvSeriesPopularList, tTvSeriesList);
          expect(listenerCallCount, 2);
        },
      );

      test(
        'should return error when data is gotten unsuccessful',
        () async {
          // arrange
          when(mockGetTvSeriesPopular.execute()).thenAnswer(
            (_) async => Left(ServerFailure('')),
          );

          // act
          await provider.fetchPopular();

          // assert
          expect(provider.popularState, RequestState.Error);
          expect(listenerCallCount, 2);
        },
      );

      test(
        'should return error when data is gotten unsuccessful',
        () async {
          // arrange
          when(mockGetTvSeriesPopular.execute()).thenAnswer(
            (_) async => Left(ServerFailure('Server Failure')),
          );

          // act
          await provider.fetchPopular();

          // assert
          expect(provider.popularState, RequestState.Error);
          expect(provider.message, 'Server Failure');
          expect(listenerCallCount, 2);
        },
      );
    },
  );

  group(
    'Tv Series Top Rated',
    () {
      test(
        'should have RequestState.empty on topRatedState, '
            'when provider still on initialState',
            () {
          // assert
          expect(provider.topRatedState, RequestState.Empty);
        },
      );

      test(
        'should called the usecase',
            () {
          // arrange
          when(
            mockGetTvSeriesTopRated.execute(),
          ).thenAnswer(
                (_) async => Right(tTvSeriesList),
          );

          // act
          provider.fetchTopRated();

          // assert
          verify(mockGetTvSeriesTopRated.execute());
        },
      );

      test(
        'should change state to loading, '
            'when usecase is called',
            () {
          // arrange
          when(
            mockGetTvSeriesTopRated.execute(),
          ).thenAnswer(
                (_) async => Right(tTvSeriesList),
          );

          // act
          provider.fetchTopRated();

          // assert
          verify(mockGetTvSeriesTopRated.execute());

          final result = provider.topRatedState;
          expect(result, RequestState.Loading);
        },
      );

      test(
        'should change tv series airing today list when data is gotten successfully',
            () async {
          // arrange
          when(mockGetTvSeriesTopRated.execute()).thenAnswer(
                (_) async => Right(tTvSeriesList),
          );

          // act
          await provider.fetchTopRated();

          // assert
          expect(provider.topRatedState, RequestState.Loaded);
          expect(provider.tvSeriesTopRatedList, tTvSeriesList);
          expect(listenerCallCount, 2);
        },
      );

      test(
        'should return error when data is gotten unsuccessful',
            () async {
          // arrange
          when(mockGetTvSeriesTopRated.execute()).thenAnswer(
                (_) async => Left(ServerFailure('')),
          );

          // act
          await provider.fetchTopRated();

          // assert
          expect(provider.topRatedState, RequestState.Error);
          expect(listenerCallCount, 2);
        },
      );

      test(
        'should return error when data is gotten unsuccessful',
            () async {
          // arrange
          when(mockGetTvSeriesTopRated.execute()).thenAnswer(
                (_) async => Left(ServerFailure('Server Failure')),
          );

          // act
          await provider.fetchTopRated();

          // assert
          expect(provider.topRatedState, RequestState.Error);
          expect(provider.message, 'Server Failure');
          expect(listenerCallCount, 2);
        },
      );
    },
  );
}
