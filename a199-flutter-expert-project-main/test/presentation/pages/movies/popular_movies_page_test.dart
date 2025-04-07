import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/bloc/movies/movies_popular_bloc/movies_popular_bloc.dart';
import 'package:ditonton/presentation/pages/movies/popular_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'popular_movies_page_test.mocks.dart';

///
/// Page [PopularMoviesPage],
/// bergantung pada provider [MoviesPopularBloc]
///
@GenerateMocks([
  MoviesPopularBloc,
])
void main() {
  late MockMoviesPopularBloc mockMoviesPopularBloc;

  setUp(
    () {
      mockMoviesPopularBloc = MockMoviesPopularBloc();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<MoviesPopularBloc>.value(
      value: mockMoviesPopularBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  final tMovieList = <Movie>[];

  void arrangeStream() {
    when(mockMoviesPopularBloc.stream).thenAnswer(
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

    when(mockMoviesPopularBloc.state)
        .thenReturn(const RequestStateFr.loading());

    final centerFinder = find.byType(Center);
    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    arrangeStream();

    when(mockMoviesPopularBloc.state)
        .thenReturn(RequestStateFr.loaded(tMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    arrangeStream();

    when(mockMoviesPopularBloc.state)
        .thenReturn(const RequestStateFr.error('Error message'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
