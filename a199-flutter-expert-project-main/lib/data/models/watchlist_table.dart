import 'package:equatable/equatable.dart';

abstract class WatchListTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;
  final WatchListTableType watchListTable;

  const WatchListTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.watchListTable,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'posterPath': posterPath,
    'overview': overview,
    'watch_list_table_type': watchListTable.name,
  };
  
  @override
  List<Object?> get props => [
    id,
    title,
    posterPath,
    overview,
    watchListTable,
  ];

}

enum WatchListTableType {
  movie,
  tvSeries,
}
