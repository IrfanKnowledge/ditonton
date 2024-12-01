import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/tv_series_remote_data_source.dart';
import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:ditonton/data/repositories/tv_series_repository_impl.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail_recommendtaions.dart';
import 'package:ditonton/domain/usecases/get_tv_series_searched.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

///
/// Repository Implement [TvSeriesRepositoryImpl], bergantung
/// pada Remote Data Source [TvSeriesRemoteDataSource]
///
void main() {
  late TvSeriesRepositoryImpl tvSeriesRepository;
  late MockTvSeriesRemoteDataSource mockTvSeriesRemoteDataSource;

  setUp(
    () {
      mockTvSeriesRemoteDataSource = MockTvSeriesRemoteDataSource();
      tvSeriesRepository = TvSeriesRepositoryImpl(
        remoteDataSource: mockTvSeriesRemoteDataSource,
      );
    },
  );

  final tTvSeriesModelListEmpty = <TvSeriesModel>[];
  final tTvSeriesListEmpty = <TvSeries>[];

  group(
    "Tv Series, Airing Today",
    () {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockTvSeriesRemoteDataSource.getTvSeriesAiringToday())
              .thenAnswer(
            (_) async => tTvSeriesModelList,
          );

          // act
          final result = await tvSeriesRepository.getTvSeriesAiringToday();

          // assert
          verify(mockTvSeriesRemoteDataSource.getTvSeriesAiringToday());

          // act
          final resultList = result.getOrElse(() => []);

          // assert
          expect(resultList, tTvSeriesList);
        },
      );

      test(
        'should return remote data when the call to remote data source is successful and empty list',
        () async {
          // arrange
          when(mockTvSeriesRemoteDataSource.getTvSeriesAiringToday())
              .thenAnswer(
            (_) async => tTvSeriesModelListEmpty,
          );

          // act
          final result = await tvSeriesRepository.getTvSeriesAiringToday();

          // assert
          verify(mockTvSeriesRemoteDataSource.getTvSeriesAiringToday());

          // act
          final resultList = result.getOrElse(() => []);

          // assert
          expect(resultList, tTvSeriesListEmpty);
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockTvSeriesRemoteDataSource.getTvSeriesAiringToday())
              .thenThrow(ServerException());

          // act
          final result = await tvSeriesRepository.getTvSeriesAiringToday();

          // assert
          verify(mockTvSeriesRemoteDataSource.getTvSeriesAiringToday());

          // assert
          expect(result, Left(ServerFailure('')));
        },
      );

      test(
        'should return connection failure when the device is not connected to internet',
        () async {
          // arrange
          when(mockTvSeriesRemoteDataSource.getTvSeriesAiringToday()).thenThrow(
              const SocketException('Failed to connect to the network'));

          // act
          final result = await tvSeriesRepository.getTvSeriesAiringToday();

          // assert
          verify(mockTvSeriesRemoteDataSource.getTvSeriesAiringToday());

          // assert
          expect(
            result,
            Left(ConnectionFailure('Failed to connect to the network')),
          );
        },
      );
    },
  );

  group(
    "Tv Series, Popular",
    () {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockTvSeriesRemoteDataSource.getTvSeriesPopular()).thenAnswer(
            (_) async => tTvSeriesModelList,
          );

          // act
          final result = await tvSeriesRepository.getTvSeriesPopular();

          // assert
          verify(mockTvSeriesRemoteDataSource.getTvSeriesPopular());

          // act
          final resultList = result.getOrElse(() => []);

          // assert
          expect(resultList, tTvSeriesList);
        },
      );

      test(
        'should return remote data when the call to remote data source is successful and empty list',
        () async {
          // arrange
          when(mockTvSeriesRemoteDataSource.getTvSeriesPopular()).thenAnswer(
            (_) async => tTvSeriesModelListEmpty,
          );

          // act
          final result = await tvSeriesRepository.getTvSeriesPopular();

          // assert
          verify(mockTvSeriesRemoteDataSource.getTvSeriesPopular());

          // act
          final resultList = result.getOrElse(() => []);

          // assert
          expect(resultList, tTvSeriesListEmpty);
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockTvSeriesRemoteDataSource.getTvSeriesPopular())
              .thenThrow(ServerException());

          // act
          final result = await tvSeriesRepository.getTvSeriesPopular();

          // assert
          verify(mockTvSeriesRemoteDataSource.getTvSeriesPopular());

          // assert
          expect(result, Left(ServerFailure('')));
        },
      );

      test(
        'should return connection failure when the device is not connected to internet',
        () async {
          // arrange
          when(mockTvSeriesRemoteDataSource.getTvSeriesPopular()).thenThrow(
              const SocketException('Failed to connect to the network'));

          // act
          final result = await tvSeriesRepository.getTvSeriesPopular();

          // assert
          verify(mockTvSeriesRemoteDataSource.getTvSeriesPopular());

          // assert
          expect(
            result,
            Left(ConnectionFailure('Failed to connect to the network')),
          );
        },
      );
    },
  );

  group(
    "Tv Series, Top Rated",
    () {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockTvSeriesRemoteDataSource.getTvSeriesTopRated()).thenAnswer(
            (_) async => tTvSeriesModelList,
          );

          // act
          final result = await tvSeriesRepository.getTvSeriesTopRated();

          // assert
          verify(mockTvSeriesRemoteDataSource.getTvSeriesTopRated());

          // act
          final resultList = result.getOrElse(() => []);

          // assert
          expect(resultList, tTvSeriesList);
        },
      );

      test(
        'should return remote data when the call to remote data source is successful and empty list',
        () async {
          // arrange
          when(mockTvSeriesRemoteDataSource.getTvSeriesTopRated()).thenAnswer(
            (_) async => tTvSeriesModelListEmpty,
          );

          // act
          final result = await tvSeriesRepository.getTvSeriesTopRated();

          // assert
          verify(mockTvSeriesRemoteDataSource.getTvSeriesTopRated());

          // act
          final resultList = result.getOrElse(() => []);

          // assert
          expect(resultList, tTvSeriesListEmpty);
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockTvSeriesRemoteDataSource.getTvSeriesTopRated())
              .thenThrow(ServerException());

          // act
          final result = await tvSeriesRepository.getTvSeriesTopRated();

          // assert
          verify(mockTvSeriesRemoteDataSource.getTvSeriesTopRated());

          // assert
          expect(result, Left(ServerFailure('')));
        },
      );

      test(
        'should return connection failure when the device is not connected to internet',
        () async {
          // arrange
          when(mockTvSeriesRemoteDataSource.getTvSeriesTopRated()).thenThrow(
              const SocketException('Failed to connect to the network'));

          // act
          final result = await tvSeriesRepository.getTvSeriesTopRated();

          // assert
          verify(mockTvSeriesRemoteDataSource.getTvSeriesTopRated());

          // assert
          expect(
            result,
            Left(ConnectionFailure('Failed to connect to the network')),
          );
        },
      );
    },
  );

  group(
    "Tv Series, Detail",
    () {
      late GetTvSeriesDetailParams params;

      setUp(
        () {
          params = GetTvSeriesDetailParams(id: tTvSeriesDetail.id!);
        },
      );

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockTvSeriesRemoteDataSource.getTvSeriesDetail(params))
              .thenAnswer(
            (_) async => tTvSeriesDetailModel,
          );

          // act
          final result = await tvSeriesRepository.getTvSeriesDetail(params);

          // assert
          verify(mockTvSeriesRemoteDataSource.getTvSeriesDetail(params));

          // assert
          expect(result, Right(tTvSeriesDetail));

          final rightValue = result.getOrElse(
            () => TvSeriesDetail(),
          );

          // assert
          expect(rightValue, tTvSeriesDetail);
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockTvSeriesRemoteDataSource.getTvSeriesDetail(params))
              .thenThrow(ServerException());

          // act
          final result = await tvSeriesRepository.getTvSeriesDetail(params);

          // assert
          verify(mockTvSeriesRemoteDataSource.getTvSeriesDetail(params));

          // assert
          expect(result, Left(ServerFailure('')));
        },
      );

      test(
        'should return connection failure when the device is not connected to internet',
        () async {
          // arrange
          when(mockTvSeriesRemoteDataSource.getTvSeriesDetail(params))
              .thenThrow(
                  const SocketException('Failed to connect to the network'));

          // act
          final result = await tvSeriesRepository.getTvSeriesDetail(params);

          // assert
          verify(mockTvSeriesRemoteDataSource.getTvSeriesDetail(params));

          // assert
          expect(
            result,
            Left(ConnectionFailure('Failed to connect to the network')),
          );
        },
      );
    },
  );

  group(
    "Tv Series, Detail, Recommendations",
    () {
      late GetTvSeriesDetailRecommendationsParams params;

      setUp(
        () {
          params = GetTvSeriesDetailRecommendationsParams(
            id: tTvSeriesDetailRecommendation.id!,
          );
        },
      );

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(
            mockTvSeriesRemoteDataSource
                .getTvSeriesDetailRecommendations(params),
          ).thenAnswer(
            (_) async => tTvSeriesDetailRecommendationModelList,
          );

          // act
          final result = await tvSeriesRepository
              .getTvSeriesDetailRecommendations(params);

          // assert
          verify(
            mockTvSeriesRemoteDataSource
                .getTvSeriesDetailRecommendations(params),
          );

          // act
          final resultList = result.getOrElse(() => []);

          // assert
          expect(resultList, tTvSeriesDetailRecommendationList);
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(
            mockTvSeriesRemoteDataSource
                .getTvSeriesDetailRecommendations(params),
          ).thenThrow(ServerException());

          // act
          final result = await tvSeriesRepository
              .getTvSeriesDetailRecommendations(params);

          // assert
          verify(mockTvSeriesRemoteDataSource
              .getTvSeriesDetailRecommendations(params));

          // assrt
          expect(result, Left(ServerFailure('')));
        },
      );

      test(
        'should return connection failure when the device is not connected to internet',
        () async {
          // arrange
          when(
            mockTvSeriesRemoteDataSource
                .getTvSeriesDetailRecommendations(params),
          ).thenThrow(
            const SocketException('Failed to connect to the network'),
          );

          // act
          final result = await tvSeriesRepository
              .getTvSeriesDetailRecommendations(params);

          // assert
          verify(mockTvSeriesRemoteDataSource
              .getTvSeriesDetailRecommendations(params));

          expect(
            result,
            Left(ConnectionFailure('Failed to connect to the network')),
          );
        },
      );
    },
  );

  group(
    "Tv Series Searched",
    () {
      late GetTvSeriesSearchedParams params;

      setUp(
        () {
          params = GetTvSeriesSearchedParams(
            name: tTvSeriesSearched.name!,
          );
        },
      );

      test(
        'should return remote data when the call to remote data source is successful',
            () async {
          // arrange
          when(
            mockTvSeriesRemoteDataSource
                .getTvSeriesSearched(params),
          ).thenAnswer(
                (_) async => tTvSeriesSearchedModelList,
          );

          // act
          final result = await tvSeriesRepository
              .getTvSeriesSearched(params);

          // assert
          verify(
            mockTvSeriesRemoteDataSource
                .getTvSeriesSearched(params),
          );

          // act
          final resultList = result.getOrElse(() => []);

          // assert
          expect(resultList, tTvSeriesSearchedList);
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
            () async {
          // arrange
          when(
            mockTvSeriesRemoteDataSource
                .getTvSeriesSearched(params),
          ).thenThrow(ServerException());

          // act
          final result = await tvSeriesRepository
              .getTvSeriesSearched(params);

          // assert
          verify(mockTvSeriesRemoteDataSource
              .getTvSeriesSearched(params));

          // assrt
          expect(result, Left(ServerFailure('')));
        },
      );

      test(
        'should return connection failure when the device is not connected to internet',
            () async {
          // arrange
          when(
            mockTvSeriesRemoteDataSource
                .getTvSeriesSearched(params),
          ).thenThrow(
            const SocketException('Failed to connect to the network'),
          );

          // act
          final result = await tvSeriesRepository
              .getTvSeriesSearched(params);

          // assert
          verify(mockTvSeriesRemoteDataSource
              .getTvSeriesSearched(params));

          expect(
            result,
            Left(ConnectionFailure('Failed to connect to the network')),
          );
        },
      );
    },
  );
}
