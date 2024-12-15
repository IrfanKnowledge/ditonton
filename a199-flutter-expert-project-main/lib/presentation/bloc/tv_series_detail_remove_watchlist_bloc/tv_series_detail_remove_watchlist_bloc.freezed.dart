// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_series_detail_remove_watchlist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TvSeriesDetailRemoveWatchlistEvent {
  TvSeriesDetail get tvSeriesDetail => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TvSeriesDetail tvSeriesDetail) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TvSeriesDetail tvSeriesDetail)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TvSeriesDetail tvSeriesDetail)? started,
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

  /// Create a copy of TvSeriesDetailRemoveWatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvSeriesDetailRemoveWatchlistEventCopyWith<
          TvSeriesDetailRemoveWatchlistEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvSeriesDetailRemoveWatchlistEventCopyWith<$Res> {
  factory $TvSeriesDetailRemoveWatchlistEventCopyWith(
          TvSeriesDetailRemoveWatchlistEvent value,
          $Res Function(TvSeriesDetailRemoveWatchlistEvent) then) =
      _$TvSeriesDetailRemoveWatchlistEventCopyWithImpl<$Res,
          TvSeriesDetailRemoveWatchlistEvent>;
  @useResult
  $Res call({TvSeriesDetail tvSeriesDetail});

  $TvSeriesDetailCopyWith<$Res> get tvSeriesDetail;
}

