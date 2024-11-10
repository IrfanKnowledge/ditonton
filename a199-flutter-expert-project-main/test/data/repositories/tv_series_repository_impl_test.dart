import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/tv_series_remote_data_source.dart';
import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:ditonton/data/repositories/tv_series_repository_impl.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

///
/// Repository Implement [TvSeriesRepositoryImpl], bergantung
/// pada Remote Data Source [TvSeriesRemoteDataSource]
///
void main() {
  late TvSeriesRepositoryImpl tvSeriesRepositoryImpl;
  late MockTvSeriesRemoteDataSource mockTvSeriesRemoteDataSource;

  setUp(
    () {
      mockTvSeriesRemoteDataSource = MockTvSeriesRemoteDataSource();
      tvSeriesRepositoryImpl = TvSeriesRepositoryImpl(
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
          final result = await tvSeriesRepositoryImpl.getTvSeriesAiringToday();

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
          final result = await tvSeriesRepositoryImpl.getTvSeriesAiringToday();

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
          final result = await tvSeriesRepositoryImpl.getTvSeriesAiringToday();

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
          final result = await tvSeriesRepositoryImpl.getTvSeriesAiringToday();

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
          final result = await tvSeriesRepositoryImpl.getTvSeriesPopular();

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
          final result = await tvSeriesRepositoryImpl.getTvSeriesPopular();

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
          final result = await tvSeriesRepositoryImpl.getTvSeriesPopular();

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
          final result = await tvSeriesRepositoryImpl.getTvSeriesPopular();

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
          final result = await tvSeriesRepositoryImpl.getTvSeriesTopRated();

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
          final result = await tvSeriesRepositoryImpl.getTvSeriesTopRated();

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
          final result = await tvSeriesRepositoryImpl.getTvSeriesTopRated();

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
          final result = await tvSeriesRepositoryImpl.getTvSeriesTopRated();

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
}
