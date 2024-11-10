// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TvSeriesResponseModelImpl _$$TvSeriesResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TvSeriesResponseModelImpl(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => TvSeriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TvSeriesResponseModelImplToJson(
        _$TvSeriesResponseModelImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
