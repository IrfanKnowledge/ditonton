// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TvSeriesModelImpl _$$TvSeriesModelImplFromJson(Map<String, dynamic> json) =>
    _$TvSeriesModelImpl(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      id: (json['id'] as num?)?.toInt(),
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalLanguage: json['original_language'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      popularity: json['popularity'] as num?,
      posterPath: json['poster_path'] as String?,
      firstAirDate:
          TvSeriesModelHelper.firstAirDateReadValue(json, 'first_air_date') ==
                  null
              ? null
              : DateTime.parse(TvSeriesModelHelper.firstAirDateReadValue(
                  json, 'first_air_date') as String),
      name: json['name'] as String?,
      voteAverage: json['vote_average'] as num?,
      voteCount: (json['vote_count'] as num?)?.toInt(),
      mediaType: json['media_type'] as String?,
    );

Map<String, dynamic> _$$TvSeriesModelImplToJson(_$TvSeriesModelImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'first_air_date': instance.firstAirDate?.toIso8601String(),
      'name': instance.name,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'media_type': instance.mediaType,
    };
