// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_series_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TvSeriesDetailModel _$TvSeriesDetailModelFromJson(Map<String, dynamic> json) {
  return _TvSeriesDetailModel.fromJson(json);
}

/// @nodoc
mixin _$TvSeriesDetailModel {
  bool? get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_air_date')
  DateTime? get firstAirDate => throw _privateConstructorUsedError;
  List<GenreModel>? get genres => throw _privateConstructorUsedError;
  String? get homepage => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_production')
  bool? get inProduction => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_air_date')
  DateTime? get lastAirDate => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_episodes')
  int? get numberOfEpisodes => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_seasons')
  int? get numberOfSeasons => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String? get originalLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String? get originalName => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  double? get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  List<TvSeriesSeasonModel>? get seasons => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get tagline => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  int? get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int? get voteCount => throw _privateConstructorUsedError;

  /// Serializes this TvSeriesDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TvSeriesDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvSeriesDetailModelCopyWith<TvSeriesDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvSeriesDetailModelCopyWith<$Res> {
  factory $TvSeriesDetailModelCopyWith(
          TvSeriesDetailModel value, $Res Function(TvSeriesDetailModel) then) =
      _$TvSeriesDetailModelCopyWithImpl<$Res, TvSeriesDetailModel>;
  @useResult
  $Res call(
      {bool? adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'first_air_date') DateTime? firstAirDate,
      List<GenreModel>? genres,
      String? homepage,
      int? id,
      @JsonKey(name: 'in_production') bool? inProduction,
      @JsonKey(name: 'last_air_date') DateTime? lastAirDate,
      String? name,
      @JsonKey(name: 'number_of_episodes') int? numberOfEpisodes,
      @JsonKey(name: 'number_of_seasons') int? numberOfSeasons,
      @JsonKey(name: 'original_language') String? originalLanguage,
      @JsonKey(name: 'original_name') String? originalName,
      String? overview,
      double? popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      List<TvSeriesSeasonModel>? seasons,
      String? status,
      String? tagline,
      String? type,
      @JsonKey(name: 'vote_average') int? voteAverage,
      @JsonKey(name: 'vote_count') int? voteCount});
}

/// @nodoc
class _$TvSeriesDetailModelCopyWithImpl<$Res, $Val extends TvSeriesDetailModel>
    implements $TvSeriesDetailModelCopyWith<$Res> {
  _$TvSeriesDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvSeriesDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = freezed,
    Object? backdropPath = freezed,
    Object? firstAirDate = freezed,
    Object? genres = freezed,
    Object? homepage = freezed,
    Object? id = freezed,
    Object? inProduction = freezed,
    Object? lastAirDate = freezed,
    Object? name = freezed,
    Object? numberOfEpisodes = freezed,
    Object? numberOfSeasons = freezed,
    Object? originalLanguage = freezed,
    Object? originalName = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? seasons = freezed,
    Object? status = freezed,
    Object? tagline = freezed,
    Object? type = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
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
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<GenreModel>?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      inProduction: freezed == inProduction
          ? _value.inProduction
          : inProduction // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastAirDate: freezed == lastAirDate
          ? _value.lastAirDate
          : lastAirDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfEpisodes: freezed == numberOfEpisodes
          ? _value.numberOfEpisodes
          : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfSeasons: freezed == numberOfSeasons
          ? _value.numberOfSeasons
          : numberOfSeasons // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as double?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      seasons: freezed == seasons
          ? _value.seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<TvSeriesSeasonModel>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as int?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvSeriesDetailModelImplCopyWith<$Res>
    implements $TvSeriesDetailModelCopyWith<$Res> {
  factory _$$TvSeriesDetailModelImplCopyWith(_$TvSeriesDetailModelImpl value,
          $Res Function(_$TvSeriesDetailModelImpl) then) =
      __$$TvSeriesDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'first_air_date') DateTime? firstAirDate,
      List<GenreModel>? genres,
      String? homepage,
      int? id,
      @JsonKey(name: 'in_production') bool? inProduction,
      @JsonKey(name: 'last_air_date') DateTime? lastAirDate,
      String? name,
      @JsonKey(name: 'number_of_episodes') int? numberOfEpisodes,
      @JsonKey(name: 'number_of_seasons') int? numberOfSeasons,
      @JsonKey(name: 'original_language') String? originalLanguage,
      @JsonKey(name: 'original_name') String? originalName,
      String? overview,
      double? popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      List<TvSeriesSeasonModel>? seasons,
      String? status,
      String? tagline,
      String? type,
      @JsonKey(name: 'vote_average') int? voteAverage,
      @JsonKey(name: 'vote_count') int? voteCount});
}

