import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_tv_series_airing_today.dart';
import 'package:ditonton/presentation/provider/tv_series_airing_today_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_airing_today_notifier_test.mocks.dart';

///
/// Provider (ChangeNotifier) [TvSeriesAiringTodayNotifier],
/// bergantung pada usecase [GetTvSeriesAiringToday]
///
@GenerateMocks([GetTvSeriesAiringToday])
void main() {
  late TvSeriesAiringTodayNotifier provider;
  late MockGetTvSeriesAiringToday mockUseCase;
  late int listenerCallCount;

  setUp(
    () {
      listenerCallCount = 0;
      mockUseCase = MockGetTvSeriesAiringToday();
      provider = TvSeriesAiringTodayNotifier(
        getTvSeriesAiringTodayUseCase: mockUseCase,
      )..addListener(() {
        listenerCallCount += 1;
      },);
    },
  );

  test(
    'should have RequestState.empty on airingTodayState, '
    'when provider still on initialState',
    () {
      // assert
      expect(provider.airingTodayState, RequestState.empty);
    },
  );

  test(
    'should called the usecase',
    () {
      // arrange
      when(
        mockUseCase.execute(),
      ).thenAnswer(
        (_) async => Right(tTvSeriesList),
      );

      // act
      provider.fetchAiringToday();

      // assert
      verify(mockUseCase.execute());
    },
  );

  test(
    'should change state to loading, '
    'when usecase is called',
    () {
      // arrange
      when(
        mockUseCase.execute(),
      ).thenAnswer(
        (_) async => Right(tTvSeriesList),
      );

      // act
      provider.fetchAiringToday();

      // assert
      verify(mockUseCase.execute());

      final result = provider.airingTodayState;
      expect(result, RequestState.loading);
    },
  );

  test(
    'should change tv series airing today list when data is gotten successfully',
    () async {
      // arrange
      when(mockUseCase.execute()).thenAnswer(
        (_) async => Right(tTvSeriesList),
      );

      // act
      await provider.fetchAiringToday();

      // assert
      expect(provider.airingTodayState, RequestState.loaded);
      expect(provider.tvSeriesList, tTvSeriesList);
      expect(listenerCallCount, 2);
    },
  );

  test(
    'should return error when data is gotten unsuccessful',
        () async {
      // arrange
      when(mockUseCase.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('')),
      );

      // act
      await provider.fetchAiringToday();

      // assert
      expect(provider.airingTodayState, RequestState.error);
      expect(listenerCallCount, 2);
    },
  );

  test(
    'should return error when data is gotten unsuccessful',
        () async {
      // arrange
      when(mockUseCase.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')),
      );

      // act
      await provider.fetchAiringToday();

      // assert
      expect(provider.airingTodayState, RequestState.error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    },
  );
}
