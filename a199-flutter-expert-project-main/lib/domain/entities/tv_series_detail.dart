import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'tv_series_season.dart';

part 'tv_series_detail.freezed.dart';

@unfreezed
class TvSeriesDetail extends Equatable with _$TvSeriesDetail {
  TvSeriesDetail._();

  factory TvSeriesDetail({
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
  }) = _TvSeriesDetail;

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
