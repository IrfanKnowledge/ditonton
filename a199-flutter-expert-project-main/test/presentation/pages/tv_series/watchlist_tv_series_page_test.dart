import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/pages/tv_series/watchlist_tv_series_page.dart';
import 'package:ditonton/presentation/provider/watchlist_tv_series_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'watchlist_tv_series_page_test.mocks.dart';

///
/// Page [WatchlistTvSeriesPage],
/// bergantung pada provider [WatchlistTvSeriesNotifier]
///
@GenerateMocks([
  WatchlistTvSeriesNotifier,
])
void main() {
  late MockWatchlistTvSeriesNotifier mockWatchlistTvSeriesNotifier;

  setUp(
    () {
      mockWatchlistTvSeriesNotifier = MockWatchlistTvSeriesNotifier();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<WatchlistTvSeriesNotifier>.value(
      value: mockWatchlistTvSeriesNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (tester) async {
    when(mockWatchlistTvSeriesNotifier.watchlistState)
        .thenReturn(RequestState.Loading);

    final centerFinder = find.byType(Center);
    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const WatchlistTvSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (tester) async {
    when(mockWatchlistTvSeriesNotifier.watchlistState)
        .thenReturn(RequestState.Loaded);
    when(mockWatchlistTvSeriesNotifier.watchlistTvSeries)
        .thenReturn(<TvSeries>[]);

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const WatchlistTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockWatchlistTvSeriesNotifier.watchlistState)
        .thenReturn(RequestState.Error);
    when(mockWatchlistTvSeriesNotifier.message).thenReturn('Error message');

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const WatchlistTvSeriesPage()));

    expect(textFinder, findsOneWidget);
  });
}
