import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/presentation/bloc/tv_series_top_rated_bloc/tv_series_top_rated_bloc.dart';
import 'package:ditonton/presentation/pages/tv_series/top_rated_tv_series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'top_rated_tv_series_page_test.mocks.dart';

///
/// Page [TopRatedTvSeriesPage],
/// bergantung pada provider [TvSeriesTopRatedBloc]
///
@GenerateMocks([
  TvSeriesTopRatedBloc,
])
void main() {
  late MockTvSeriesTopRatedBloc mockGetTvSeriesTopRatedBloc;

  setUp(
    () {
      mockGetTvSeriesTopRatedBloc = MockTvSeriesTopRatedBloc();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<TvSeriesTopRatedBloc>.value(
      value: mockGetTvSeriesTopRatedBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  void arrangeStream() {
    when(mockGetTvSeriesTopRatedBloc.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const RequestStateFr.initial(),
        const RequestStateFr.loading(),
        RequestStateFr.loaded(tTvSeriesList),
        const RequestStateFr.error('Server Failure'),
      ]),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    arrangeStream();

    when(mockGetTvSeriesTopRatedBloc.state)
        .thenReturn(const RequestStateFr.loading());

    final centerFinder = find.byType(Center);
    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const TopRatedTvSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    arrangeStream();

    when(mockGetTvSeriesTopRatedBloc.state)
        .thenReturn(RequestStateFr.loaded(tTvSeriesList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const TopRatedTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    arrangeStream();

    when(mockGetTvSeriesTopRatedBloc.state)
        .thenReturn(const RequestStateFr.error('Error message'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const TopRatedTvSeriesPage()));

    expect(textFinder, findsOneWidget);
  });
}
