import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class EvaluateRobot {
  final WidgetTester tester;

  const EvaluateRobot(this.tester);

  Future<void> loadUI(Widget widget) async {
    await tester.pumpWidget(widget);
  }

  Future<void> clickItemOnMoviePopularList() async {
    final tvSeriesPopularItemFinder = find.byKey(const Key('movie_popular_0'));
    await tester.tap(tvSeriesPopularItemFinder);
  }

  Future<void> backFromMovieDetailPage() async {
    final backButtonFinder = find.byKey(const Key('movie_detail_back'));
    await tester.tap(backButtonFinder);
  }

  Future<void> clickDrawerButtonOnHome() async {
    final drawerButtonFinder = find.byType(DrawerButton);
    await tester.tap(drawerButtonFinder);
  }

  Future<void> clickListTileTvSeriesOnDrawer() async {
    final listTileTvSeriesFinder = find.byKey(const Key('list_tile_tv_series'));
    await tester.tap(listTileTvSeriesFinder);
  }

  Future<void> clickItemOnTvSeriesPopularList() async {
    final tvSeriesPopularItemFinder =
        find.byKey(const Key('tv_series_popular_0'));
    await tester.tap(tvSeriesPopularItemFinder);
  }

  Future<void> backFromTvSeriesDetailPage() async {
    final backButtonFinder = find.byKey(const Key('tv_series_detail_back'));
    await tester.tap(backButtonFinder);
  }
}
