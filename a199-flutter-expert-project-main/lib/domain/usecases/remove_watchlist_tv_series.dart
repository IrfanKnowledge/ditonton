import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:equatable/equatable.dart';

import '../../common/failure.dart';

class RemoveWatchlistTvSeries {
  final TvSeriesRepository repository;

  RemoveWatchlistTvSeries({required this.repository});

  Future<Either<Failure, String>> execute(
      RemoveWatchlistTvSeriesParams params) {
    return repository.removeWatchlist(params);
  }
}

class RemoveWatchlistTvSeriesParams extends Equatable {
  final TvSeriesDetail tvSeriesDetail;

  const RemoveWatchlistTvSeriesParams({required this.tvSeriesDetail});

  @override
  List<Object?> get props => [
        tvSeriesDetail,
      ];
}
