import 'package:ditonton/common/constants.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/datasources/movie_local_data_source.dart';
import 'package:ditonton/data/datasources/movie_remote_data_source.dart';
import 'package:ditonton/data/datasources/tv_series_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_series_remote_data_source.dart';
import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:ditonton/data/repositories/tv_series_repository_impl.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/get_tv_series_airing_today.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail_recommendtaions.dart';
import 'package:ditonton/domain/usecases/get_tv_series_popular.dart';
import 'package:ditonton/domain/usecases/get_tv_series_searched.dart';
import 'package:ditonton/domain/usecases/get_tv_series_top_rated.dart';
import 'package:ditonton/domain/usecases/get_watchedlist_tv_series.dart';
import 'package:ditonton/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
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
import 'package:ditonton/presentation/bloc/tv_series_top_rated_bloc/tv_series_top_rated_bloc.dart';
import 'package:ditonton/presentation/bloc/watchlist_tv_series_bloc/watchlist_tv_series_bloc.dart';
import 'package:ditonton/presentation/provider/movie_detail_notifier.dart';
import 'package:ditonton/presentation/provider/movie_list_notifier.dart';
import 'package:ditonton/presentation/provider/movie_search_notifier.dart';
import 'package:ditonton/presentation/provider/popular_movies_notifier.dart';
import 'package:ditonton/presentation/provider/top_rated_movies_notifier.dart';
import 'package:ditonton/presentation/provider/tv_series_search_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => MovieListNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailNotifier(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieSearchNotifier(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );

  // provider tv series
  locator.registerFactory(
    () => TvSeriesListAiringTodayBloc(
      getTvSeriesAiringTodayUseCase: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesListPopularBloc(
      getTvSeriesPopularUseCase: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesListTopRatedBloc(
      getTvSeriesTopRatedUseCase: locator(),
    ),
  );

  locator.registerFactory(
    () => TvSeriesDetailBloc(
      getTvSeriesDetailUseCase: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesDetailRecommendationBloc(
      getTvSeriesDetailRecommendations: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesDetailLoadWatchlistStatusBloc(
      getWatchlistStatusTvSeriesUseCase: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesDetailAddWatchlistBloc(
      saveWatchlistTvSeriesUseCase: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesDetailRemoveWatchlistBloc(
      removeWatchlistTvSeriesUseCase: locator(),
    ),
  );

  locator.registerFactory(
    () => TvSeriesSearchNotifier(
      getTvSeriesSearchedUseCase: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesAiringTodayBloc(
      getTvSeriesAiringTodayUseCase: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesPopularBloc(
      getTvSeriesPopularUseCase: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesTopRatedBloc(
      getTvSeriesTopRatedUseCase: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistTvSeriesBloc(
      getWatchlistTvSeriesUseCase: locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  // use case tv series
  locator.registerLazySingleton(
    () => GetTvSeriesAiringToday(repository: locator()),
  );
  locator.registerLazySingleton(
    () => GetTvSeriesPopular(repository: locator()),
  );
  locator.registerLazySingleton(
    () => GetTvSeriesTopRated(repository: locator()),
  );
  locator.registerLazySingleton(
    () => GetTvSeriesDetail(repository: locator()),
  );
  locator.registerLazySingleton(
    () => GetTvSeriesDetailRecommendations(repository: locator()),
  );
  locator.registerLazySingleton(
    () => GetTvSeriesSearched(repository: locator()),
  );
  locator.registerLazySingleton(
    () => SaveWatchlistTvSeries(repository: locator()),
  );
  locator.registerLazySingleton(
    () => RemoveWatchlistTvSeries(repository: locator()),
  );
  locator.registerLazySingleton(
    () => GetWatchlistStatusTvSeries(repository: locator()),
  );
  locator.registerLazySingleton(
    () => GetWatchlistTvSeries(repository: locator()),
  );

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TvSeriesRepository>(
    () => TvSeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  // data source tv series
  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
    () => TvSeriesRemoteDataSourceImpl(
      client: locator(),
      apiKey: "api_key=${dotenv.get('API_KEY_TMDB', fallback: "")}",
      baseUrl: kBaseUrl,
    ),
  );
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
    () => TvSeriesLocalDataSourceImpl(
      databaseHelper: locator(),
    ),
  );

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
