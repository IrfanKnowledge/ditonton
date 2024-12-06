import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
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

  const HomeSection homeSection = HomeSection.tvSeriesList;

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

        final appBarMovieListFinder =
            find.byKey(const Key('app_bar_movie_list'));
        final bodyMovieListFinder = find.byKey(const Key('body_movie_list'));
        final centerLoadingNowPlayingFinder =
            find.byKey(const Key('center_loading_now_playing'));
        final loadingNowPlayingFinder =
            find.byKey(const Key('loading_now_playing'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

        expect(appBarMovieListFinder, findsOneWidget);
        expect(bodyMovieListFinder, findsOneWidget);
        expect(centerLoadingNowPlayingFinder, findsOneWidget);
        expect(loadingNowPlayingFinder, findsOneWidget);
      });

      testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        when(mockMovieListNotifier.nowPlayingState)
            .thenReturn(RequestState.Loaded);
        when(mockMovieListNotifier.nowPlayingMovies).thenReturn(<Movie>[]);

        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.Loading);
        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.Loading);

        final listViewMoviesNowPlayingFinder =
            find.byKey(const Key('list_view_movies_now_playing'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

        expect(listViewMoviesNowPlayingFinder, findsOneWidget);
      });

      testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockMovieListNotifier.nowPlayingState)
            .thenReturn(RequestState.Error);
        when(mockMovieListNotifier.message).thenReturn('Failed');

        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.Loading);
        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.Loading);

        final textFinder =
            find.byKey(const Key('list_movies_now_playing_failed'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

        expect(textFinder, findsOneWidget);
      });
    },
  );

  group(
    'Movie Popular',
    () {
      testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(mockMovieListNotifier.nowPlayingState)
            .thenReturn(RequestState.Loading);
        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.Loading);
        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.Loading);

        final appBarMovieListFinder =
            find.byKey(const Key('app_bar_movie_list'));
        final bodyMovieListFinder = find.byKey(const Key('body_movie_list'));
        final centerLoadingPopularFinder =
            find.byKey(const Key('center_loading_popular'));
        final loadingPopularFinder = find.byKey(const Key('loading_popular'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

        expect(appBarMovieListFinder, findsOneWidget);
        expect(bodyMovieListFinder, findsOneWidget);
        expect(centerLoadingPopularFinder, findsOneWidget);
        expect(loadingPopularFinder, findsOneWidget);
      });

      testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        when(mockMovieListNotifier.nowPlayingState)
            .thenReturn(RequestState.Loading);

        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.Loaded);
        when(mockMovieListNotifier.popularMovies).thenReturn(<Movie>[]);

        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.Loading);

        final listViewMoviesPopularFinder =
            find.byKey(const Key('list_view_movies_popular'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

        expect(listViewMoviesPopularFinder, findsOneWidget);
      });

      testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockMovieListNotifier.nowPlayingState)
            .thenReturn(RequestState.Loading);

        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.Error);
        when(mockMovieListNotifier.message).thenReturn('Failed');

        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.Loading);

        final textFinder = find.byKey(const Key('list_movies_popular_failed'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

        expect(textFinder, findsOneWidget);
      });
    },
  );

  group(
    'Movie Top Rated',
    () {
      testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(mockMovieListNotifier.nowPlayingState)
            .thenReturn(RequestState.Loading);
        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.Loading);
        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.Loading);

        final appBarMovieListFinder =
            find.byKey(const Key('app_bar_movie_list'));
        final bodyMovieListFinder = find.byKey(const Key('body_movie_list'));
        final centerLoadingTopRatedFinder =
            find.byKey(const Key('center_loading_top_rated'));
        final loadingTopRatedFinder =
            find.byKey(const Key('loading_top_rated'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

        expect(appBarMovieListFinder, findsOneWidget);
        expect(bodyMovieListFinder, findsOneWidget);
        expect(centerLoadingTopRatedFinder, findsOneWidget);
        expect(loadingTopRatedFinder, findsOneWidget);
      });

      testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        when(mockMovieListNotifier.nowPlayingState)
            .thenReturn(RequestState.Loading);

        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.Loading);

        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.Loaded);
        when(mockMovieListNotifier.topRatedMovies).thenReturn(<Movie>[]);

        final listViewMoviesTopRatedFinder =
            find.byKey(const Key('list_view_movies_top_rated'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

        expect(listViewMoviesTopRatedFinder, findsOneWidget);
      });

      testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockMovieListNotifier.nowPlayingState)
            .thenReturn(RequestState.Loading);

        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.Loading);

        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.Error);
        when(mockMovieListNotifier.message).thenReturn('Failed');

        final textFinder =
            find.byKey(const Key('list_movies_top_rated_failed'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

        expect(textFinder, findsOneWidget);
      });
    },
  );

  void setUpMovies() {
    when(mockMovieListNotifier.nowPlayingState)
        .thenReturn(RequestState.Loading);
    when(mockMovieListNotifier.popularMoviesState)
        .thenReturn(RequestState.Loading);
    when(mockMovieListNotifier.topRatedMoviesState)
        .thenReturn(RequestState.Loading);
  }

  group(
    'Tv Series Airing Today',
    () {
      testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        setUpMovies();

        when(mockTvSeriesListNotifier.airingTodayState)
            .thenReturn(RequestState.Loading);
        when(mockTvSeriesListNotifier.popularState)
            .thenReturn(RequestState.Loading);
        when(mockTvSeriesListNotifier.topRatedState)
            .thenReturn(RequestState.Loading);

        final appBarTvSeriesListFinder =
            find.byKey(const Key('app_bar_tv_series_list'));
        final bodyTvSeriesListFinder =
            find.byKey(const Key('body_tv_series_list'));
        final centerLoadingAiringTodayFinder =
            find.byKey(const Key('center_loading_airing_today'));
        final loadingAiringTodayFinder =
            find.byKey(const Key('loading_airing_today'));

        await tester.pumpWidget(
          makeTestableWidget(const HomeMoviePage(
            homeSection: homeSection,
          )),
        );

        expect(appBarTvSeriesListFinder, findsOneWidget);
        expect(bodyTvSeriesListFinder, findsOneWidget);
        expect(centerLoadingAiringTodayFinder, findsOneWidget);
        expect(loadingAiringTodayFinder, findsOneWidget);
      });

      testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        setUpMovies();

        when(mockTvSeriesListNotifier.airingTodayState)
            .thenReturn(RequestState.Loaded);
        when(mockTvSeriesListNotifier.tvSeriesAiringTodayList)
            .thenReturn(<TvSeries>[]);

        when(mockTvSeriesListNotifier.popularState)
            .thenReturn(RequestState.Loading);

        when(mockTvSeriesListNotifier.topRatedState)
            .thenReturn(RequestState.Loading);

        final listViewAiringTodayFinder =
            find.byKey(const Key('list_view_tv_series_airing_today'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage(
          homeSection: homeSection,
        )));

        expect(listViewAiringTodayFinder, findsOneWidget);
      });

      testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockTvSeriesListNotifier.airingTodayState)
            .thenReturn(RequestState.Error);
        when(mockTvSeriesListNotifier.message).thenReturn('Failed');

        when(mockTvSeriesListNotifier.popularState)
            .thenReturn(RequestState.Loading);

        when(mockTvSeriesListNotifier.topRatedState)
            .thenReturn(RequestState.Loading);

        final textFinder =
            find.byKey(const Key('list_tv_series_airing_today_failed'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage(
          homeSection: homeSection,
        )));

        expect(textFinder, findsOneWidget);
      });
    },
  );

  group(
    'Tv Series Popular',
    () {
      testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        setUpMovies();

        when(mockTvSeriesListNotifier.airingTodayState)
            .thenReturn(RequestState.Loading);
        when(mockTvSeriesListNotifier.popularState)
            .thenReturn(RequestState.Loading);
        when(mockTvSeriesListNotifier.topRatedState)
            .thenReturn(RequestState.Loading);

        final appBarTvSeriesListFinder =
            find.byKey(const Key('app_bar_tv_series_list'));
        final bodyTvSeriesListFinder =
            find.byKey(const Key('body_tv_series_list'));
        final centerLoadingPopularFinder =
            find.byKey(const Key('center_loading_popular'));
        final loadingPopularFinder = find.byKey(const Key('loading_popular'));

        await tester.pumpWidget(
          makeTestableWidget(const HomeMoviePage(
            homeSection: homeSection,
          )),
        );

        expect(appBarTvSeriesListFinder, findsOneWidget);
        expect(bodyTvSeriesListFinder, findsOneWidget);
        expect(centerLoadingPopularFinder, findsOneWidget);
        expect(loadingPopularFinder, findsOneWidget);
      });

      testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        setUpMovies();

        when(mockTvSeriesListNotifier.airingTodayState)
            .thenReturn(RequestState.Loading);

        when(mockTvSeriesListNotifier.popularState)
            .thenReturn(RequestState.Loaded);
        when(mockTvSeriesListNotifier.tvSeriesPopularList)
            .thenReturn(<TvSeries>[]);

        when(mockTvSeriesListNotifier.topRatedState)
            .thenReturn(RequestState.Loading);

        final listViewPopularFinder =
            find.byKey(const Key('list_view_tv_series_popular'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage(
          homeSection: homeSection,
        )));

        expect(listViewPopularFinder, findsOneWidget);
      });

      testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockTvSeriesListNotifier.airingTodayState)
            .thenReturn(RequestState.Loading);

        when(mockTvSeriesListNotifier.popularState)
            .thenReturn(RequestState.Error);
        when(mockTvSeriesListNotifier.message).thenReturn('Failed');

        when(mockTvSeriesListNotifier.topRatedState)
            .thenReturn(RequestState.Loading);

        final textFinder =
            find.byKey(const Key('list_tv_series_popular_failed'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage(
          homeSection: homeSection,
        )));

        expect(textFinder, findsOneWidget);
      });
    },
  );

  group(
    'Tv Series Top Rated',
    () {
      testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        setUpMovies();

        when(mockTvSeriesListNotifier.airingTodayState)
            .thenReturn(RequestState.Loading);
        when(mockTvSeriesListNotifier.popularState)
            .thenReturn(RequestState.Loading);
        when(mockTvSeriesListNotifier.topRatedState)
            .thenReturn(RequestState.Loading);

        final appBarTvSeriesListFinder =
            find.byKey(const Key('app_bar_tv_series_list'));
        final bodyTvSeriesListFinder =
            find.byKey(const Key('body_tv_series_list'));
        final centerLoadingTopRatedFinder =
            find.byKey(const Key('center_loading_top_rated'));
        final loadingTopRatedFinder = find.byKey(const Key('loading_top_rated'));

        await tester.pumpWidget(
          makeTestableWidget(const HomeMoviePage(
            homeSection: homeSection,
          )),
        );

        expect(appBarTvSeriesListFinder, findsOneWidget);
        expect(bodyTvSeriesListFinder, findsOneWidget);
        expect(centerLoadingTopRatedFinder, findsOneWidget);
        expect(loadingTopRatedFinder, findsOneWidget);
      });

      testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        setUpMovies();

        when(mockTvSeriesListNotifier.airingTodayState)
            .thenReturn(RequestState.Loading);

        when(mockTvSeriesListNotifier.popularState)
            .thenReturn(RequestState.Loading);

        when(mockTvSeriesListNotifier.topRatedState)
            .thenReturn(RequestState.Loaded);
        when(mockTvSeriesListNotifier.tvSeriesTopRatedList)
            .thenReturn(<TvSeries>[]);

        final listViewTopRatedFinder =
            find.byKey(const Key('list_view_tv_series_top_rated'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage(
          homeSection: homeSection,
        )));

        expect(listViewTopRatedFinder, findsOneWidget);
      });

      testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockTvSeriesListNotifier.airingTodayState)
            .thenReturn(RequestState.Loading);

        when(mockTvSeriesListNotifier.popularState)
            .thenReturn(RequestState.Loading);

        when(mockTvSeriesListNotifier.topRatedState)
            .thenReturn(RequestState.Error);
        when(mockTvSeriesListNotifier.message).thenReturn('Failed');

        final textFinder =
            find.byKey(const Key('list_tv_series_top_rated_failed'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage(
          homeSection: homeSection,
        )));

        expect(textFinder, findsOneWidget);
      });
    },
  );
}
