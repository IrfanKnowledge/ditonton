import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/route_name.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/firebase_options.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:ditonton/presentation/bloc/movies/movies_list_now_playing_bloc/movies_list_now_playing_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_airing_today_bloc/tv_series_airing_today_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_add_watchlist_bloc/tv_series_detail_add_watchlist_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_bloc/tv_series_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_load_watchlist_status_bloc/tv_series_detail_load_watchlist_status_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_recommendation_bloc/tv_series_detail_recommendation_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_remove_watchlist_bloc/tv_series_detail_remove_watchlist_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_list_airing_today_bloc/tv_series_list_airing_today_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_list_popular_bloc/tv_series_list_popular_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_list_top_rated_bloc/tv_series_list_top_rated_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_popular_bloc/tv_series_popular_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_search_bloc/tv_series_search_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_top_rated_bloc/tv_series_top_rated_bloc.dart';
import 'package:ditonton/presentation/bloc/watchlist_tv_series_bloc/watchlist_tv_series_bloc.dart';
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/pages/movies/search_movies_page.dart';
import 'package:ditonton/presentation/pages/tv_series/airing_today_tv_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series/popular_tv_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series/search_tv_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series/top_rated_tv_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:ditonton/presentation/pages/tv_series/watchlist_tv_series_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'common/firebase_analytics_helper.dart';
import 'presentation/bloc/movies/movies_detail_add_watchlist_bloc/movies_detail_add_watchlist_bloc.dart';
import 'presentation/bloc/movies/movies_detail_bloc/movies_detail_bloc.dart';
import 'presentation/bloc/movies/movies_detail_load_watchlist_status_bloc/movies_detail_load_watchlist_status_bloc.dart';
import 'presentation/bloc/movies/movies_detail_recommendation_bloc/movies_detail_recommendation_bloc.dart';
import 'presentation/bloc/movies/movies_detail_remove_watchlist_bloc/movies_detail_remove_watchlist_bloc.dart';
import 'presentation/bloc/movies/movies_list_popular_bloc/movies_list_popular_bloc.dart';
import 'presentation/bloc/movies/movies_list_top_rated_bloc/movies_list_top_rated_bloc.dart';
import 'presentation/bloc/movies/movies_popular_bloc/movies_popular_bloc.dart';
import 'presentation/bloc/movies/movies_search_bloc/movies_search_bloc.dart';
import 'presentation/bloc/movies/movies_top_rated_bloc/movies_top_rated_bloc.dart';
import 'presentation/bloc/movies/watchlist_movies_bloc/watchlist_movies_bloc.dart';
import 'presentation/pages/movies/movies_detail_page.dart';
import 'presentation/pages/movies/popular_movies_page.dart';
import 'presentation/pages/movies/top_rated_movies_page.dart';
import 'presentation/pages/movies/watchlist_movies_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseAnalyticsHelper();
  await FirebaseAnalyticsHelper.instance.initAsync();

  await dotenv.load(fileName: "assets/envs/key.env");

  await di.init();

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // movies
        BlocProvider<MoviesListNowPlayingBloc>(
          create: (context) => di.locator<MoviesListNowPlayingBloc>(),
        ),
        BlocProvider<MoviesListPopularBloc>(
          create: (context) => di.locator<MoviesListPopularBloc>(),
        ),
        BlocProvider<MoviesListTopRatedBloc>(
          create: (context) => di.locator<MoviesListTopRatedBloc>(),
        ),

        BlocProvider(
          create: (context) => di.locator<MoviesDetailBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MoviesDetailRecommendationBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              di.locator<MoviesDetailLoadWatchlistStatusBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MoviesDetailAddWatchlistBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MoviesDetailRemoveWatchlistBloc>(),
        ),

        BlocProvider(
          create: (context) => di.locator<MoviesSearchBloc>(),
        ),

        BlocProvider<MoviesPopularBloc>(
          create: (context) => di.locator<MoviesPopularBloc>(),
        ),
        BlocProvider<MoviesTopRatedBloc>(
          create: (context) => di.locator<MoviesTopRatedBloc>(),
        ),

        BlocProvider<WatchlistMoviesBloc>(
          create: (context) => di.locator<WatchlistMoviesBloc>(),
        ),

        // tv series
        BlocProvider<TvSeriesListAiringTodayBloc>(
          create: (context) => di.locator<TvSeriesListAiringTodayBloc>(),
        ),
        BlocProvider<TvSeriesListPopularBloc>(
          create: (context) => di.locator<TvSeriesListPopularBloc>(),
        ),
        BlocProvider<TvSeriesListTopRatedBloc>(
          create: (context) => di.locator<TvSeriesListTopRatedBloc>(),
        ),

        BlocProvider(
          create: (context) => di.locator<TvSeriesDetailBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvSeriesDetailRecommendationBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              di.locator<TvSeriesDetailLoadWatchlistStatusBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvSeriesDetailAddWatchlistBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvSeriesDetailRemoveWatchlistBloc>(),
        ),

        BlocProvider(
          create: (context) => di.locator<TvSeriesSearchBloc>(),
        ),

        BlocProvider<TvSeriesAiringTodayBloc>(
          create: (context) => di.locator<TvSeriesAiringTodayBloc>(),
        ),
        BlocProvider<TvSeriesPopularBloc>(
          create: (context) => di.locator<TvSeriesPopularBloc>(),
        ),
        BlocProvider<TvSeriesTopRatedBloc>(
          create: (context) => di.locator<TvSeriesTopRatedBloc>(),
        ),

        BlocProvider<WatchlistTvSeriesBloc>(
          create: (context) => di.locator<WatchlistTvSeriesBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: const HomeMoviePage(),
        navigatorObservers: [
          routeObserver,
          FirebaseAnalyticsObserver(
            analytics: FirebaseAnalyticsHelper.instance.firebaseAnalytics,
          ),
        ],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => const HomeMoviePage());

            // movies
            case kRouteNamePopularMovies:
              return CupertinoPageRoute(
                  builder: (_) => const PopularMoviesPage());
            case kRouteNameTopRatedMovies:
              return CupertinoPageRoute(
                  builder: (_) => const TopRatedMoviesPage());
            case kRouteNameMoviesDetail:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MoviesDetailPage(id: id),
                settings: settings,
              );
            case kRouteNameSearchMovies:
              return CupertinoPageRoute(
                  builder: (_) => const SearchMoviesPage());
            case kRouteNameWatchlistMovies:
              return MaterialPageRoute(
                  builder: (_) => const WatchlistMoviesPage());

            // tv series
            case kRouteNameAiringTodayTvSeries:
              return CupertinoPageRoute(
                builder: (_) => const AiringTodayTvSeriesPage(),
              );
            case kRouteNamePopularTvSeries:
              return CupertinoPageRoute(
                  builder: (_) => const PopularTvSeriesPage());
            case kRouteNameTopRatedTvSeries:
              return CupertinoPageRoute(
                  builder: (_) => const TopRatedTvSeriesPage());
            case kRouteNameTvSeriesDetail:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvSeriesDetailPage(id: id),
                settings: settings,
              );
            case kRouteNameSearchTvSeries:
              return CupertinoPageRoute(
                  builder: (_) => const SearchTvSeriesPage());
            case kRouteNameWatchlistTvSeries:
              return MaterialPageRoute(
                  builder: (_) => const WatchlistTvSeriesPage());

            case AboutPage.routeName:
              return MaterialPageRoute(builder: (_) => const AboutPage());
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