/// @nodoc
class __$$TvSeriesDetailModelImplCopyWithImpl<$Res>
    extends _$TvSeriesDetailModelCopyWithImpl<$Res, _$TvSeriesDetailModelImpl>
    implements _$$TvSeriesDetailModelImplCopyWith<$Res> {
  __$$TvSeriesDetailModelImplCopyWithImpl(_$TvSeriesDetailModelImpl _value,
      $Res Function(_$TvSeriesDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TvSeriesDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = freezed,
    Object? backdropPath = freezed,
    Object? firstAirDate = freezed,
    Object? genres = freezed,
    Object? homepage = freezed,
    Object? id = freezed,
    Object? inProduction = freezed,
    Object? lastAirDate = freezed,
    Object? name = freezed,
    Object? numberOfEpisodes = freezed,
    Object? numberOfSeasons = freezed,
    Object? originalLanguage = freezed,
    Object? originalName = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? seasons = freezed,
    Object? status = freezed,
    Object? tagline = freezed,
    Object? type = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
  }) {
    return _then(_$TvSeriesDetailModelImpl(
      adult: freezed == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<GenreModel>?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      inProduction: freezed == inProduction
          ? _value.inProduction
          : inProduction // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastAirDate: freezed == lastAirDate
          ? _value.lastAirDate
          : lastAirDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfEpisodes: freezed == numberOfEpisodes
          ? _value.numberOfEpisodes
          : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfSeasons: freezed == numberOfSeasons
          ? _value.numberOfSeasons
          : numberOfSeasons // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as double?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      seasons: freezed == seasons
          ? _value._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<TvSeriesSeasonModel>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as int?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TvSeriesDetailModelImpl extends _TvSeriesDetailModel {
  const _$TvSeriesDetailModelImpl(
      {required this.adult,
      @JsonKey(name: 'backdrop_path') required this.backdropPath,
      @JsonKey(name: 'first_air_date') required this.firstAirDate,
      required final List<GenreModel>? genres,
      required this.homepage,
      required this.id,
      @JsonKey(name: 'in_production') required this.inProduction,
      @JsonKey(name: 'last_air_date') required this.lastAirDate,
      required this.name,
      @JsonKey(name: 'number_of_episodes') required this.numberOfEpisodes,
      @JsonKey(name: 'number_of_seasons') required this.numberOfSeasons,
      @JsonKey(name: 'original_language') required this.originalLanguage,
      @JsonKey(name: 'original_name') required this.originalName,
      required this.overview,
      required this.popularity,
      @JsonKey(name: 'poster_path') required this.posterPath,
      required final List<TvSeriesSeasonModel>? seasons,
      required this.status,
      required this.tagline,
      required this.type,
      @JsonKey(name: 'vote_average') required this.voteAverage,
      @JsonKey(name: 'vote_count') required this.voteCount})
      : _genres = genres,
        _seasons = seasons,
        super._();

  factory _$TvSeriesDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvSeriesDetailModelImplFromJson(json);

  @override
  final bool? adult;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  @JsonKey(name: 'first_air_date')
  final DateTime? firstAirDate;
  final List<GenreModel>? _genres;
  @override
  List<GenreModel>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? homepage;
  @override
  final int? id;
  @override
  @JsonKey(name: 'in_production')
  final bool? inProduction;
  @override
  @JsonKey(name: 'last_air_date')
  final DateTime? lastAirDate;
  @override
  final String? name;
  @override
  @JsonKey(name: 'number_of_episodes')
  final int? numberOfEpisodes;
  @override
  @JsonKey(name: 'number_of_seasons')
  final int? numberOfSeasons;
  @override
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @override
  @JsonKey(name: 'original_name')
  final String? originalName;
  @override
  final String? overview;
  @override
  final double? popularity;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  final List<TvSeriesSeasonModel>? _seasons;
  @override
  List<TvSeriesSeasonModel>? get seasons {
    final value = _seasons;
    if (value == null) return null;
    if (_seasons is EqualUnmodifiableListView) return _seasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;
  @override
  final String? tagline;
  @override
  final String? type;
  @override
  @JsonKey(name: 'vote_average')
  final int? voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  /// Create a copy of TvSeriesDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TvSeriesDetailModelImplCopyWith<_$TvSeriesDetailModelImpl> get copyWith =>
      __$$TvSeriesDetailModelImplCopyWithImpl<_$TvSeriesDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvSeriesDetailModelImplToJson(
      this,
    );
  }
}

abstract class _TvSeriesDetailModel extends TvSeriesDetailModel {
  const factory _TvSeriesDetailModel(
      {required final bool? adult,
      @JsonKey(name: 'backdrop_path') required final String? backdropPath,
      @JsonKey(name: 'first_air_date') required final DateTime? firstAirDate,
      required final List<GenreModel>? genres,
      required final String? homepage,
      required final int? id,
      @JsonKey(name: 'in_production') required final bool? inProduction,
      @JsonKey(name: 'last_air_date') required final DateTime? lastAirDate,
      required final String? name,
      @JsonKey(name: 'number_of_episodes') required final int? numberOfEpisodes,
      @JsonKey(name: 'number_of_seasons') required final int? numberOfSeasons,
      @JsonKey(name: 'original_language')
      required final String? originalLanguage,
      @JsonKey(name: 'original_name') required final String? originalName,
      required final String? overview,
      required final double? popularity,
      @JsonKey(name: 'poster_path') required final String? posterPath,
      required final List<TvSeriesSeasonModel>? seasons,
      required final String? status,
      required final String? tagline,
      required final String? type,
      @JsonKey(name: 'vote_average') required final int? voteAverage,
      @JsonKey(name: 'vote_count')
      required final int? voteCount}) = _$TvSeriesDetailModelImpl;
  const _TvSeriesDetailModel._() : super._();

  factory _TvSeriesDetailModel.fromJson(Map<String, dynamic> json) =
      _$TvSeriesDetailModelImpl.fromJson;

  @override
  bool? get adult;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'first_air_date')
  DateTime? get firstAirDate;
  @override
  List<GenreModel>? get genres;
  @override
  String? get homepage;
  @override
  int? get id;
  @override
  @JsonKey(name: 'in_production')
  bool? get inProduction;
  @override
  @JsonKey(name: 'last_air_date')
  DateTime? get lastAirDate;
  @override
  String? get name;
  @override
  @JsonKey(name: 'number_of_episodes')
  int? get numberOfEpisodes;
  @override
  @JsonKey(name: 'number_of_seasons')
  int? get numberOfSeasons;
  @override
  @JsonKey(name: 'original_language')
  String? get originalLanguage;
  @override
  @JsonKey(name: 'original_name')
  String? get originalName;
  @override
  String? get overview;
  @override
  double? get popularity;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  List<TvSeriesSeasonModel>? get seasons;
  @override
  String? get status;
  @override
  String? get tagline;
  @override
  String? get type;
  @override
  @JsonKey(name: 'vote_average')
  int? get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int? get voteCount;

  /// Create a copy of TvSeriesDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TvSeriesDetailModelImplCopyWith<_$TvSeriesDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
