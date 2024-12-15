import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/presentation/bloc/tv_series_popular_bloc/tv_series_popular_bloc.dart';
import 'package:ditonton/presentation/pages/tv_series/popular_tv_series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'popular_tv_series_page_test.mocks.dart';

///
/// Page [PopularTvSeriesPage],
/// bergantung pada provider [TvSeriesPopularBloc]
///
@GenerateMocks([
  TvSeriesPopularBloc,
])
void main() {
  late MockTvSeriesPopularBloc mockTvSeriesPopularBloc;

  setUp(
    () {
      mockTvSeriesPopularBloc = MockTvSeriesPopularBloc();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<TvSeriesPopularBloc>.value(
      value: mockTvSeriesPopularBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  void arrangeStream() {
    when(mockTvSeriesPopularBloc.stream).thenAnswer(
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

    when(mockTvSeriesPopularBloc.state)
        .thenReturn(const RequestStateFr.loading());

    final centerFinder = find.byType(Center);
    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const PopularTvSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    arrangeStream();

    when(mockTvSeriesPopularBloc.state)
        .thenReturn(RequestStateFr.loaded(tTvSeriesList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const PopularTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    arrangeStream();

    when(mockTvSeriesPopularBloc.state)
        .thenReturn(const RequestStateFr.error('Error message'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const PopularTvSeriesPage()));

    expect(textFinder, findsOneWidget);
  });
}
