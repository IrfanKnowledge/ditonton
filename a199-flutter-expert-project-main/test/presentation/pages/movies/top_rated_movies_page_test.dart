import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/bloc/movies/movies_top_rated_bloc/movies_top_rated_bloc.dart';
import 'package:ditonton/presentation/pages/movies/top_rated_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'top_rated_movies_page_test.mocks.dart';

///
/// Page [TopRatedMoviesPage],
/// bergantung pada provider [MoviesTopRatedBloc]
///
@GenerateMocks([
  MoviesTopRatedBloc,
])
void main() {
  late MockMoviesTopRatedBloc mockGetMoviesTopRatedBloc;

  setUp(
    () {
      mockGetMoviesTopRatedBloc = MockMoviesTopRatedBloc();
    },
  );

  final tMovieList = <Movie>[];

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<MoviesTopRatedBloc>.value(
      value: mockGetMoviesTopRatedBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  void arrangeStream() {
    when(mockGetMoviesTopRatedBloc.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const RequestStateFr.initial(),
        const RequestStateFr.loading(),
        RequestStateFr.loaded(tMovieList),
        const RequestStateFr.error('Server Failure'),
      ]),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    arrangeStream();

    when(mockGetMoviesTopRatedBloc.state)
        .thenReturn(const RequestStateFr.loading());

    final centerFinder = find.byType(Center);
    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    arrangeStream();

    when(mockGetMoviesTopRatedBloc.state)
        .thenReturn(RequestStateFr.loaded(tMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    arrangeStream();

    when(mockGetMoviesTopRatedBloc.state)
        .thenReturn(const RequestStateFr.error('Error message'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
