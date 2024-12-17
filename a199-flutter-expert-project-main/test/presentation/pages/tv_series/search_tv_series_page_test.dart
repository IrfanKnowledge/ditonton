import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/presentation/bloc/tv_series_search_bloc/tv_series_search_bloc.dart';
import 'package:ditonton/presentation/pages/tv_series/search_tv_series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'search_tv_series_page_test.mocks.dart';

///
/// Page [SearchTvSeriesPage],
/// bergantung pada provider [TvSeriesSearchBloc]
///
@GenerateMocks([
  TvSeriesSearchBloc,
])
void main() {
  late MockTvSeriesSearchBloc mockTvSeriesSearch;

  setUp(
    () {
      mockTvSeriesSearch = MockTvSeriesSearchBloc();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<TvSeriesSearchBloc>.value(
      value: mockTvSeriesSearch,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    'Page should display center progress bar when loading',
    (tester) async {
      when(mockTvSeriesSearch.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const RequestStateFr.initial(),
          const RequestStateFr.loading(),
        ]),
      );

      when(mockTvSeriesSearch.state).thenReturn(const RequestStateFr.loading());

      final centerFinder = find.byKey(const Key('center_loading'));
      final progressBarFinder = find.byKey(const Key('loading'));

      await tester.pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));

      expect(centerFinder, findsOneWidget);
      expect(progressBarFinder, findsOneWidget);
    },
  );

  testWidgets('Page should display ListView when data is loaded',
      (tester) async {
    when(mockTvSeriesSearch.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const RequestStateFr.initial(),
        const RequestStateFr.loading(),
        RequestStateFr.loaded(tTvSeriesSearchedList),
      ]),
    );

    when(mockTvSeriesSearch.state).thenReturn(
      RequestStateFr.loaded(tTvSeriesSearchedList),
    );

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display Empty Container when Error',
      (WidgetTester tester) async {
    when(mockTvSeriesSearch.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const RequestStateFr.initial(),
        const RequestStateFr.loading(),
        const RequestStateFr.error('Server Failure'),
      ]),
    );

    when(mockTvSeriesSearch.state)
        .thenReturn(const RequestStateFr.error('Server Failure'));

    final containerFinder = find.byKey(const Key('container_empty'));

    await tester.pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));

    expect(containerFinder, findsOneWidget);
  });
}
