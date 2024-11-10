import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_response_model.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/tv_series.dart';

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

final testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

final tTvSeries = TvSeries(
  adult: false,
  backdropPath: "/aizbHLcKVWvJ7jxkflJzTu5Z8GE.jpg",
  genreIds: [10766],
  id: 81329,
  originCountry: ["FR"],
  originalLanguage: "fr",
  originalName: "Un si grand soleil",
  overview:
      "Claire is surprised when she gets arrested for the murder of her childhood friend after she returns to Montpellier.",
  popularity: 3468.497,
  posterPath: "/t6jVlbPMtZOJoAOfeoR4yQmnjXM.jpg",
  firstAirDate: DateTime.parse("2018-08-27"),
  name: "Chronicles of the Sun",
  voteAverage: 7.029,
  voteCount: 104,
);

final tTvSeriesList = <TvSeries>[tTvSeries];

final tTvSeriesModel = TvSeriesModel(
  adult: false,
  backdropPath: "/aizbHLcKVWvJ7jxkflJzTu5Z8GE.jpg",
  genreIds: [10766],
  id: 81329,
  originCountry: ["FR"],
  originalLanguage: "fr",
  originalName: "Un si grand soleil",
  overview:
  "Claire is surprised when she gets arrested for the murder of her childhood friend after she returns to Montpellier.",
  popularity: 3468.497,
  posterPath: "/t6jVlbPMtZOJoAOfeoR4yQmnjXM.jpg",
  firstAirDate: DateTime.parse("2018-08-27"),
  name: "Chronicles of the Sun",
  voteAverage: 7.029,
  voteCount: 104,
);

final tTvSeriesModelList = <TvSeriesModel>[tTvSeriesModel];

final tTvSeriesResponseModel = TvSeriesResponseModel(
  page: 1,
  results: <TvSeriesModel>[tTvSeriesModel],
  totalPages: 20,
  totalResults: 399,
);
