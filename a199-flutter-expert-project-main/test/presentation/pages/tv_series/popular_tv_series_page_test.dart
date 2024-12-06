import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/pages/tv_series/popular_tv_series_page.dart';
import 'package:ditonton/presentation/provider/tv_series_popular_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'popular_tv_series_page_test.mocks.dart';

///
/// Page [PopularTvSeriesPage],
/// bergantung pada provider [TvSeriesPopularNotifier]
///
@GenerateMocks([
  TvSeriesPopularNotifier,
])
void main() {
  late MockTvSeriesPopularNotifier mockTvSeriesPopularNotifier;

  setUp(
    () {
      mockTvSeriesPopularNotifier = MockTvSeriesPopularNotifier();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvSeriesPopularNotifier>.value(
      value: mockTvSeriesPopularNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockTvSeriesPopularNotifier.popularState)
        .thenReturn(RequestState.Loading);

    final centerFinder = find.byType(Center);
    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const PopularTvSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(mockTvSeriesPopularNotifier.popularState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesPopularNotifier.tvSeriesList).thenReturn(<TvSeries>[]);

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const PopularTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockTvSeriesPopularNotifier.popularState)
        .thenReturn(RequestState.Error);
    when(mockTvSeriesPopularNotifier.message).thenReturn('Error message');

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const PopularTvSeriesPage()));

    expect(textFinder, findsOneWidget);
  });
}
