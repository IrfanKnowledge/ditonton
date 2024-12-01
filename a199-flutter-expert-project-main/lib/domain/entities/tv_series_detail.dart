import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'tv_series_season.dart';

part 'tv_series_detail.freezed.dart';

@unfreezed
class TvSeriesDetail extends Equatable with _$TvSeriesDetail {
  TvSeriesDetail._();

  factory TvSeriesDetail({
    bool? adult,
    String? backdropPath,
    DateTime? firstAirDate,
    List<Genre>? genres,
    String? homepage,
    int? id,
    bool? inProduction,
    DateTime? lastAirDate,
    String? name,
    int? numberOfEpisodes,
    int? numberOfSeasons,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    List<TvSeriesSeason>? seasons,
    String? status,
    String? tagline,
    String? type,
    int? voteAverage,
    int? voteCount,
  }) = _TvSeriesDetail;

  factory TvSeriesDetail.required({
    required bool? adult,
    required String? backdropPath,
    required DateTime? firstAirDate,
    required List<Genre>? genres,
    required String? homepage,
    required int? id,
    required bool? inProduction,
    required DateTime? lastAirDate,
    required String? name,
    required int? numberOfEpisodes,
    required int? numberOfSeasons,
    required String? originalLanguage,
    required String? originalName,
    required String? overview,
    required double? popularity,
    required String? posterPath,
    required List<TvSeriesSeason>? seasons,
    required String? status,
    required String? tagline,
    required String? type,
    required int? voteAverage,
    required int? voteCount,
  }) {
    return TvSeriesDetail(
      adult: adult,
      backdropPath: backdropPath,
      firstAirDate: firstAirDate,
      genres: genres,
      homepage: homepage,
      id: id,
      inProduction: inProduction,
      lastAirDate: lastAirDate,
      name: name,
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons,
      originalLanguage: originalLanguage,
      originalName: originalName,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      seasons: seasons,
      status: status,
      tagline: tagline,
      type: type,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      firstAirDate,
      genres,
      homepage,
      id,
      inProduction,
      lastAirDate,
      name,
      numberOfEpisodes,
      numberOfSeasons,
      originalLanguage,
      originalName,
      overview,
      popularity,
      posterPath,
      seasons,
      status,
      tagline,
      type,
      voteAverage,
      voteCount,
    ];
  }
}
