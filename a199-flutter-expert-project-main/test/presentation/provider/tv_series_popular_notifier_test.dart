import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_tv_series_popular.dart';
import 'package:ditonton/presentation/provider/tv_series_popular_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_popular_notifier_test.mocks.dart';

///
/// Provider (ChangeNotifier) [TvSeriesPopularNotifier],
/// bergantung pada usecase [GetTvSeriesPopular]
///
@GenerateMocks([GetTvSeriesPopular])
void main() {
  late TvSeriesPopularNotifier provider;
  late MockGetTvSeriesPopular mockUseCase;
  late int listenerCallCount;

  setUp(
    () {
      listenerCallCount = 0;
      mockUseCase = MockGetTvSeriesPopular();
      provider = TvSeriesPopularNotifier(
        getTvSeriesPopularUseCase: mockUseCase,
      )..addListener(
          () {
            listenerCallCount += 1;
          },
        );
    },
  );

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
        mockUseCase.execute(),
      ).thenAnswer(
            (_) async => Right(tTvSeriesList),
      );

      // act
      provider.fetchPopular();

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
      provider.fetchPopular();

      // assert
      verify(mockUseCase.execute());

      final result = provider.popularState;
      expect(result, RequestState.Loading);
    },
  );

  test(
    'should change tv series popular list when data is gotten successfully',
        () async {
      // arrange
      when(mockUseCase.execute()).thenAnswer(
            (_) async => Right(tTvSeriesList),
      );

      // act
      await provider.fetchPopular();

      // assert
      expect(provider.popularState, RequestState.Loaded);
      expect(provider.tvSeriesList, tTvSeriesList);
      expect(listenerCallCount, 2);
    },
  );

  test(
    'should return error when data is gotten unsuccessful',
        () async {
      // arrange
      when(mockUseCase.execute()).thenAnswer(
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
      when(mockUseCase.execute()).thenAnswer(
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
}
