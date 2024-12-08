import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/tv_series_remote_data_source.dart';
import 'package:ditonton/data/models/tv_series/tv_series_detail_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail_recommendtaions.dart';
import 'package:ditonton/domain/usecases/get_tv_series_searched.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv_series.dart';

import '../../domain/usecases/get_tv_series_detail.dart';
import '../../domain/usecases/save_watchlist_tv_series.dart';
import '../datasources/tv_series_local_data_source.dart';

class TvSeriesRepositoryImpl implements TvSeriesRepository {
  final TvSeriesRemoteDataSource remoteDataSource;
  final TvSeriesLocalDataSource localDataSource;

  TvSeriesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<TvSeries>>> getTvSeriesAiringToday() async {
    try {
      final List<TvSeriesModel> dataModel =
          await remoteDataSource.getTvSeriesAiringToday();
      final List<TvSeries> dataEntity =
          dataModel.map((e) => e.toEntity()).toList();

      return Right(dataEntity);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getTvSeriesPopular() async {
    try {
      final List<TvSeriesModel> dataModel =
          await remoteDataSource.getTvSeriesPopular();
      final List<TvSeries> dataEntity =
          dataModel.map((e) => e.toEntity()).toList();

      return Right(dataEntity);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getTvSeriesTopRated() async {
    try {
      final List<TvSeriesModel> dataModel =
          await remoteDataSource.getTvSeriesTopRated();
      final List<TvSeries> dataEntity =
          dataModel.map((e) => e.toEntity()).toList();

      return Right(dataEntity);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TvSeriesDetail>> getTvSeriesDetail(
      GetTvSeriesDetailParams params) async {
    try {
      final TvSeriesDetailModel dataModel =
          await remoteDataSource.getTvSeriesDetail(params);
      final TvSeriesDetail dataEntity = dataModel.toEntity();

      return Right(dataEntity);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getTvSeriesDetailRecommendations(
      GetTvSeriesDetailRecommendationsParams params) async {
    try {
      final List<TvSeriesModel> dataModel =
          await remoteDataSource.getTvSeriesDetailRecommendations(params);
      final List<TvSeries> dataEntity =
          dataModel.map((e) => e.toEntity()).toList();

      return Right(dataEntity);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getTvSeriesSearched(
      GetTvSeriesSearchedParams params) async {
    try {
      final List<TvSeriesModel> dataModel =
          await remoteDataSource.getTvSeriesSearched(params);
      final List<TvSeries> dataEntity =
          dataModel.map((e) => e.toEntity()).toList();

      return Right(dataEntity);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlist(
      SaveWatchlistTvSeriesParams params) async {
    try {
      final data = await localDataSource.saveWatchlist(params);

      return Right(data);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> removeWatchlist(
      RemoveWatchlistTvSeriesParams params) async {
    try {
      final data = await localDataSource.removeWatchlist(params);

      return Right(data);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<bool> getWatchlistStatus(
      GetWatchlistStatusTvSeriesParams params) async {
    final data = await localDataSource.getWatchlistStatus(params);
    return data != null;
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getWatchlistTvSeries() async {
    final data = await localDataSource.getWatchlistTvSeries();
    return Right(data.map((e) => e.toEntity()).toList());
  }
}
