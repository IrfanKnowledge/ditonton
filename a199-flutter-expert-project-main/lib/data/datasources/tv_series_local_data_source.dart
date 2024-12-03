import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/tv_series/tv_series_table.dart';
import 'package:ditonton/data/models/watchlist_table.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv_series.dart';

import 'db/database_helper.dart';

abstract class TvSeriesLocalDataSource {
  Future<String> saveWatchlist(SaveWatchlistTvSeriesParams params);

  Future<String> removeWatchlist(RemoveWatchlistTvSeriesParams params);

  Future<TvSeriesTable?> getWatchlistStatus(
      GetWatchlistStatusTvSeriesParams params);

  Future<List<TvSeriesTable>> getWatchlistTvSeries();
}

class TvSeriesLocalDataSourceImpl implements TvSeriesLocalDataSource {
  final DatabaseHelper databaseHelper;

  TvSeriesLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<List<TvSeriesTable>> getWatchlistTvSeries() async {
    final data = await databaseHelper.getWatchlistMovies(
      type: WatchListTableType.tvSeries,
    );
    return data.map((e) => TvSeriesTable.fromMap(e)).toList();
  }

  @override
  Future<TvSeriesTable?> getWatchlistStatus(
      GetWatchlistStatusTvSeriesParams params) async {
    final data = await databaseHelper.getMovieById(params.id);

    if (data != null) {
      return TvSeriesTable.fromMap(data);
    } else {
      return null;
    }
  }

  @override
  Future<String> removeWatchlist(RemoveWatchlistTvSeriesParams params) async {
    try {
      await databaseHelper.removeWatchlist(params.toTable());
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> saveWatchlist(SaveWatchlistTvSeriesParams params) async {
    try {
      await databaseHelper.insertWatchlist(params.toTable());
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
