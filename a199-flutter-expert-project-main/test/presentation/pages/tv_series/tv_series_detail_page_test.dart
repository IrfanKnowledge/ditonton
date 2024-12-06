import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:ditonton/presentation/provider/tv_series_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_page_test.mocks.dart';

///
/// Page [TvSeriesDetailPage],
/// bergantung pada provider [TvSeriesDetailNotifier]
///
@GenerateMocks([
  TvSeriesDetailNotifier,
])
void main() {
  late MockTvSeriesDetailNotifier mockTvSeriesDetailNotifier;

  setUp(
    () {
      mockTvSeriesDetailNotifier = MockTvSeriesDetailNotifier();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvSeriesDetailNotifier>.value(
      value: mockTvSeriesDetailNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when tv series not added to watchlist',
      (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.tvSeriesState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesDetail).thenReturn(tTvSeriesDetail);
    when(mockTvSeriesDetailNotifier.recommendationState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesRecommendations)
        .thenReturn(<TvSeries>[]);
    when(mockTvSeriesDetailNotifier.isAddedToWatchlist).thenReturn(false);

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when tv series is added to wathclist',
      (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.tvSeriesState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesDetail).thenReturn(tTvSeriesDetail);
    when(mockTvSeriesDetailNotifier.recommendationState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesRecommendations)
        .thenReturn(<TvSeries>[]);
    when(mockTvSeriesDetailNotifier.isAddedToWatchlist).thenReturn(true);

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.tvSeriesState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesDetail).thenReturn(tTvSeriesDetail);
    when(mockTvSeriesDetailNotifier.recommendationState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesRecommendations)
        .thenReturn(<TvSeries>[]);
    when(mockTvSeriesDetailNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockTvSeriesDetailNotifier.watchlistMessage)
        .thenReturn('Added to Watchlist');

    final watchlistButton = find.byType(ElevatedButton);

    await tester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.tvSeriesState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesDetail).thenReturn(tTvSeriesDetail);
    when(mockTvSeriesDetailNotifier.recommendationState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesRecommendations)
        .thenReturn(<TvSeries>[]);
    when(mockTvSeriesDetailNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockTvSeriesDetailNotifier.watchlistMessage).thenReturn('Failed');

    final watchlistButton = find.byType(ElevatedButton);

    await tester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });
}
