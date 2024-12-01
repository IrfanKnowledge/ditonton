
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../common/failure.dart';
import '../entities/tv_series_detail.dart';
import '../repositories/tv_series_repository.dart';

class GetTvSeriesDetail {
  final TvSeriesRepository repository;

  GetTvSeriesDetail({required this.repository});

  Future<Either<Failure, TvSeriesDetail>> execute(GetTvSeriesDetailParams params) {
    return repository.getTvSeriesDetail(params);
  }
}

class GetTvSeriesDetailParams extends Equatable {
  final int id;

  const GetTvSeriesDetailParams({required this.id});

  @override
  List<Object?> get props {
    return [id];
  }
}