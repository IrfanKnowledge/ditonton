import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series.freezed.dart';

@unfreezed
class TvSeries extends Equatable with _$TvSeries {
  TvSeries._();

  factory TvSeries({
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
  }) = _TvSeries;

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
    ];
  }
}
