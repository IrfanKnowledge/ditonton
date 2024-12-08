
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:equatable/equatable.dart';


class GetWatchlistStatusTvSeries {
  final TvSeriesRepository repository;

  GetWatchlistStatusTvSeries({required this.repository});

  Future<bool> execute(GetWatchlistStatusTvSeriesParams params) {
    return repository.getWatchlistStatus(params);
  }
}

class GetWatchlistStatusTvSeriesParams extends Equatable {
  final int id;

  const GetWatchlistStatusTvSeriesParams({required this.id});

  @override
  List<Object?> get props => [id];
}