import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/provider/movie_list_notifier.dart';
import 'package:ditonton/presentation/provider/tv_series_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'home_movie_page_test.mocks.dart';

///
/// Page [HomeMoviePage],
/// bergantung pada:
///   - provider [MovieListNotifier]
///   - provider [TvSeriesListNotifier]
///
@GenerateMocks([
  MovieListNotifier,
  TvSeriesListNotifier,
])
void main() {
  late MockMovieListNotifier mockMovieListNotifier;
  late MockTvSeriesListNotifier mockTvSeriesListNotifier;

  setUp(
    () {
      mockMovieListNotifier = MockMovieListNotifier();
      mockTvSeriesListNotifier = MockTvSeriesListNotifier();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieListNotifier>.value(
          value: mockMovieListNotifier,
        ),
        ChangeNotifierProvider<TvSeriesListNotifier>.value(
          value: mockTvSeriesListNotifier,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group(
    'Movie Now Playing',
    () {
      testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(mockMovieListNotifier.nowPlayingState)
            .thenReturn(RequestState.Loading);
        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.Loading);
        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.Loading);

        final appBarMovieListFinder = find.byKey(const Key('app_bar_movie_list'));
        final centerLoadingNowPlaying = find.byKey(const Key('center_loading_now_playing'));
        final loadingNowPlaying = find.byKey(const Key('loading_now_playing'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

        expect(appBarMovieListFinder, findsOneWidget);
        expect(centerLoadingNowPlaying, findsOneWidget);
        expect(loadingNowPlaying, findsOneWidget);
      });
    },
  );
}
