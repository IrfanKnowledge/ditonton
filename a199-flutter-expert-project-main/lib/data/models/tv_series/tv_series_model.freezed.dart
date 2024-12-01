// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_series_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TvSeriesModel _$TvSeriesModelFromJson(Map<String, dynamic> json) {
  return _TvSeriesModel.fromJson(json);
}

/// @nodoc
mixin _$TvSeriesModel {
  bool? get adult => throw _privateConstructorUsedError;
  @JsonKey(name: "backdrop_path")
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: "genre_ids")
  List<int>? get genreIds => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "origin_country")
  List<String>? get originCountry => throw _privateConstructorUsedError;
  @JsonKey(name: "original_language")
  String? get originalLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: "original_name")
  String? get originalName => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  num? get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: "poster_path")
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: "first_air_date")
  DateTime? get firstAirDate => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "vote_average")
  num? get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: "vote_count")
  int? get voteCount => throw _privateConstructorUsedError;
  @JsonKey(name: "media_type")
  String? get mediaType => throw _privateConstructorUsedError;

  /// Serializes this TvSeriesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TvSeriesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvSeriesModelCopyWith<TvSeriesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvSeriesModelCopyWith<$Res> {
  factory $TvSeriesModelCopyWith(
          TvSeriesModel value, $Res Function(TvSeriesModel) then) =
      _$TvSeriesModelCopyWithImpl<$Res, TvSeriesModel>;
  @useResult
  $Res call(
      {bool? adult,
      @JsonKey(name: "backdrop_path") String? backdropPath,
      @JsonKey(name: "genre_ids") List<int>? genreIds,
      int? id,
      @JsonKey(name: "origin_country") List<String>? originCountry,
      @JsonKey(name: "original_language") String? originalLanguage,
      @JsonKey(name: "original_name") String? originalName,
      String? overview,
      num? popularity,
      @JsonKey(name: "poster_path") String? posterPath,
      @JsonKey(name: "first_air_date") DateTime? firstAirDate,
      String? name,
      @JsonKey(name: "vote_average") num? voteAverage,
      @JsonKey(name: "vote_count") int? voteCount,
      @JsonKey(name: "media_type") String? mediaType});
}

