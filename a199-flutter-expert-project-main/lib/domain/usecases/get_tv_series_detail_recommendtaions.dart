
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:equatable/equatable.dart';

class GetTvSeriesDetailRecommendations {
  final TvSeriesRepository repository;

  GetTvSeriesDetailRecommendations({required this.repository});

  Future<Either<Failure, List<TvSeries>>> execute(GetTvSeriesDetailRecommendationsParams params) {
    return repository.getTvSeriesDetailRecommendations(params);
  }
}

class GetTvSeriesDetailRecommendationsParams extends Equatable {
  final int id;

  const GetTvSeriesDetailRecommendationsParams({required this.id});

  @override
  List<Object?> get props {
    return [id];
  }
}