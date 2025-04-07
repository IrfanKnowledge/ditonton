import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series_season.freezed.dart';

@unfreezed
class TvSeriesSeason extends Equatable with _$TvSeriesSeason {
  TvSeriesSeason._();

  factory TvSeriesSeason({
    required final DateTime? airDate,
    required final int? episodeCount,
    required final int? id,
    required final String? name,
    required final String? overview,
    required final String? posterPath,
    required final int? seasonNumber,
    required final int? voteAverage,
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
