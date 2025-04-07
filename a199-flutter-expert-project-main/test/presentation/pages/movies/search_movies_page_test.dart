import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/bloc/movies/movies_search_bloc/movies_search_bloc.dart';
import 'package:ditonton/presentation/pages/movies/search_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_movies_page_test.mocks.dart';

///
/// Page [SearchMoviesPage],
/// bergantung pada provider [MoviesSearchBloc]
///
@GenerateMocks([
  MoviesSearchBloc,
])
void main() {
  late MockMoviesSearchBloc mockMoviesSearch;

  setUp(
    () {
      mockMoviesSearch = MockMoviesSearchBloc();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<MoviesSearchBloc>.value(
      value: mockMoviesSearch,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  final tMovieList = <Movie>[];

  testWidgets(
    'Page should display center progress bar when loading',
    (tester) async {
      when(mockMoviesSearch.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const RequestStateFr.initial(),
          const RequestStateFr.loading(),
        ]),
      );

      when(mockMoviesSearch.state).thenReturn(const RequestStateFr.loading());

      final centerFinder = find.byKey(const Key('center_loading'));
      final progressBarFinder = find.byKey(const Key('loading'));

      await tester.pumpWidget(makeTestableWidget(const SearchMoviesPage()));

      expect(centerFinder, findsOneWidget);
      expect(progressBarFinder, findsOneWidget);
    },
  );

  testWidgets('Page should display ListView when data is loaded',
      (tester) async {
    when(mockMoviesSearch.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const RequestStateFr.initial(),
        const RequestStateFr.loading(),
        RequestStateFr.loaded(tMovieList),
      ]),
    );

    when(mockMoviesSearch.state).thenReturn(
      RequestStateFr.loaded(tMovieList),
    );

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const SearchMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display Empty Container when Error',
      (WidgetTester tester) async {
    when(mockMoviesSearch.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const RequestStateFr.initial(),
        const RequestStateFr.loading(),
        const RequestStateFr.error('Server Failure'),
      ]),
    );

    when(mockMoviesSearch.state)
        .thenReturn(const RequestStateFr.error('Server Failure'));

    final containerFinder = find.byKey(const Key('container_empty'));

    await tester.pumpWidget(makeTestableWidget(const SearchMoviesPage()));

    expect(containerFinder, findsOneWidget);
  });
}
