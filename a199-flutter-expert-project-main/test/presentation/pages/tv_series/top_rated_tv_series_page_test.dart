import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/pages/tv_series/top_rated_tv_series_page.dart';
import 'package:ditonton/presentation/provider/tv_series_top_rated_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'top_rated_tv_series_page_test.mocks.dart';

///
/// Page [TopRatedTvSeriesPage],
/// bergantung pada provider [TvSeriesTopRatedNotifier]
///
@GenerateMocks([
  TvSeriesTopRatedNotifier,
])
void main() {
  late MockTvSeriesTopRatedNotifier mockGetTvSeriesTopRatedNotifier;

  setUp(
    () {
      mockGetTvSeriesTopRatedNotifier = MockTvSeriesTopRatedNotifier();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvSeriesTopRatedNotifier>.value(
      value: mockGetTvSeriesTopRatedNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockGetTvSeriesTopRatedNotifier.topRatedState)
        .thenReturn(RequestState.Loading);

    final centerFinder = find.byType(Center);
    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const TopRatedTvSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(mockGetTvSeriesTopRatedNotifier.topRatedState)
        .thenReturn(RequestState.Loaded);
    when(mockGetTvSeriesTopRatedNotifier.tvSeriesList).thenReturn(<TvSeries>[]);

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const TopRatedTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockGetTvSeriesTopRatedNotifier.topRatedState)
        .thenReturn(RequestState.Error);
    when(mockGetTvSeriesTopRatedNotifier.message).thenReturn('Error message');

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const TopRatedTvSeriesPage()));

    expect(textFinder, findsOneWidget);
  });
}
