import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/pages/tv_series/airing_today_tv_series_page.dart';
import 'package:ditonton/presentation/provider/tv_series_airing_today_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'airing_today_tv_series_page_test.mocks.dart';

///
/// Page [AiringTodayTvSeriesPage],
/// bergantung pada provider [TvSeriesAiringTodayNotifier]
///
@GenerateMocks([TvSeriesAiringTodayNotifier])
void main() {
  late MockTvSeriesAiringTodayNotifier mockTvSeriesAiringTodayNotifier;

  setUp(
    () {
      mockTvSeriesAiringTodayNotifier = MockTvSeriesAiringTodayNotifier();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvSeriesAiringTodayNotifier>.value(
      value: mockTvSeriesAiringTodayNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockTvSeriesAiringTodayNotifier.airingTodayState)
        .thenReturn(RequestState.loading);

    final centerFinder = find.byType(Center);
    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester
        .pumpWidget(makeTestableWidget(const AiringTodayTvSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(mockTvSeriesAiringTodayNotifier.airingTodayState)
        .thenReturn(RequestState.loaded);
    when(mockTvSeriesAiringTodayNotifier.tvSeriesList).thenReturn(<TvSeries>[]);

    final listViewFinder = find.byType(ListView);

    await tester
        .pumpWidget(makeTestableWidget(const AiringTodayTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockTvSeriesAiringTodayNotifier.airingTodayState)
        .thenReturn(RequestState.error);
    when(mockTvSeriesAiringTodayNotifier.message).thenReturn('Error message');

    final textFinder = find.byKey(const Key('error_message'));

    await tester
        .pumpWidget(makeTestableWidget(const AiringTodayTvSeriesPage()));

    expect(textFinder, findsOneWidget);
  });
}
