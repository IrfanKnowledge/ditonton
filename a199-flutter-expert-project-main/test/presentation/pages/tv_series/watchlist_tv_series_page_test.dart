import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/presentation/bloc/watchlist_tv_series_bloc/watchlist_tv_series_bloc.dart';
import 'package:ditonton/presentation/pages/tv_series/watchlist_tv_series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'watchlist_tv_series_page_test.mocks.dart';

///
/// Page [WatchlistTvSeriesPage],
/// bergantung pada provider [WatchlistTvSeriesBloc]
///
@GenerateMocks([
  WatchlistTvSeriesBloc,
])
void main() {
  late MockWatchlistTvSeriesBloc mockWatchlistTvSeriesBloc;

  void arrangeStream() {
    when(mockWatchlistTvSeriesBloc.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const RequestStateFr.initial(),
        const RequestStateFr.loading(),
        RequestStateFr.loaded(tTvSeriesList),
        const RequestStateFr.error('Server Failure'),
      ]),
    );
  }

  setUp(
    () {
      mockWatchlistTvSeriesBloc = MockWatchlistTvSeriesBloc();
      arrangeStream();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<WatchlistTvSeriesBloc>.value(
      value: mockWatchlistTvSeriesBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (tester) async {
    when(mockWatchlistTvSeriesBloc.state)
        .thenReturn(const RequestStateFr.loading());

    final centerFinder = find.byType(Center);
    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const WatchlistTvSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (tester) async {
    when(mockWatchlistTvSeriesBloc.state)
        .thenReturn(RequestStateFr.loaded(tTvSeriesList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const WatchlistTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockWatchlistTvSeriesBloc.state)
        .thenReturn(const RequestStateFr.error('Error message'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const WatchlistTvSeriesPage()));

    expect(textFinder, findsOneWidget);
  });
}