/// @nodoc
class _$TvSeriesModelCopyWithImpl<$Res, $Val extends TvSeriesModel>
    implements $TvSeriesModelCopyWith<$Res> {
  _$TvSeriesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvSeriesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = freezed,
    Object? backdropPath = freezed,
    Object? genreIds = freezed,
    Object? id = freezed,
    Object? originCountry = freezed,
    Object? originalLanguage = freezed,
    Object? originalName = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? firstAirDate = freezed,
    Object? name = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? mediaType = freezed,
  }) {
    return _then(_value.copyWith(
      adult: freezed == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: freezed == genreIds
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      originCountry: freezed == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      originalLanguage: freezed == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as num?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as num?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvSeriesModelImplCopyWith<$Res>
    implements $TvSeriesModelCopyWith<$Res> {
  factory _$$TvSeriesModelImplCopyWith(
          _$TvSeriesModelImpl value, $Res Function(_$TvSeriesModelImpl) then) =
      __$$TvSeriesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? adult,
      @JsonKey(name: "backdrop_path") String? backdropPath,
      @JsonKey(name: "genre_ids") List<int>? genreIds,
      int? id,
      @JsonKey(name: "origin_country") List<String>? originCountry,
      @JsonKey(name: "original_language") String? originalLanguage,
      @JsonKey(name: "original_name") String? originalName,
      String? overview,
      num? popularity,
      @JsonKey(name: "poster_path") String? posterPath,
      @JsonKey(name: "first_air_date") DateTime? firstAirDate,
      String? name,
      @JsonKey(name: "vote_average") num? voteAverage,
      @JsonKey(name: "vote_count") int? voteCount,
      @JsonKey(name: "media_type") String? mediaType});
}

/// @nodoc
class __$$TvSeriesModelImplCopyWithImpl<$Res>
    extends _$TvSeriesModelCopyWithImpl<$Res, _$TvSeriesModelImpl>
    implements _$$TvSeriesModelImplCopyWith<$Res> {
  __$$TvSeriesModelImplCopyWithImpl(
      _$TvSeriesModelImpl _value, $Res Function(_$TvSeriesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TvSeriesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = freezed,
    Object? backdropPath = freezed,
    Object? genreIds = freezed,
    Object? id = freezed,
    Object? originCountry = freezed,
    Object? originalLanguage = freezed,
    Object? originalName = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? firstAirDate = freezed,
    Object? name = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? mediaType = freezed,
  }) {
    return _then(_$TvSeriesModelImpl(
      adult: freezed == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: freezed == genreIds
          ? _value._genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      originCountry: freezed == originCountry
          ? _value._originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      originalLanguage: freezed == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as num?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as num?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TvSeriesModelImpl extends _TvSeriesModel {
  const _$TvSeriesModelImpl(
      {required this.adult,
      @JsonKey(name: "backdrop_path") required this.backdropPath,
      @JsonKey(name: "genre_ids") required final List<int>? genreIds,
      required this.id,
      @JsonKey(name: "origin_country")
      required final List<String>? originCountry,
      @JsonKey(name: "original_language") required this.originalLanguage,
      @JsonKey(name: "original_name") required this.originalName,
      required this.overview,
      required this.popularity,
      @JsonKey(name: "poster_path") required this.posterPath,
      @JsonKey(name: "first_air_date") required this.firstAirDate,
      required this.name,
      @JsonKey(name: "vote_average") required this.voteAverage,
      @JsonKey(name: "vote_count") required this.voteCount,
      @JsonKey(name: "media_type") required this.mediaType})
      : _genreIds = genreIds,
        _originCountry = originCountry,
        super._();

  factory _$TvSeriesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvSeriesModelImplFromJson(json);

  @override
  final bool? adult;
  @override
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  final List<int>? _genreIds;
  @override
  @JsonKey(name: "genre_ids")
  List<int>? get genreIds {
    final value = _genreIds;
    if (value == null) return null;
    if (_genreIds is EqualUnmodifiableListView) return _genreIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? id;
  final List<String>? _originCountry;
  @override
  @JsonKey(name: "origin_country")
  List<String>? get originCountry {
    final value = _originCountry;
    if (value == null) return null;
    if (_originCountry is EqualUnmodifiableListView) return _originCountry;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @override
  @JsonKey(name: "original_name")
  final String? originalName;
  @override
  final String? overview;
  @override
  final num? popularity;
  @override
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @override
  @JsonKey(name: "first_air_date")
  final DateTime? firstAirDate;
  @override
  final String? name;
  @override
  @JsonKey(name: "vote_average")
  final num? voteAverage;
  @override
  @JsonKey(name: "vote_count")
  final int? voteCount;
  @override
  @JsonKey(name: "media_type")
  final String? mediaType;

  @override
  String toString() {
    return 'TvSeriesModel(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originCountry: $originCountry, originalLanguage: $originalLanguage, originalName: $originalName, overview: $overview, popularity: $popularity, posterPath: $posterPath, firstAirDate: $firstAirDate, name: $name, voteAverage: $voteAverage, voteCount: $voteCount, mediaType: $mediaType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvSeriesModelImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            const DeepCollectionEquality().equals(other._genreIds, _genreIds) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._originCountry, _originCountry) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.firstAirDate, firstAirDate) ||
                other.firstAirDate == firstAirDate) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      adult,
      backdropPath,
      const DeepCollectionEquality().hash(_genreIds),
      id,
      const DeepCollectionEquality().hash(_originCountry),
      originalLanguage,
      originalName,
      overview,
      popularity,
      posterPath,
      firstAirDate,
      name,
      voteAverage,
      voteCount,
      mediaType);

  /// Create a copy of TvSeriesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TvSeriesModelImplCopyWith<_$TvSeriesModelImpl> get copyWith =>
      __$$TvSeriesModelImplCopyWithImpl<_$TvSeriesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvSeriesModelImplToJson(
      this,
    );
  }
}

abstract class _TvSeriesModel extends TvSeriesModel {
  const factory _TvSeriesModel(
      {required final bool? adult,
      @JsonKey(name: "backdrop_path") required final String? backdropPath,
      @JsonKey(name: "genre_ids") required final List<int>? genreIds,
      required final int? id,
      @JsonKey(name: "origin_country")
      required final List<String>? originCountry,
      @JsonKey(name: "original_language")
      required final String? originalLanguage,
      @JsonKey(name: "original_name") required final String? originalName,
      required final String? overview,
      required final num? popularity,
      @JsonKey(name: "poster_path") required final String? posterPath,
      @JsonKey(name: "first_air_date") required final DateTime? firstAirDate,
      required final String? name,
      @JsonKey(name: "vote_average") required final num? voteAverage,
      @JsonKey(name: "vote_count") required final int? voteCount,
      @JsonKey(name: "media_type")
      required final String? mediaType}) = _$TvSeriesModelImpl;
  const _TvSeriesModel._() : super._();

  factory _TvSeriesModel.fromJson(Map<String, dynamic> json) =
      _$TvSeriesModelImpl.fromJson;

  @override
  bool? get adult;
  @override
  @JsonKey(name: "backdrop_path")
  String? get backdropPath;
  @override
  @JsonKey(name: "genre_ids")
  List<int>? get genreIds;
  @override
  int? get id;
  @override
  @JsonKey(name: "origin_country")
  List<String>? get originCountry;
  @override
  @JsonKey(name: "original_language")
  String? get originalLanguage;
  @override
  @JsonKey(name: "original_name")
  String? get originalName;
  @override
  String? get overview;
  @override
  num? get popularity;
  @override
  @JsonKey(name: "poster_path")
  String? get posterPath;
  @override
  @JsonKey(name: "first_air_date")
  DateTime? get firstAirDate;
  @override
  String? get name;
  @override
  @JsonKey(name: "vote_average")
  num? get voteAverage;
  @override
  @JsonKey(name: "vote_count")
  int? get voteCount;
  @override
  @JsonKey(name: "media_type")
  String? get mediaType;

  /// Create a copy of TvSeriesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TvSeriesModelImplCopyWith<_$TvSeriesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
