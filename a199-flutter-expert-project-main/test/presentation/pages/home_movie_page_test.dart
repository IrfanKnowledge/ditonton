import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/bloc/tv_series_list_airing_today_bloc/tv_series_list_airing_today_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_list_popular_bloc/tv_series_list_popular_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_list_top_rated_bloc/tv_series_list_top_rated_bloc.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/provider/movie_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/dummy_objects.dart';
import 'home_movie_page_test.mocks.dart';

///
/// Page [HomeMoviePage],
/// bergantung pada:
///   - provider [MovieListNotifier]
///   - provider [TvSeriesListAiringTodayBloc]
///   - provider [TvSeriesListPopularBloc]
///   - provider [TvSeriesListTopRatedBloc]
///
@GenerateMocks([
  MovieListNotifier,
  TvSeriesListAiringTodayBloc,
  TvSeriesListPopularBloc,
  TvSeriesListTopRatedBloc,
])
void main() {
  late MockMovieListNotifier mockMovieListNotifier;
  late MockTvSeriesListAiringTodayBloc mockTvSeriesListAiringToday;
  late MockTvSeriesListPopularBloc mockTvSeriesListPopular;
  late MockTvSeriesListTopRatedBloc mockTvSeriesListTopRated;

  setUp(
    () {
      mockMovieListNotifier = MockMovieListNotifier();
      mockTvSeriesListAiringToday = MockTvSeriesListAiringTodayBloc();
      mockTvSeriesListPopular = MockTvSeriesListPopularBloc();
      mockTvSeriesListTopRated = MockTvSeriesListTopRatedBloc();
    },
  );

  const HomeSection homeSection = HomeSection.tvSeriesList;

  Widget makeTestableWidget(Widget body) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieListNotifier>.value(
          value: mockMovieListNotifier,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TvSeriesListAiringTodayBloc>.value(
            value: mockTvSeriesListAiringToday,
          ),
          BlocProvider<TvSeriesListPopularBloc>.value(
            value: mockTvSeriesListPopular,
          ),
          BlocProvider<TvSeriesListTopRatedBloc>.value(
            value: mockTvSeriesListTopRated,
          ),
        ],
        child: MaterialApp(
          home: body,
        ),
      ),
    );
  }

  void setUpMovies() {
    when(mockMovieListNotifier.nowPlayingState)
        .thenReturn(RequestState.loading);
    when(mockMovieListNotifier.popularMoviesState)
        .thenReturn(RequestState.loading);
    when(mockMovieListNotifier.topRatedMoviesState)
        .thenReturn(RequestState.loading);
  }

  void arrangeStreamTvSeriesAiringToday() {
    when(mockTvSeriesListAiringToday.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const RequestStateFr.initial(),
        const RequestStateFr.loading(),
        RequestStateFr.loaded(tTvSeriesList),
        const RequestStateFr.error('Server Failure'),
      ]),
    );
  }

  void arrangeStreamTvSeriesPopular() {
    when(mockTvSeriesListPopular.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const RequestStateFr.initial(),
        const RequestStateFr.loading(),
        RequestStateFr.loaded(tTvSeriesList),
        const RequestStateFr.error('Server Failure'),
      ]),
    );
  }

  void arrangeStreamTvSeriesTopRated() {
    when(mockTvSeriesListTopRated.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const RequestStateFr.initial(),
        const RequestStateFr.loading(),
        RequestStateFr.loaded(tTvSeriesList),
        const RequestStateFr.error('Server Failure'),
      ]),
    );
  }

  void arrangeStreamTvSeries() {
    arrangeStreamTvSeriesAiringToday();
    arrangeStreamTvSeriesPopular();
    arrangeStreamTvSeriesTopRated();
  }

  group(
    'Movie Now Playing',
    () {
      setUp(
        () {
          arrangeStreamTvSeries();
        },
      );

      testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(mockMovieListNotifier.nowPlayingState)
            .thenReturn(RequestState.loading);
        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.loading);
        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.loading);

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
            .thenReturn(RequestState.loaded);
        when(mockMovieListNotifier.nowPlayingMovies).thenReturn(<Movie>[]);

        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.loading);
        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.loading);

        final listViewMoviesNowPlayingFinder =
            find.byKey(const Key('list_view_movies_now_playing'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

        expect(listViewMoviesNowPlayingFinder, findsOneWidget);
      });

      testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockMovieListNotifier.nowPlayingState)
            .thenReturn(RequestState.error);
        when(mockMovieListNotifier.message).thenReturn('Failed');

        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.loading);
        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.loading);

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
      setUp(
        () {
          arrangeStreamTvSeries();
        },
      );

      testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(mockMovieListNotifier.nowPlayingState)
            .thenReturn(RequestState.loading);
        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.loading);
        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.loading);

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
            .thenReturn(RequestState.loading);

        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.loaded);
        when(mockMovieListNotifier.popularMovies).thenReturn(<Movie>[]);

        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.loading);

        final listViewMoviesPopularFinder =
            find.byKey(const Key('list_view_movies_popular'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

        expect(listViewMoviesPopularFinder, findsOneWidget);
      });

      testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockMovieListNotifier.nowPlayingState)
            .thenReturn(RequestState.loading);

        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.error);
        when(mockMovieListNotifier.message).thenReturn('Failed');

        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.loading);

        final textFinder = find.byKey(const Key('list_movies_popular_failed'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

        expect(textFinder, findsOneWidget);
      });
    },
  );

  group(
    'Movie Top Rated',
    () {
      setUp(
        () {
          arrangeStreamTvSeries();
        },
      );

      testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(mockMovieListNotifier.nowPlayingState)
            .thenReturn(RequestState.loading);
        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.loading);
        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.loading);

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
            .thenReturn(RequestState.loading);

        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.loading);

        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.loaded);
        when(mockMovieListNotifier.topRatedMovies).thenReturn(<Movie>[]);

        final listViewMoviesTopRatedFinder =
            find.byKey(const Key('list_view_movies_top_rated'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

        expect(listViewMoviesTopRatedFinder, findsOneWidget);
      });

      testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockMovieListNotifier.nowPlayingState)
            .thenReturn(RequestState.loading);

        when(mockMovieListNotifier.popularMoviesState)
            .thenReturn(RequestState.loading);

        when(mockMovieListNotifier.topRatedMoviesState)
            .thenReturn(RequestState.error);
        when(mockMovieListNotifier.message).thenReturn('Failed');

        final textFinder =
            find.byKey(const Key('list_movies_top_rated_failed'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

        expect(textFinder, findsOneWidget);
      });
    },
  );

  group(
    'Tv Series Airing Today',
    () {
      setUp(
        () {
          setUpMovies();
          arrangeStreamTvSeries();
        },
      );

      testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(mockTvSeriesListAiringToday.state)
            .thenReturn(const RequestStateFr.loading());
        when(mockTvSeriesListPopular.state)
            .thenReturn(const RequestStateFr.loading());
        when(mockTvSeriesListTopRated.state)
            .thenReturn(const RequestStateFr.loading());

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
        when(mockTvSeriesListAiringToday.state)
            .thenReturn(RequestStateFr.loaded(tTvSeriesList));
        when(mockTvSeriesListPopular.state)
            .thenReturn(const RequestStateFr.loading());
        when(mockTvSeriesListTopRated.state)
            .thenReturn(const RequestStateFr.loading());

        final listViewAiringTodayFinder =
            find.byKey(const Key('list_view_tv_series_airing_today'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage(
          homeSection: homeSection,
        )));

        expect(listViewAiringTodayFinder, findsOneWidget);
      });

      testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockTvSeriesListAiringToday.state)
            .thenReturn(const RequestStateFr.loading());
        when(mockTvSeriesListAiringToday.state)
            .thenReturn(const RequestStateFr.error('Failed'));

        when(mockTvSeriesListPopular.state)
            .thenReturn(const RequestStateFr.loading());
        when(mockTvSeriesListTopRated.state)
            .thenReturn(const RequestStateFr.loading());

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
      setUp(
        () {
          setUpMovies();
          arrangeStreamTvSeries();
        },
      );

      testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(mockTvSeriesListAiringToday.state)
            .thenReturn(const RequestStateFr.loading());
        when(mockTvSeriesListPopular.state)
            .thenReturn(const RequestStateFr.loading());
        when(mockTvSeriesListTopRated.state)
            .thenReturn(const RequestStateFr.loading());

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
        when(mockTvSeriesListAiringToday.state)
            .thenReturn(const RequestStateFr.loading());

        when(mockTvSeriesListPopular.state)
            .thenReturn(RequestStateFr.loaded(tTvSeriesList));

        when(mockTvSeriesListTopRated.state)
            .thenReturn(const RequestStateFr.loading());

        final listViewPopularFinder =
            find.byKey(const Key('list_view_tv_series_popular'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage(
          homeSection: homeSection,
        )));

        expect(listViewPopularFinder, findsOneWidget);
      });

      testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockTvSeriesListAiringToday.state)
            .thenReturn(const RequestStateFr.loading());

        when(mockTvSeriesListPopular.state)
            .thenReturn(const RequestStateFr.error('Failed'));

        when(mockTvSeriesListTopRated.state)
            .thenReturn(const RequestStateFr.loading());

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
      setUp(
        () {
          setUpMovies();
          arrangeStreamTvSeries();
        },
      );

      testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(mockTvSeriesListAiringToday.state)
            .thenReturn(const RequestStateFr.loading());
        when(mockTvSeriesListPopular.state)
            .thenReturn(const RequestStateFr.loading());
        when(mockTvSeriesListTopRated.state)
            .thenReturn(const RequestStateFr.loading());

        final appBarTvSeriesListFinder =
            find.byKey(const Key('app_bar_tv_series_list'));
        final bodyTvSeriesListFinder =
            find.byKey(const Key('body_tv_series_list'));
        final centerLoadingTopRatedFinder =
            find.byKey(const Key('center_loading_top_rated'));
        final loadingTopRatedFinder =
            find.byKey(const Key('loading_top_rated'));

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
        when(mockTvSeriesListAiringToday.state)
            .thenReturn(const RequestStateFr.loading());

        when(mockTvSeriesListPopular.state)
            .thenReturn(const RequestStateFr.loading());

        when(mockTvSeriesListTopRated.state)
            .thenReturn(RequestStateFr.loaded(tTvSeriesList));

        final listViewTopRatedFinder =
            find.byKey(const Key('list_view_tv_series_top_rated'));

        await tester.pumpWidget(makeTestableWidget(const HomeMoviePage(
          homeSection: homeSection,
        )));

        expect(listViewTopRatedFinder, findsOneWidget);
      });

      testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockTvSeriesListAiringToday.state)
            .thenReturn(const RequestStateFr.loading());

        when(mockTvSeriesListPopular.state)
            .thenReturn(const RequestStateFr.loading());

        when(mockTvSeriesListTopRated.state)
            .thenReturn(const RequestStateFr.error('Failed'));

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
