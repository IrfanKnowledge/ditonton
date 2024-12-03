
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:equatable/equatable.dart';

class GetTvSeriesSearched {
  final TvSeriesRepository repository;

  GetTvSeriesSearched({required this.repository});

  Future<Either<Failure, List<TvSeries>>> execute(GetTvSeriesSearchedParams params) {
    return repository.getTvSeriesSearched(params);
  }
}

class GetTvSeriesSearchedParams extends Equatable {
  final String name;

  const GetTvSeriesSearchedParams({required this.name});

  @override
  List<Object?> get props {
    return [name];
  }
}