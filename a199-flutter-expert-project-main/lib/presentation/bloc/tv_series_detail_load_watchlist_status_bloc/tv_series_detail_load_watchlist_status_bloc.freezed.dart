// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_series_detail_load_watchlist_status_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TvSeriesDetailLoadWatchlistStatusEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of TvSeriesDetailLoadWatchlistStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvSeriesDetailLoadWatchlistStatusEventCopyWith<
          TvSeriesDetailLoadWatchlistStatusEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvSeriesDetailLoadWatchlistStatusEventCopyWith<$Res> {
  factory $TvSeriesDetailLoadWatchlistStatusEventCopyWith(
          TvSeriesDetailLoadWatchlistStatusEvent value,
          $Res Function(TvSeriesDetailLoadWatchlistStatusEvent) then) =
      _$TvSeriesDetailLoadWatchlistStatusEventCopyWithImpl<$Res,
          TvSeriesDetailLoadWatchlistStatusEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$TvSeriesDetailLoadWatchlistStatusEventCopyWithImpl<$Res,
        $Val extends TvSeriesDetailLoadWatchlistStatusEvent>
    implements $TvSeriesDetailLoadWatchlistStatusEventCopyWith<$Res> {
  _$TvSeriesDetailLoadWatchlistStatusEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvSeriesDetailLoadWatchlistStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res>
    implements $TvSeriesDetailLoadWatchlistStatusEventCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$TvSeriesDetailLoadWatchlistStatusEventCopyWithImpl<$Res,
        _$StartedImpl> implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TvSeriesDetailLoadWatchlistStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$StartedImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TvSeriesDetailLoadWatchlistStatusEvent.started(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of TvSeriesDetailLoadWatchlistStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) started,
  }) {
    return started(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? started,
  }) {
    return started?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TvSeriesDetailLoadWatchlistStatusEvent {
  const factory _Started(final int id) = _$StartedImpl;

  @override
  int get id;

  /// Create a copy of TvSeriesDetailLoadWatchlistStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TvSeriesDetailLoadWatchlistStatusState {
  bool get isAddedToWatchList => throw _privateConstructorUsedError;

  /// Create a copy of TvSeriesDetailLoadWatchlistStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvSeriesDetailLoadWatchlistStatusStateCopyWith<
          TvSeriesDetailLoadWatchlistStatusState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvSeriesDetailLoadWatchlistStatusStateCopyWith<$Res> {
  factory $TvSeriesDetailLoadWatchlistStatusStateCopyWith(
          TvSeriesDetailLoadWatchlistStatusState value,
          $Res Function(TvSeriesDetailLoadWatchlistStatusState) then) =
      _$TvSeriesDetailLoadWatchlistStatusStateCopyWithImpl<$Res,
          TvSeriesDetailLoadWatchlistStatusState>;
  @useResult
  $Res call({bool isAddedToWatchList});
}

/// @nodoc
class _$TvSeriesDetailLoadWatchlistStatusStateCopyWithImpl<$Res,
        $Val extends TvSeriesDetailLoadWatchlistStatusState>
    implements $TvSeriesDetailLoadWatchlistStatusStateCopyWith<$Res> {
  _$TvSeriesDetailLoadWatchlistStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvSeriesDetailLoadWatchlistStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAddedToWatchList = null,
  }) {
    return _then(_value.copyWith(
      isAddedToWatchList: null == isAddedToWatchList
          ? _value.isAddedToWatchList
          : isAddedToWatchList // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvSeriesDetailLoadWatchlistStatusStateImplCopyWith<$Res>
    implements $TvSeriesDetailLoadWatchlistStatusStateCopyWith<$Res> {
  factory _$$TvSeriesDetailLoadWatchlistStatusStateImplCopyWith(
          _$TvSeriesDetailLoadWatchlistStatusStateImpl value,
          $Res Function(_$TvSeriesDetailLoadWatchlistStatusStateImpl) then) =
      __$$TvSeriesDetailLoadWatchlistStatusStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAddedToWatchList});
}

/// @nodoc
class __$$TvSeriesDetailLoadWatchlistStatusStateImplCopyWithImpl<$Res>
    extends _$TvSeriesDetailLoadWatchlistStatusStateCopyWithImpl<$Res,
        _$TvSeriesDetailLoadWatchlistStatusStateImpl>
    implements _$$TvSeriesDetailLoadWatchlistStatusStateImplCopyWith<$Res> {
  __$$TvSeriesDetailLoadWatchlistStatusStateImplCopyWithImpl(
      _$TvSeriesDetailLoadWatchlistStatusStateImpl _value,
      $Res Function(_$TvSeriesDetailLoadWatchlistStatusStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TvSeriesDetailLoadWatchlistStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAddedToWatchList = null,
  }) {
    return _then(_$TvSeriesDetailLoadWatchlistStatusStateImpl(
      isAddedToWatchList: null == isAddedToWatchList
          ? _value.isAddedToWatchList
          : isAddedToWatchList // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TvSeriesDetailLoadWatchlistStatusStateImpl
    extends _TvSeriesDetailLoadWatchlistStatusState {
  const _$TvSeriesDetailLoadWatchlistStatusStateImpl(
      {this.isAddedToWatchList = false})
      : super._();

  @override
  @JsonKey()
  final bool isAddedToWatchList;

  /// Create a copy of TvSeriesDetailLoadWatchlistStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TvSeriesDetailLoadWatchlistStatusStateImplCopyWith<
          _$TvSeriesDetailLoadWatchlistStatusStateImpl>
      get copyWith =>
          __$$TvSeriesDetailLoadWatchlistStatusStateImplCopyWithImpl<
              _$TvSeriesDetailLoadWatchlistStatusStateImpl>(this, _$identity);
}

abstract class _TvSeriesDetailLoadWatchlistStatusState
    extends TvSeriesDetailLoadWatchlistStatusState {
  const factory _TvSeriesDetailLoadWatchlistStatusState(
          {final bool isAddedToWatchList}) =
      _$TvSeriesDetailLoadWatchlistStatusStateImpl;
  const _TvSeriesDetailLoadWatchlistStatusState._() : super._();

  @override
  bool get isAddedToWatchList;

  /// Create a copy of TvSeriesDetailLoadWatchlistStatusState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TvSeriesDetailLoadWatchlistStatusStateImplCopyWith<
          _$TvSeriesDetailLoadWatchlistStatusStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
