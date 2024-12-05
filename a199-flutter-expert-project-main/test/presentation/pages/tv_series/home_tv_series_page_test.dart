import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/pages/tv_series/home_tv_series_page.dart';
import 'package:ditonton/presentation/provider/tv_series_airing_today_notifier.dart';
import 'package:ditonton/presentation/provider/tv_series_popular_notifier.dart';
import 'package:ditonton/presentation/provider/tv_series_top_rated_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'home_tv_series_page_test.mocks.dart';

///
/// Page [HomeTvSeriesPage],
/// bergantung pada:
///   - provider [TvSeriesAiringTodayNotifier]
///   - provider [TvSeriesPopularNotifier]
///   - provider [TvSeriesTopRatedNotifier]
///
@GenerateMocks([
  TvSeriesAiringTodayNotifier,
  TvSeriesPopularNotifier,
  TvSeriesTopRatedNotifier,
])
void main() {
  late MockTvSeriesAiringTodayNotifier mockTvSeriesAiringTodayNotifier;
  late MockTvSeriesPopularNotifier mockTvSeriesPopularNotifier;
  late MockTvSeriesTopRatedNotifier mockTvSeriesTopRatedNotifier;

  setUp(
    () {
      mockTvSeriesAiringTodayNotifier = MockTvSeriesAiringTodayNotifier();
      mockTvSeriesPopularNotifier = MockTvSeriesPopularNotifier();
      mockTvSeriesTopRatedNotifier = MockTvSeriesTopRatedNotifier();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TvSeriesAiringTodayNotifier>.value(
          value: mockTvSeriesAiringTodayNotifier,
        ),
        ChangeNotifierProvider<TvSeriesPopularNotifier>.value(
          value: mockTvSeriesPopularNotifier,
        ),
        ChangeNotifierProvider<TvSeriesTopRatedNotifier>.value(
          value: mockTvSeriesTopRatedNotifier,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group(
    'Tv Series Airing Today ',
    () {
      testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(mockTvSeriesPopularNotifier.popularState)
            .thenReturn(RequestState.Loading);

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final centerFinder = find.byType(Center);

        await tester.pumpWidget(makeTestableWidget(const HomeTvSeriesPage()));

        expect(centerFinder, findsOneWidget);
        expect(progressBarFinder, findsOneWidget);
      });

      testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        when(mockTvSeriesPopularNotifier.popularState)
            .thenReturn(RequestState.Loaded);
        when(mockTvSeriesPopularNotifier.tvSeriesList).thenReturn(<TvSeries>[]);

        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(makeTestableWidget(const HomeTvSeriesPage()));

        expect(listViewFinder, findsOneWidget);
      });

      testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockTvSeriesPopularNotifier.popularState)
            .thenReturn(RequestState.Error);
        when(mockTvSeriesPopularNotifier.message).thenReturn('Error message');

        final textFinder = find.byKey(const Key('error_message'));

        await tester.pumpWidget(makeTestableWidget(const HomeTvSeriesPage()));


        expect(textFinder, findsOneWidget);
      });
    },
  );
}
