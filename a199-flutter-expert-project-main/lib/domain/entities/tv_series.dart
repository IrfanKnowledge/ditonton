import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series.freezed.dart';

@unfreezed
class TvSeries extends Equatable with _$TvSeries {
  TvSeries._();

  factory TvSeries({
    final bool? adult,
    final String? backdropPath,
    final List<int>? genreIds,
    final int? id,
    final List<String>? originCountry,
    final String? originalLanguage,
    final String? originalName,
    final String? overview,
    final num? popularity,
    final String? posterPath,
    final DateTime? firstAirDate,
    final String? name,
    final num? voteAverage,
    final int? voteCount,
    final String? mediaType,
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

  factory TvSeries.watchlist({
    required int? id,
    required String? overview,
    required String? posterPath,
    required String? name,
  }) {
    return TvSeries(
      id: id,
      overview: overview,
      posterPath: posterPath,
      name: name,
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
