import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series_model.freezed.dart';

part 'tv_series_model.g.dart';

@freezed
class TvSeriesModel with _$TvSeriesModel {
  const TvSeriesModel._();

  const factory TvSeriesModel({
    required final bool? adult,
    @JsonKey(name: "backdrop_path") required final String? backdropPath,
    @JsonKey(name: "genre_ids") required final List<int>? genreIds,
    required final int? id,
    @JsonKey(name: "origin_country") required final List<String>? originCountry,
    @JsonKey(name: "original_language") required final String? originalLanguage,
    @JsonKey(name: "original_name") required final String? originalName,
    required final String? overview,
    required final num? popularity,
    @JsonKey(name: "poster_path") required final String? posterPath,
    @JsonKey(name: "first_air_date", readValue: TvSeriesModelHelper.firstAirDateReadValue) required final DateTime? firstAirDate,
    required final String? name,
    @JsonKey(name: "vote_average") required final num? voteAverage,
    @JsonKey(name: "vote_count") required final int? voteCount,
    @JsonKey(name: "media_type") required final String? mediaType,
  }) = _TvSeriesModel;

  factory TvSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeriesModelFromJson(json);

  TvSeries toEntity() {
    return TvSeries(
      adult: adult,
      backdropPath: backdropPath,
      genreIds: genreIds,
      id: id,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalName: originalName,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      firstAirDate: firstAirDate,
      name: name,
      voteAverage: voteAverage,
      voteCount: voteCount,
      mediaType: mediaType,
    );
  }
}

class TvSeriesModelHelper {
  static Object? firstAirDateReadValue(Map<dynamic, dynamic> json, String value) {
    String? dataString = json[value];
    DateTime? dataDateTime;

    if (dataString != null) {
      dataDateTime = DateTime.tryParse(dataString);
    }

    if (dataDateTime == null) {
      dataString = null;
    }

    return dataString;
  }
}
