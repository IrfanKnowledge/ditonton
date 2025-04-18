import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:equatable/equatable.dart';

import '../../common/failure.dart';

class SaveWatchlistTvSeries {
  final TvSeriesRepository repository;

  SaveWatchlistTvSeries({required this.repository});

  Future<Either<Failure, String>> execute(SaveWatchlistTvSeriesParams params) {
    return repository.saveWatchlist(params);
  }
}

class SaveWatchlistTvSeriesParams extends Equatable {
  final TvSeriesDetail tvSeriesDetail;

  const SaveWatchlistTvSeriesParams({required this.tvSeriesDetail});

  @override
  List<Object?> get props {
    return [
      tvSeriesDetail,
    ];
  }
}
