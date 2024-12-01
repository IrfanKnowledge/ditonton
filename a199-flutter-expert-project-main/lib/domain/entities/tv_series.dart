import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series.freezed.dart';

@unfreezed
class TvSeries extends Equatable with _$TvSeries {
  TvSeries._();

  factory TvSeries({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    num? popularity,
    String? posterPath,
    DateTime? firstAirDate,
    String? name,
    num? voteAverage,
    int? voteCount,
    String? mediaType,
  }) = _TvSeries;

  factory TvSeries.required({
    required bool? adult,
    required String? backdropPath,
    required List<int>? genreIds,
    required int? id,
    required List<String>? originCountry,
    required String? originalLanguage,
    required String? originalName,
    required String? overview,
    required num? popularity,
    required String? posterPath,
    required DateTime? firstAirDate,
    required String? name,
    required num? voteAverage,
    required int? voteCount,
    required String? mediaType,
  }) {
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

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      genreIds,
      id,
      originCountry,
      originalLanguage,
      originalName,
      overview,
      popularity,
      posterPath,
      firstAirDate,
      name,
      voteAverage,
      voteAverage,
      mediaType,
    ];
  }
}
