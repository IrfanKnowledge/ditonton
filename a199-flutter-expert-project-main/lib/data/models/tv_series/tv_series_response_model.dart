import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series_response_model.freezed.dart';
part 'tv_series_response_model.g.dart';

@freezed
class TvSeriesResponseModel with _$TvSeriesResponseModel {
  const factory TvSeriesResponseModel({
    int? page,
    List<TvSeriesModel>? results,
    @JsonKey(name: "total_pages") int? totalPages,
    @JsonKey(name: "total_results") int? totalResults,
  }) = _TvSeriesResponseModel;

  factory TvSeriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeriesResponseModelFromJson(json);
}
