
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

import '../../common/failure.dart';

class GetWatchlistStatusTvSeries {
  final TvSeriesRepository repository;

  GetWatchlistStatusTvSeries({required this.repository});

  Future<bool> execute(GetWatchlistStatusTvSeriesParams params) {
    return repository.getWatchlistStatus(params);
  }
}

class GetWatchlistStatusTvSeriesParams {
  final int id;

  GetWatchlistStatusTvSeriesParams({required this.id});
}