import 'dart:convert';
import 'dart:io';

import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/datasources/tv_series_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_series_remote_data_source.dart';
import 'package:ditonton/data/models/tv_series/tv_series_detail_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_response_model.dart';
import 'package:ditonton/data/models/watchlist_table.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail_recommendtaions.dart';
import 'package:ditonton/domain/usecases/get_tv_series_searched.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv_series.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

///
/// Remote Data Source [TvSeriesLocalDataSourceImpl], bergantung pada
/// [DatabaseHelper] yang melakukan request data melalui API.
///
void main() {
  late TvSeriesLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = TvSeriesLocalDataSourceImpl(
      databaseHelper: mockDatabaseHelper,
    );
  });

  group('Tv Series, Save Watchlist', () {
    late SaveWatchlistTvSeriesParams params;

    setUp(
      () {
        params = SaveWatchlistTvSeriesParams(tvSeriesDetail: tTvSeriesDetail);
      },
    );

    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlist(tTvSeriesTable))
          .thenAnswer((_) async => tTvSeriesTable.id);

      // act
      final result = await dataSource.saveWatchlist(params);

      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlist(tTvSeriesTable))
          .thenThrow(Exception());

      // act
      final call = dataSource.saveWatchlist(params);

      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Tv Series, Remove Watchlist', () {
    late RemoveWatchlistTvSeriesParams params;

    setUp(
      () {
        params = RemoveWatchlistTvSeriesParams(tvSeriesDetail: tTvSeriesDetail);
      },
    );

    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlist(tTvSeriesTable))
          .thenAnswer((_) async => tTvSeriesTable.id);
      // act
      final result = await dataSource.removeWatchlist(params);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlist(tTvSeriesTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchlist(params);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Tv Series, Watchlist Status', () {
    late GetWatchlistStatusTvSeriesParams params;

    setUp(
      () {
        params = GetWatchlistStatusTvSeriesParams(id: tTvSeriesDetail.id!);
      },
    );

    test('should return Tv Series Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getMovieById(params.id))
          .thenAnswer((_) async => tTvSeriesMap);
      // act
      final result = await dataSource.getWatchlistStatus(params);

      // assert
      expect(result, tTvSeriesTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getMovieById(params.id))
          .thenAnswer((_) async => null);

      // act
      final result = await dataSource.getWatchlistStatus(params);

      // assert
      expect(result, null);
    });
  });

  group('Tv Series, watchlist tv series', () {
    test('should return list of TvSeriesTable from database', () async {
      // arrange
      when(
        mockDatabaseHelper.getWatchlistMovies(
          type: WatchListTableType.tvSeries,
        ),
      ).thenAnswer((_) async => tTvSeriesMapList);

      // act
      final result = await dataSource.getWatchlistTvSeries();

      // assert
      expect(result, tTvSeriesTableList);
    });
  });
}
