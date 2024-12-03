import 'package:ditonton/data/models/watchlist_table.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';

class TvSeriesTable extends WatchListTable {
  const TvSeriesTable({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.overview,
  }) : super(watchListTable: WatchListTableType.tvSeries);


  factory TvSeriesTable.fromEntity(TvSeriesDetail tvSeries) => TvSeriesTable(
    id: tvSeries.id ?? 0,
    title: tvSeries.name ?? '',
    posterPath: tvSeries.posterPath,
    overview: tvSeries.overview,
  );

  factory TvSeriesTable.fromMap(Map<String, dynamic> map) => TvSeriesTable(
    id: map['id'],
    title: map['title'],
    posterPath: map['posterPath'],
    overview: map['overview'],
  );

  TvSeries toEntity() => TvSeries.watchlist(
    id: id,
    overview: overview,
    posterPath: posterPath,
    name: title,
  );
}
