// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_detail_add_watchlist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MoviesDetailAddWatchlistEvent {
  MovieDetail get movieDetail => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MovieDetail movieDetail) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MovieDetail movieDetail)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MovieDetail movieDetail)? started,
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

  /// Create a copy of MoviesDetailAddWatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoviesDetailAddWatchlistEventCopyWith<MoviesDetailAddWatchlistEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesDetailAddWatchlistEventCopyWith<$Res> {
  factory $MoviesDetailAddWatchlistEventCopyWith(
          MoviesDetailAddWatchlistEvent value,
          $Res Function(MoviesDetailAddWatchlistEvent) then) =
      _$MoviesDetailAddWatchlistEventCopyWithImpl<$Res,
          MoviesDetailAddWatchlistEvent>;
  @useResult
  $Res call({MovieDetail movieDetail});
}

/// @nodoc
class _$MoviesDetailAddWatchlistEventCopyWithImpl<$Res,
        $Val extends MoviesDetailAddWatchlistEvent>
    implements $MoviesDetailAddWatchlistEventCopyWith<$Res> {
  _$MoviesDetailAddWatchlistEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoviesDetailAddWatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieDetail = null,
  }) {
    return _then(_value.copyWith(
      movieDetail: null == movieDetail
          ? _value.movieDetail
          : movieDetail // ignore: cast_nullable_to_non_nullable
              as MovieDetail,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res>
    implements $MoviesDetailAddWatchlistEventCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MovieDetail movieDetail});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$MoviesDetailAddWatchlistEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoviesDetailAddWatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieDetail = null,
  }) {
    return _then(_$StartedImpl(
      null == movieDetail
          ? _value.movieDetail
          : movieDetail // ignore: cast_nullable_to_non_nullable
              as MovieDetail,
    ));
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl(this.movieDetail);

  @override
  final MovieDetail movieDetail;

  @override
  String toString() {
    return 'MoviesDetailAddWatchlistEvent.started(movieDetail: $movieDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.movieDetail, movieDetail) ||
                other.movieDetail == movieDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movieDetail);

  /// Create a copy of MoviesDetailAddWatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MovieDetail movieDetail) started,
  }) {
    return started(movieDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MovieDetail movieDetail)? started,
  }) {
    return started?.call(movieDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MovieDetail movieDetail)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(movieDetail);
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

abstract class _Started implements MoviesDetailAddWatchlistEvent {
  const factory _Started(final MovieDetail movieDetail) = _$StartedImpl;

  @override
  MovieDetail get movieDetail;

  /// Create a copy of MoviesDetailAddWatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MoviesDetailAddWatchlistState {
  String get watchlistMessage => throw _privateConstructorUsedError;

  /// Create a copy of MoviesDetailAddWatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoviesDetailAddWatchlistStateCopyWith<MoviesDetailAddWatchlistState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesDetailAddWatchlistStateCopyWith<$Res> {
  factory $MoviesDetailAddWatchlistStateCopyWith(
          MoviesDetailAddWatchlistState value,
          $Res Function(MoviesDetailAddWatchlistState) then) =
      _$MoviesDetailAddWatchlistStateCopyWithImpl<$Res,
          MoviesDetailAddWatchlistState>;
  @useResult
  $Res call({String watchlistMessage});
}

/// @nodoc
class _$MoviesDetailAddWatchlistStateCopyWithImpl<$Res,
        $Val extends MoviesDetailAddWatchlistState>
    implements $MoviesDetailAddWatchlistStateCopyWith<$Res> {
  _$MoviesDetailAddWatchlistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoviesDetailAddWatchlistState
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
abstract class _$$InitialImplCopyWith<$Res>
    implements $MoviesDetailAddWatchlistStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String watchlistMessage});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MoviesDetailAddWatchlistStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoviesDetailAddWatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watchlistMessage = null,
  }) {
    return _then(_$InitialImpl(
      watchlistMessage: null == watchlistMessage
          ? _value.watchlistMessage
          : watchlistMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl({this.watchlistMessage = ''}) : super._();

  @override
  @JsonKey()
  final String watchlistMessage;

  /// Create a copy of MoviesDetailAddWatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial extends MoviesDetailAddWatchlistState {
  const factory _Initial({final String watchlistMessage}) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  String get watchlistMessage;

  /// Create a copy of MoviesDetailAddWatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
