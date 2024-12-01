import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_season_model.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series_detail_model.freezed.dart';

part 'tv_series_detail_model.g.dart';

@freezed
class TvSeriesDetailModel extends Equatable with _$TvSeriesDetailModel {
  const TvSeriesDetailModel._();

  const factory TvSeriesDetailModel({
    required bool? adult,
    @JsonKey(name: 'backdrop_path') required String? backdropPath,
    @JsonKey(name: 'first_air_date') required DateTime? firstAirDate,
    required List<GenreModel>? genres,
    required String? homepage,
    required int? id,
    @JsonKey(name: 'in_production') required bool? inProduction,
    @JsonKey(name: 'last_air_date') required DateTime? lastAirDate,
    required String? name,
    @JsonKey(name: 'number_of_episodes') required int? numberOfEpisodes,
    @JsonKey(name: 'number_of_seasons') required int? numberOfSeasons,
    @JsonKey(name: 'original_language') required String? originalLanguage,
    @JsonKey(name: 'original_name') required String? originalName,
    required String? overview,
    required double? popularity,
    @JsonKey(name: 'poster_path') required String? posterPath,
    required List<TvSeriesSeasonModel>? seasons,
    required String? status,
    required String? tagline,
    required String? type,
    @JsonKey(name: 'vote_average') required int? voteAverage,
    @JsonKey(name: 'vote_count') required int? voteCount,
  }) = _TvSeriesDetailModel;

  factory TvSeriesDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeriesDetailModelFromJson(json);

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

  TvSeriesDetail toEntity() {
    return TvSeriesDetail(
      adult: adult,
      backdropPath: backdropPath,
      firstAirDate: firstAirDate,
      genres: genres?.map((e) => e.toEntity()).toList(),
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
      seasons: seasons?.map((e) => e.toEntity(),).toList(),
      status: status,
      tagline: tagline,
      type: type,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
