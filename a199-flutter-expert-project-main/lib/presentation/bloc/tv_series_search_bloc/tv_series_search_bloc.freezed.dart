// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_series_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TvSeriesSearchEvent {
  String get query => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) onQueryChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? onQueryChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? onQueryChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnQueryChanged value) onQueryChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnQueryChanged value)? onQueryChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnQueryChanged value)? onQueryChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of TvSeriesSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvSeriesSearchEventCopyWith<TvSeriesSearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvSeriesSearchEventCopyWith<$Res> {
  factory $TvSeriesSearchEventCopyWith(
          TvSeriesSearchEvent value, $Res Function(TvSeriesSearchEvent) then) =
      _$TvSeriesSearchEventCopyWithImpl<$Res, TvSeriesSearchEvent>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$TvSeriesSearchEventCopyWithImpl<$Res, $Val extends TvSeriesSearchEvent>
    implements $TvSeriesSearchEventCopyWith<$Res> {
  _$TvSeriesSearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvSeriesSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnQueryChangedImplCopyWith<$Res>
    implements $TvSeriesSearchEventCopyWith<$Res> {
  factory _$$OnQueryChangedImplCopyWith(_$OnQueryChangedImpl value,
          $Res Function(_$OnQueryChangedImpl) then) =
      __$$OnQueryChangedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$OnQueryChangedImplCopyWithImpl<$Res>
    extends _$TvSeriesSearchEventCopyWithImpl<$Res, _$OnQueryChangedImpl>
    implements _$$OnQueryChangedImplCopyWith<$Res> {
  __$$OnQueryChangedImplCopyWithImpl(
      _$OnQueryChangedImpl _value, $Res Function(_$OnQueryChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TvSeriesSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$OnQueryChangedImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnQueryChangedImpl implements _OnQueryChanged {
  const _$OnQueryChangedImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'TvSeriesSearchEvent.onQueryChanged(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnQueryChangedImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of TvSeriesSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnQueryChangedImplCopyWith<_$OnQueryChangedImpl> get copyWith =>
      __$$OnQueryChangedImplCopyWithImpl<_$OnQueryChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) onQueryChanged,
  }) {
    return onQueryChanged(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? onQueryChanged,
  }) {
    return onQueryChanged?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? onQueryChanged,
    required TResult orElse(),
  }) {
    if (onQueryChanged != null) {
      return onQueryChanged(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnQueryChanged value) onQueryChanged,
  }) {
    return onQueryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnQueryChanged value)? onQueryChanged,
  }) {
    return onQueryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnQueryChanged value)? onQueryChanged,
    required TResult orElse(),
  }) {
    if (onQueryChanged != null) {
      return onQueryChanged(this);
    }
    return orElse();
  }
}

abstract class _OnQueryChanged implements TvSeriesSearchEvent {
  const factory _OnQueryChanged(final String query) = _$OnQueryChangedImpl;

  @override
  String get query;

  /// Create a copy of TvSeriesSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnQueryChangedImplCopyWith<_$OnQueryChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