/// @nodoc
class _$TvSeriesDetailRemoveWatchlistEventCopyWithImpl<$Res,
        $Val extends TvSeriesDetailRemoveWatchlistEvent>
    implements $TvSeriesDetailRemoveWatchlistEventCopyWith<$Res> {
  _$TvSeriesDetailRemoveWatchlistEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvSeriesDetailRemoveWatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tvSeriesDetail = null,
  }) {
    return _then(_value.copyWith(
      tvSeriesDetail: null == tvSeriesDetail
          ? _value.tvSeriesDetail
          : tvSeriesDetail // ignore: cast_nullable_to_non_nullable
              as TvSeriesDetail,
    ) as $Val);
  }

  /// Create a copy of TvSeriesDetailRemoveWatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TvSeriesDetailCopyWith<$Res> get tvSeriesDetail {
    return $TvSeriesDetailCopyWith<$Res>(_value.tvSeriesDetail, (value) {
      return _then(_value.copyWith(tvSeriesDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res>
    implements $TvSeriesDetailRemoveWatchlistEventCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TvSeriesDetail tvSeriesDetail});

  @override
  $TvSeriesDetailCopyWith<$Res> get tvSeriesDetail;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$TvSeriesDetailRemoveWatchlistEventCopyWithImpl<$Res,
        _$StartedImpl> implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TvSeriesDetailRemoveWatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tvSeriesDetail = null,
  }) {
    return _then(_$StartedImpl(
      null == tvSeriesDetail
          ? _value.tvSeriesDetail
          : tvSeriesDetail // ignore: cast_nullable_to_non_nullable
              as TvSeriesDetail,
    ));
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl(this.tvSeriesDetail);

  @override
  final TvSeriesDetail tvSeriesDetail;

  @override
  String toString() {
    return 'TvSeriesDetailRemoveWatchlistEvent.started(tvSeriesDetail: $tvSeriesDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.tvSeriesDetail, tvSeriesDetail) ||
                other.tvSeriesDetail == tvSeriesDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tvSeriesDetail);

  /// Create a copy of TvSeriesDetailRemoveWatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TvSeriesDetail tvSeriesDetail) started,
  }) {
    return started(tvSeriesDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TvSeriesDetail tvSeriesDetail)? started,
  }) {
    return started?.call(tvSeriesDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TvSeriesDetail tvSeriesDetail)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(tvSeriesDetail);
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

abstract class _Started implements TvSeriesDetailRemoveWatchlistEvent {
  const factory _Started(final TvSeriesDetail tvSeriesDetail) = _$StartedImpl;

  @override
  TvSeriesDetail get tvSeriesDetail;

  /// Create a copy of TvSeriesDetailRemoveWatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TvSeriesDetailRemoveWatchlistState {
  String get watchlistMessage => throw _privateConstructorUsedError;

  /// Create a copy of TvSeriesDetailRemoveWatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvSeriesDetailRemoveWatchlistStateCopyWith<
          TvSeriesDetailRemoveWatchlistState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvSeriesDetailRemoveWatchlistStateCopyWith<$Res> {
  factory $TvSeriesDetailRemoveWatchlistStateCopyWith(
          TvSeriesDetailRemoveWatchlistState value,
          $Res Function(TvSeriesDetailRemoveWatchlistState) then) =
      _$TvSeriesDetailRemoveWatchlistStateCopyWithImpl<$Res,
          TvSeriesDetailRemoveWatchlistState>;
  @useResult
  $Res call({String watchlistMessage});
}

/// @nodoc
class _$TvSeriesDetailRemoveWatchlistStateCopyWithImpl<$Res,
        $Val extends TvSeriesDetailRemoveWatchlistState>
    implements $TvSeriesDetailRemoveWatchlistStateCopyWith<$Res> {
  _$TvSeriesDetailRemoveWatchlistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvSeriesDetailRemoveWatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watchlistMessage = null,
  }) {
    return _then(_value.copyWith(
      watchlistMessage: null == watchlistMessage
          ? _value.watchlistMessage
          : watchlistMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvSeriesDetailRemoveWatchlistStateImplCopyWith<$Res>
    implements $TvSeriesDetailRemoveWatchlistStateCopyWith<$Res> {
  factory _$$TvSeriesDetailRemoveWatchlistStateImplCopyWith(
          _$TvSeriesDetailRemoveWatchlistStateImpl value,
          $Res Function(_$TvSeriesDetailRemoveWatchlistStateImpl) then) =
      __$$TvSeriesDetailRemoveWatchlistStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String watchlistMessage});
}

/// @nodoc
class __$$TvSeriesDetailRemoveWatchlistStateImplCopyWithImpl<$Res>
    extends _$TvSeriesDetailRemoveWatchlistStateCopyWithImpl<$Res,
        _$TvSeriesDetailRemoveWatchlistStateImpl>
    implements _$$TvSeriesDetailRemoveWatchlistStateImplCopyWith<$Res> {
  __$$TvSeriesDetailRemoveWatchlistStateImplCopyWithImpl(
      _$TvSeriesDetailRemoveWatchlistStateImpl _value,
      $Res Function(_$TvSeriesDetailRemoveWatchlistStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TvSeriesDetailRemoveWatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watchlistMessage = null,
  }) {
    return _then(_$TvSeriesDetailRemoveWatchlistStateImpl(
      watchlistMessage: null == watchlistMessage
          ? _value.watchlistMessage
          : watchlistMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TvSeriesDetailRemoveWatchlistStateImpl
    extends _TvSeriesDetailRemoveWatchlistState {
  const _$TvSeriesDetailRemoveWatchlistStateImpl({this.watchlistMessage = ''})
      : super._();

  @override
  @JsonKey()
  final String watchlistMessage;

  /// Create a copy of TvSeriesDetailRemoveWatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TvSeriesDetailRemoveWatchlistStateImplCopyWith<
          _$TvSeriesDetailRemoveWatchlistStateImpl>
      get copyWith => __$$TvSeriesDetailRemoveWatchlistStateImplCopyWithImpl<
          _$TvSeriesDetailRemoveWatchlistStateImpl>(this, _$identity);
}

abstract class _TvSeriesDetailRemoveWatchlistState
    extends TvSeriesDetailRemoveWatchlistState {
  const factory _TvSeriesDetailRemoveWatchlistState(
          {final String watchlistMessage}) =
      _$TvSeriesDetailRemoveWatchlistStateImpl;
  const _TvSeriesDetailRemoveWatchlistState._() : super._();

  @override
  String get watchlistMessage;

  /// Create a copy of TvSeriesDetailRemoveWatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TvSeriesDetailRemoveWatchlistStateImplCopyWith<
          _$TvSeriesDetailRemoveWatchlistStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
