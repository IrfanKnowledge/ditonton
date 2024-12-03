import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_searched.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv_series.dart';

import '../usecases/get_tv_series_detail.dart';
import '../usecases/get_tv_series_detail_recommendtaions.dart';
import '../usecases/save_watchlist_tv_series.dart';

abstract class TvSeriesRepository {
  Future<Either<Failure, List<TvSeries>>> getTvSeriesAiringToday();

  Future<Either<Failure, List<TvSeries>>> getTvSeriesPopular();

  Future<Either<Failure, List<TvSeries>>> getTvSeriesTopRated();

  Future<Either<Failure, TvSeriesDetail>> getTvSeriesDetail(GetTvSeriesDetailParams params);

  Future<Either<Failure, List<TvSeries>>> getTvSeriesDetailRecommendations(GetTvSeriesDetailRecommendationsParams params);

  Future<Either<Failure, List<TvSeries>>> getTvSeriesSearched(GetTvSeriesSearchedParams params);

  Future<Either<Failure, String>> saveWatchlist(SaveWatchlistTvSeriesParams tvSeries);

  Future<Either<Failure, String>> removeWatchlist(RemoveWatchlistTvSeriesParams params);

  Future<bool> getWatchlistStatus(GetWatchlistStatusTvSeriesParams params);

  Future<Either<Failure, List<TvSeries>>> getWatchlistTvSeries();
}
