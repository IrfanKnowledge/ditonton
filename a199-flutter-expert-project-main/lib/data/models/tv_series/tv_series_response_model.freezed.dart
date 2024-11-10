// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_series_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TvSeriesResponseModel _$TvSeriesResponseModelFromJson(
    Map<String, dynamic> json) {
  return _TvSeriesResponseModel.fromJson(json);
}

/// @nodoc
mixin _$TvSeriesResponseModel {
  int? get page => throw _privateConstructorUsedError;
  List<TvSeriesModel>? get results => throw _privateConstructorUsedError;
  @JsonKey(name: "total_pages")
  int? get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: "total_results")
  int? get totalResults => throw _privateConstructorUsedError;

  /// Serializes this TvSeriesResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TvSeriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvSeriesResponseModelCopyWith<TvSeriesResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvSeriesResponseModelCopyWith<$Res> {
  factory $TvSeriesResponseModelCopyWith(TvSeriesResponseModel value,
          $Res Function(TvSeriesResponseModel) then) =
      _$TvSeriesResponseModelCopyWithImpl<$Res, TvSeriesResponseModel>;
  @useResult
  $Res call(
      {int? page,
      List<TvSeriesModel>? results,
      @JsonKey(name: "total_pages") int? totalPages,
      @JsonKey(name: "total_results") int? totalResults});
}

/// @nodoc
class _$TvSeriesResponseModelCopyWithImpl<$Res,
        $Val extends TvSeriesResponseModel>
    implements $TvSeriesResponseModelCopyWith<$Res> {
  _$TvSeriesResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvSeriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TvSeriesModel>?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvSeriesResponseModelImplCopyWith<$Res>
    implements $TvSeriesResponseModelCopyWith<$Res> {
  factory _$$TvSeriesResponseModelImplCopyWith(
          _$TvSeriesResponseModelImpl value,
          $Res Function(_$TvSeriesResponseModelImpl) then) =
      __$$TvSeriesResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? page,
      List<TvSeriesModel>? results,
      @JsonKey(name: "total_pages") int? totalPages,
      @JsonKey(name: "total_results") int? totalResults});
}

/// @nodoc
class __$$TvSeriesResponseModelImplCopyWithImpl<$Res>
    extends _$TvSeriesResponseModelCopyWithImpl<$Res,
        _$TvSeriesResponseModelImpl>
    implements _$$TvSeriesResponseModelImplCopyWith<$Res> {
  __$$TvSeriesResponseModelImplCopyWithImpl(_$TvSeriesResponseModelImpl _value,
      $Res Function(_$TvSeriesResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TvSeriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_$TvSeriesResponseModelImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TvSeriesModel>?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TvSeriesResponseModelImpl implements _TvSeriesResponseModel {
  const _$TvSeriesResponseModelImpl(
      {this.page,
      final List<TvSeriesModel>? results,
      @JsonKey(name: "total_pages") this.totalPages,
      @JsonKey(name: "total_results") this.totalResults})
      : _results = results;

  factory _$TvSeriesResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvSeriesResponseModelImplFromJson(json);

  @override
  final int? page;
  final List<TvSeriesModel>? _results;
  @override
  List<TvSeriesModel>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @override
  @JsonKey(name: "total_results")
  final int? totalResults;

  @override
  String toString() {
    return 'TvSeriesResponseModel(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvSeriesResponseModelImpl &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page,
      const DeepCollectionEquality().hash(_results), totalPages, totalResults);

  /// Create a copy of TvSeriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TvSeriesResponseModelImplCopyWith<_$TvSeriesResponseModelImpl>
      get copyWith => __$$TvSeriesResponseModelImplCopyWithImpl<
          _$TvSeriesResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvSeriesResponseModelImplToJson(
      this,
    );
  }
}

abstract class _TvSeriesResponseModel implements TvSeriesResponseModel {
  const factory _TvSeriesResponseModel(
          {final int? page,
          final List<TvSeriesModel>? results,
          @JsonKey(name: "total_pages") final int? totalPages,
          @JsonKey(name: "total_results") final int? totalResults}) =
      _$TvSeriesResponseModelImpl;

  factory _TvSeriesResponseModel.fromJson(Map<String, dynamic> json) =
      _$TvSeriesResponseModelImpl.fromJson;

  @override
  int? get page;
  @override
  List<TvSeriesModel>? get results;
  @override
  @JsonKey(name: "total_pages")
  int? get totalPages;
  @override
  @JsonKey(name: "total_results")
  int? get totalResults;

  /// Create a copy of TvSeriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TvSeriesResponseModelImplCopyWith<_$TvSeriesResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
