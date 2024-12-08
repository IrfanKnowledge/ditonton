import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_tv_series_top_rated.dart';
import 'package:ditonton/presentation/provider/tv_series_top_rated_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_top_rated_notifier_test.mocks.dart';

///
/// Provider (ChangeNotifier) [TvSeriesTopRatedNotifier],
/// bergantung pada usecase [GetTvSeriesTopRated]
///
@GenerateMocks([
  GetTvSeriesTopRated,
])
void main() {
  late TvSeriesTopRatedNotifier provider;
  late MockGetTvSeriesTopRated mockUseCase;
  late int listenerCallCount;

  setUp(
    () {
      listenerCallCount = 0;
      mockUseCase = MockGetTvSeriesTopRated();
      provider = TvSeriesTopRatedNotifier(
        getTvSeriesTopRatedUseCase: mockUseCase,
      )..addListener(
          () {
            listenerCallCount += 1;
          },
        );
    },
  );

  test(
    'should have RequestState.empty on topRatedState, '
    'when provider still on initialState',
    () {
      // assert
      expect(provider.topRatedState, RequestState.empty);
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
      provider.fetchTopRated();

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
      provider.fetchTopRated();

      // assert
      verify(mockUseCase.execute());

      final result = provider.topRatedState;
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
      await provider.fetchTopRated();

      // assert
      expect(provider.topRatedState, RequestState.loaded);
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
      await provider.fetchTopRated();

      // assert
      expect(provider.topRatedState, RequestState.error);
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
      await provider.fetchTopRated();

      // assert
      expect(provider.topRatedState, RequestState.error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    },
  );
}
