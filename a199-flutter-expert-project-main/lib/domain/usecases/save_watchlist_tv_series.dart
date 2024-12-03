
import 'package:dartz/dartz.dart';
import 'package:ditonton/data/models/tv_series/tv_series_table.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

import '../../common/failure.dart';

class SaveWatchlistTvSeries {
  final TvSeriesRepository repository;

  SaveWatchlistTvSeries({required this.repository});

  Future<Either<Failure, String>> execute(SaveWatchlistTvSeriesParams params) {
    return repository.saveWatchlist(params);
  }
}

class SaveWatchlistTvSeriesParams {
  final TvSeriesDetail tvSeriesDetail;

  SaveWatchlistTvSeriesParams({required this.tvSeriesDetail});

  TvSeriesTable toTable() {
    return TvSeriesTable.fromEntity(tvSeriesDetail);
  }
}