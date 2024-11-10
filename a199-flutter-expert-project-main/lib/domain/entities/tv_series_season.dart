import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series_season.freezed.dart';

@unfreezed
class TvSeriesSeason extends Equatable with _$TvSeriesSeason {
  TvSeriesSeason._();

  factory TvSeriesSeason({
    required DateTime? airDate,
    required int? episodeCount,
    required int? id,
    required String? name,
    required String? overview,
    required String? posterPath,
    required int? seasonNumber,
    required int? voteAverage,
  }) = _TvSeriesSeason;

  @override
  List<Object?> get props {
    return [
      airDate,
      episodeCount,
      id,
      name,
      overview,
      posterPath,
      seasonNumber,
      voteAverage,
    ];
  }
}
