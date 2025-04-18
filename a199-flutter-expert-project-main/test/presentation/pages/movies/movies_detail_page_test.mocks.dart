// Mocks generated by Mockito 5.4.4 from annotations
// in ditonton/test/presentation/pages/movies/movies_detail_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:ditonton/common/state_freezed.dart' as _i2;
import 'package:ditonton/domain/entities/movie.dart' as _i11;
import 'package:ditonton/domain/entities/movie_detail.dart' as _i7;
import 'package:ditonton/presentation/bloc/movies/movies_detail_add_watchlist_bloc/movies_detail_add_watchlist_bloc.dart'
    as _i4;
import 'package:ditonton/presentation/bloc/movies/movies_detail_bloc/movies_detail_bloc.dart'
    as _i6;
import 'package:ditonton/presentation/bloc/movies/movies_detail_load_watchlist_status_bloc/movies_detail_load_watchlist_status_bloc.dart'
    as _i3;
import 'package:ditonton/presentation/bloc/movies/movies_detail_recommendation_bloc/movies_detail_recommendation_bloc.dart'
    as _i10;
import 'package:ditonton/presentation/bloc/movies/movies_detail_remove_watchlist_bloc/movies_detail_remove_watchlist_bloc.dart'
    as _i5;
import 'package:flutter_bloc/flutter_bloc.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRequestStateFr_0<T> extends _i1.SmartFake
    implements _i2.RequestStateFr<T> {
  _FakeRequestStateFr_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMoviesDetailLoadWatchlistStatusState_1 extends _i1.SmartFake
    implements _i3.MoviesDetailLoadWatchlistStatusState {
  _FakeMoviesDetailLoadWatchlistStatusState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMoviesDetailAddWatchlistState_2 extends _i1.SmartFake
    implements _i4.MoviesDetailAddWatchlistState {
  _FakeMoviesDetailAddWatchlistState_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMoviesDetailRemoveWatchlistState_3 extends _i1.SmartFake
    implements _i5.MoviesDetailRemoveWatchlistState {
  _FakeMoviesDetailRemoveWatchlistState_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MoviesDetailBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockMoviesDetailBloc extends _i1.Mock implements _i6.MoviesDetailBloc {
  MockMoviesDetailBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RequestStateFr<_i7.MovieDetail> get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeRequestStateFr_0<_i7.MovieDetail>(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.RequestStateFr<_i7.MovieDetail>);

  @override
  _i8.Stream<_i2.RequestStateFr<_i7.MovieDetail>> get stream =>
      (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i8.Stream<_i2.RequestStateFr<_i7.MovieDetail>>.empty(),
      ) as _i8.Stream<_i2.RequestStateFr<_i7.MovieDetail>>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  _i8.Future<void> fetchMoviesDetail({
    required _i9.Emitter<_i2.RequestStateFr<_i7.MovieDetail>>? emit,
    required int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchMoviesDetail,
          [],
          {
            #emit: emit,
            #id: id,
          },
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void add(_i6.MoviesDetailEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i6.MoviesDetailEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i2.RequestStateFr<_i7.MovieDetail>? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i6.MoviesDetailEvent>(
    _i9.EventHandler<E, _i2.RequestStateFr<_i7.MovieDetail>>? handler, {
    _i9.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i9.Transition<_i6.MoviesDetailEvent,
                  _i2.RequestStateFr<_i7.MovieDetail>>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void onChange(_i9.Change<_i2.RequestStateFr<_i7.MovieDetail>>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [MoviesDetailRecommendationBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockMoviesDetailRecommendationBloc extends _i1.Mock
    implements _i10.MoviesDetailRecommendationBloc {
  MockMoviesDetailRecommendationBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RequestStateFr<List<_i11.Movie>> get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeRequestStateFr_0<List<_i11.Movie>>(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.RequestStateFr<List<_i11.Movie>>);

  @override
  _i8.Stream<_i2.RequestStateFr<List<_i11.Movie>>> get stream =>
      (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i8.Stream<_i2.RequestStateFr<List<_i11.Movie>>>.empty(),
      ) as _i8.Stream<_i2.RequestStateFr<List<_i11.Movie>>>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  _i8.Future<void> fetchMoviesDetailRecommendation({
    required _i9.Emitter<_i2.RequestStateFr<List<_i11.Movie>>>? emit,
    required int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchMoviesDetailRecommendation,
          [],
          {
            #emit: emit,
            #id: id,
          },
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void add(_i10.MoviesDetailRecommendationEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i10.MoviesDetailRecommendationEvent? event) =>
      super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i2.RequestStateFr<List<_i11.Movie>>? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i10.MoviesDetailRecommendationEvent>(
    _i9.EventHandler<E, _i2.RequestStateFr<List<_i11.Movie>>>? handler, {
    _i9.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i9.Transition<_i10.MoviesDetailRecommendationEvent,
                  _i2.RequestStateFr<List<_i11.Movie>>>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void onChange(_i9.Change<_i2.RequestStateFr<List<_i11.Movie>>>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [MoviesDetailLoadWatchlistStatusBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockMoviesDetailLoadWatchlistStatusBloc extends _i1.Mock
    implements _i3.MoviesDetailLoadWatchlistStatusBloc {
  MockMoviesDetailLoadWatchlistStatusBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.MoviesDetailLoadWatchlistStatusState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeMoviesDetailLoadWatchlistStatusState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.MoviesDetailLoadWatchlistStatusState);

  @override
  _i8.Stream<_i3.MoviesDetailLoadWatchlistStatusState> get stream =>
      (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue:
            _i8.Stream<_i3.MoviesDetailLoadWatchlistStatusState>.empty(),
      ) as _i8.Stream<_i3.MoviesDetailLoadWatchlistStatusState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  _i8.Future<void> loadWatchlistStatus({
    required _i9.Emitter<_i3.MoviesDetailLoadWatchlistStatusState>? emit,
    required int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadWatchlistStatus,
          [],
          {
            #emit: emit,
            #id: id,
          },
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void add(_i3.MoviesDetailLoadWatchlistStatusEvent? event) =>
      super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i3.MoviesDetailLoadWatchlistStatusEvent? event) =>
      super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i3.MoviesDetailLoadWatchlistStatusState? state) =>
      super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i3.MoviesDetailLoadWatchlistStatusEvent>(
    _i9.EventHandler<E, _i3.MoviesDetailLoadWatchlistStatusState>? handler, {
    _i9.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i9.Transition<_i3.MoviesDetailLoadWatchlistStatusEvent,
                  _i3.MoviesDetailLoadWatchlistStatusState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void onChange(_i9.Change<_i3.MoviesDetailLoadWatchlistStatusState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [MoviesDetailAddWatchlistBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockMoviesDetailAddWatchlistBloc extends _i1.Mock
    implements _i4.MoviesDetailAddWatchlistBloc {
  MockMoviesDetailAddWatchlistBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.MoviesDetailAddWatchlistState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeMoviesDetailAddWatchlistState_2(
          this,
          Invocation.getter(#state),
        ),
      ) as _i4.MoviesDetailAddWatchlistState);

  @override
  _i8.Stream<_i4.MoviesDetailAddWatchlistState> get stream =>
      (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i8.Stream<_i4.MoviesDetailAddWatchlistState>.empty(),
      ) as _i8.Stream<_i4.MoviesDetailAddWatchlistState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  _i8.Future<void> addWatchlist({
    required _i9.Emitter<_i4.MoviesDetailAddWatchlistState>? emit,
    required _i7.MovieDetail? movieDetail,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addWatchlist,
          [],
          {
            #emit: emit,
            #movieDetail: movieDetail,
          },
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void add(_i4.MoviesDetailAddWatchlistEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i4.MoviesDetailAddWatchlistEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i4.MoviesDetailAddWatchlistState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i4.MoviesDetailAddWatchlistEvent>(
    _i9.EventHandler<E, _i4.MoviesDetailAddWatchlistState>? handler, {
    _i9.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i9.Transition<_i4.MoviesDetailAddWatchlistEvent,
                  _i4.MoviesDetailAddWatchlistState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void onChange(_i9.Change<_i4.MoviesDetailAddWatchlistState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [MoviesDetailRemoveWatchlistBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockMoviesDetailRemoveWatchlistBloc extends _i1.Mock
    implements _i5.MoviesDetailRemoveWatchlistBloc {
  MockMoviesDetailRemoveWatchlistBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.MoviesDetailRemoveWatchlistState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeMoviesDetailRemoveWatchlistState_3(
          this,
          Invocation.getter(#state),
        ),
      ) as _i5.MoviesDetailRemoveWatchlistState);

  @override
  _i8.Stream<_i5.MoviesDetailRemoveWatchlistState> get stream =>
      (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i8.Stream<_i5.MoviesDetailRemoveWatchlistState>.empty(),
      ) as _i8.Stream<_i5.MoviesDetailRemoveWatchlistState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  _i8.Future<void> removeFromWatchlist({
    required _i9.Emitter<_i5.MoviesDetailRemoveWatchlistState>? emit,
    required _i7.MovieDetail? movieDetail,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeFromWatchlist,
          [],
          {
            #emit: emit,
            #movieDetail: movieDetail,
          },
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void add(_i5.MoviesDetailRemoveWatchlistEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i5.MoviesDetailRemoveWatchlistEvent? event) =>
      super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i5.MoviesDetailRemoveWatchlistState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i5.MoviesDetailRemoveWatchlistEvent>(
    _i9.EventHandler<E, _i5.MoviesDetailRemoveWatchlistState>? handler, {
    _i9.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i9.Transition<_i5.MoviesDetailRemoveWatchlistEvent,
                  _i5.MoviesDetailRemoveWatchlistState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void onChange(_i9.Change<_i5.MoviesDetailRemoveWatchlistState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}
