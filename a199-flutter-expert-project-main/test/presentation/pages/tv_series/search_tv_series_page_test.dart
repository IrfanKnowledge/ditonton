import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/pages/tv_series/search_tv_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:ditonton/presentation/provider/tv_series_detail_notifier.dart';
import 'package:ditonton/presentation/provider/tv_series_search_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'search_tv_series_page_test.mocks.dart';

///
/// Page [SearchTvSeriesPage],
/// bergantung pada provider [TvSeriesSearchNotifier]
///
@GenerateMocks([
  TvSeriesSearchNotifier,
])
void main() {
  late MockTvSeriesSearchNotifier mockTvSeriesSearchNotifier;

  setUp(
    () {
      mockTvSeriesSearchNotifier = MockTvSeriesSearchNotifier();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvSeriesSearchNotifier>.value(
      value: mockTvSeriesSearchNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    'Page should display center progress bar when loading',
    (tester) async {
      when(mockTvSeriesSearchNotifier.state).thenReturn(RequestState.Loading);

      final centerFinder = find.byKey(const Key('center_loading'));
      final progressBarFinder = find.byKey(const Key('loading'));

      await tester.pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));

      expect(centerFinder, findsOneWidget);
      expect(progressBarFinder, findsOneWidget);
    },
  );

  testWidgets('Page should display ListView when data is loaded',
      (tester) async {
    when(mockTvSeriesSearchNotifier.state).thenReturn(RequestState.Loaded);
    when(mockTvSeriesSearchNotifier.searchResult).thenReturn(<TvSeries>[]);

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display Empty Container when Error',
      (WidgetTester tester) async {
    when(mockTvSeriesSearchNotifier.state).thenReturn(RequestState.Error);
    when(mockTvSeriesSearchNotifier.message).thenReturn('Error message');

    final containerFinder = find.byKey(const Key('container_empty'));

    await tester.pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));

    expect(containerFinder, findsOneWidget);
  });
}
