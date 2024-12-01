import 'package:ditonton/domain/entities/tv_series_season.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series_season_model.freezed.dart';

part 'tv_series_season_model.g.dart';

@freezed
class TvSeriesSeasonModel extends Equatable with _$TvSeriesSeasonModel {
  const TvSeriesSeasonModel._();

  const factory TvSeriesSeasonModel({
    @JsonKey(name: 'air_date') required DateTime? airDate,
    @JsonKey(name: 'episode_count') required int? episodeCount,
    required int? id,
    required String? name,
    required String? overview,
    @JsonKey(name: 'poster_path') required String? posterPath,
    @JsonKey(name: 'season_number') required int? seasonNumber,
    @JsonKey(name: 'vote_average') required int? voteAverage,
  }) = _TvSeriesSeasonModel;

  factory TvSeriesSeasonModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeriesSeasonModelFromJson(json);

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

  TvSeriesSeason toEntity() {
    return TvSeriesSeason(
      airDate: airDate,
      episodeCount: episodeCount,
      id: id,
      name: name,
      overview: overview,
      posterPath: posterPath,
      seasonNumber: seasonNumber,
      voteAverage: voteAverage,
    );
  }
}
