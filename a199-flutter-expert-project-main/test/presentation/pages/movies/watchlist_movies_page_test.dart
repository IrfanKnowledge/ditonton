import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/bloc/movies/watchlist_movies_bloc/watchlist_movies_bloc.dart';
import 'package:ditonton/presentation/pages/movies/watchlist_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'watchlist_movies_page_test.mocks.dart';

///
/// Page [WatchlistMoviesPage],
/// bergantung pada provider [WatchlistMoviesBloc]
///
@GenerateMocks([
  WatchlistMoviesBloc,
])
void main() {
  late MockWatchlistMoviesBloc mockWatchlistMoviesBloc;

  final tMovieList = <Movie>[];

  void arrangeStream() {
    when(mockWatchlistMoviesBloc.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const RequestStateFr.initial(),
        const RequestStateFr.loading(),
        RequestStateFr.loaded(tMovieList),
        const RequestStateFr.error('Server Failure'),
      ]),
    );
  }

  setUp(
    () {
      mockWatchlistMoviesBloc = MockWatchlistMoviesBloc();
      arrangeStream();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<WatchlistMoviesBloc>.value(
      value: mockWatchlistMoviesBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (tester) async {
    when(mockWatchlistMoviesBloc.state)
        .thenReturn(const RequestStateFr.loading());

    final centerFinder = find.byType(Center);
    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const WatchlistMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (tester) async {
    when(mockWatchlistMoviesBloc.state)
        .thenReturn(RequestStateFr.loaded(tMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const WatchlistMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockWatchlistMoviesBloc.state)
        .thenReturn(const RequestStateFr.error('Error message'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const WatchlistMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
