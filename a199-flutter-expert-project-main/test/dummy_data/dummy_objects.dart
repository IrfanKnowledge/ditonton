import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/tv_series/tv_series_detail_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_response_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_season_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_table.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/entities/tv_series_season.dart';

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
  mediaType: null,
);

final tTvSeriesModelList = <TvSeriesModel>[tTvSeriesModel];

final tTvSeriesDetail = TvSeriesDetail(
  adult: false,
  backdropPath: "/aizbHLcKVWvJ7jxkflJzTu5Z8GE.jpg",
  firstAirDate: DateTime.parse('2018-08-27'),
  genres: [
    Genre(id: 10766, name: "Soap"),
  ],
  homepage: "https://www.france.tv/france-2/un-si-grand-soleil/",
  id: 81329,
  inProduction: true,
  lastAirDate: DateTime.parse('2024-11-08'),
  name: 'Chronicles of the Sun',
  numberOfEpisodes: 1518,
  numberOfSeasons: 6,
  originalLanguage: 'fr',
  originalName: 'Un si grand soleil',
  overview:
      'Claire is surprised when she gets arrested for the murder of her childhood friend after she returns to Montpellier.',
  popularity: 1289.683,
  posterPath: '/t6jVlbPMtZOJoAOfeoR4yQmnjXM.jpg',
  seasons: [
    TvSeriesSeason(
      airDate: DateTime.parse('2018-08-27'),
      episodeCount: 260,
      id: 107210,
      name: "Season 1",
      overview: '',
      posterPath: "/sHmHhDZgxwj8x63T1p8s9x7Uo2t.jpg",
      seasonNumber: 1,
      voteAverage: 5,
    ),
    TvSeriesSeason(
      airDate: DateTime.parse('2019-08-26'),
      episodeCount: 210,
      id: 134469,
      name: "Season 2",
      overview: "",
      posterPath: "/2VH89jvgAKgVYat5zOXN5c5wZWP.jpg",
      seasonNumber: 2,
      voteAverage: 0,
    ),
  ],
  status: 'Returning Series',
  tagline: '',
  type: 'Scripted',
  voteAverage: 7,
  voteCount: 107,
);

final tTvSeriesDetailModel = TvSeriesDetailModel(
  adult: false,
  backdropPath: "/aizbHLcKVWvJ7jxkflJzTu5Z8GE.jpg",
  firstAirDate: DateTime.parse('2018-08-27'),
  genres: [
    GenreModel(id: 10766, name: "Soap"),
  ],
  homepage: "https://www.france.tv/france-2/un-si-grand-soleil/",
  id: 81329,
  inProduction: true,
  lastAirDate: DateTime.parse('2024-11-08'),
  name: 'Chronicles of the Sun',
  numberOfEpisodes: 1518,
  numberOfSeasons: 6,
  originalLanguage: 'fr',
  originalName: 'Un si grand soleil',
  overview:
      'Claire is surprised when she gets arrested for the murder of her childhood friend after she returns to Montpellier.',
  popularity: 1289.683,
  posterPath: '/t6jVlbPMtZOJoAOfeoR4yQmnjXM.jpg',
  seasons: [
    TvSeriesSeasonModel(
      airDate: DateTime.parse('2018-08-27'),
      episodeCount: 260,
      id: 107210,
      name: "Season 1",
      overview: '',
      posterPath: "/sHmHhDZgxwj8x63T1p8s9x7Uo2t.jpg",
      seasonNumber: 1,
      voteAverage: 5,
    ),
    TvSeriesSeasonModel(
      airDate: DateTime.parse('2019-08-26'),
      episodeCount: 210,
      id: 134469,
      name: "Season 2",
      overview: "",
      posterPath: "/2VH89jvgAKgVYat5zOXN5c5wZWP.jpg",
      seasonNumber: 2,
      voteAverage: 0,
    ),
  ],
  status: 'Returning Series',
  tagline: '',
  type: 'Scripted',
  voteAverage: 7,
  voteCount: 107,
);

final tTvSeriesDetailRecommendation = TvSeries.required(
  backdropPath: "/foGkPxpw9h8zln81j63mix5B7m8.jpg",
  id: 71912,
  name: "The Witcher",
  originalName: "The Witcher",
  overview:
      "Geralt of Rivia, a mutated monster-hunter for hire, journeys toward his destiny in a turbulent world where people often prove more wicked than beasts.",
  posterPath: "/cZ0d3rtvXPVvuiX22sP79K3Hmjz.jpg",
  mediaType: "tv",
  adult: false,
  originalLanguage: "en",
  genreIds: const [
    10765,
    18,
    10759,
  ],
  popularity: 178.233,
  firstAirDate: DateTime.parse("2019-12-20"),
  voteAverage: 8.058,
  voteCount: 5822,
  originCountry: const [
    "US",
  ],
);

final tTvSeriesDetailRecommendationList = <TvSeries>[
  tTvSeriesDetailRecommendation
];

final tTvSeriesDetailRecommendationModel = TvSeriesModel(
  backdropPath: "/foGkPxpw9h8zln81j63mix5B7m8.jpg",
  id: 71912,
  name: "The Witcher",
  originalName: "The Witcher",
  overview:
      "Geralt of Rivia, a mutated monster-hunter for hire, journeys toward his destiny in a turbulent world where people often prove more wicked than beasts.",
  posterPath: "/cZ0d3rtvXPVvuiX22sP79K3Hmjz.jpg",
  mediaType: "tv",
  adult: false,
  originalLanguage: "en",
  genreIds: const [
    10765,
    18,
    10759,
  ],
  popularity: 178.233,
  firstAirDate: DateTime.parse("2019-12-20"),
  voteAverage: 8.058,
  voteCount: 5822,
  originCountry: const [
    "US",
  ],
);

final tTvSeriesDetailRecommendationModelList = <TvSeriesModel>[
  tTvSeriesDetailRecommendationModel
];

final tTvSeriesSearched = TvSeries.required(
  adult: false,
  backdropPath: "/fxISKAY8c2xYXt2CFLjUU2bEx8n.jpg",
  genreIds: const [16, 10759, 10765],
  id: 97617,
  originCountry: const ["JP"],
  originalLanguage: "ja",
  originalName: "魔王学院の不適合者 ～史上最強の魔王の始祖、転生して子孫たちの学校へ通う～",
  overview:
      "Anos Voldigord was a tyrannical Demon King that eradicated humans, spirits, and even the gods, but became bored of eternal warfare and reincarnated with dreams of a peaceful world. However, what awaited him in reincarnation after 2000 years were descendants who became too weak after being accustomed to peace, and all sorts of magic that deteriorated to the extreme. Anos enters Demon King Academy that gathers and educates those who are viewed as the reincarnation of the Demon King, but the academy could not see through his true powers and ends up branding him as a misfit.",
  popularity: 114.919,
  posterPath: "/6VjUfaGkt3DJPLlNmnm1ALEhSfv.jpg",
  firstAirDate: DateTime.parse("2020-07-04"),
  name: "The Misfit of Demon King Academy",
  voteAverage: 8.5,
  voteCount: 776,
  mediaType: null,
);

final tTvSeriesSearchedList = <TvSeries>[tTvSeriesSearched];

final tTvSeriesSearchedModel = TvSeriesModel(
  adult: false,
  backdropPath: "/fxISKAY8c2xYXt2CFLjUU2bEx8n.jpg",
  genreIds: const [16, 10759, 10765],
  id: 97617,
  originCountry: const ["JP"],
  originalLanguage: "ja",
  originalName: "魔王学院の不適合者 ～史上最強の魔王の始祖、転生して子孫たちの学校へ通う～",
  overview:
      "Anos Voldigord was a tyrannical Demon King that eradicated humans, spirits, and even the gods, but became bored of eternal warfare and reincarnated with dreams of a peaceful world. However, what awaited him in reincarnation after 2000 years were descendants who became too weak after being accustomed to peace, and all sorts of magic that deteriorated to the extreme. Anos enters Demon King Academy that gathers and educates those who are viewed as the reincarnation of the Demon King, but the academy could not see through his true powers and ends up branding him as a misfit.",
  popularity: 114.919,
  posterPath: "/6VjUfaGkt3DJPLlNmnm1ALEhSfv.jpg",
  firstAirDate: DateTime.parse("2020-07-04"),
  name: "The Misfit of Demon King Academy",
  voteAverage: 8.5,
  voteCount: 776,
  mediaType: null,
);

final tTvSeriesSearchedModelList = <TvSeriesModel>[tTvSeriesSearchedModel];

final tTvSeriesFromTable = TvSeries.watchlist(
  id: 81329,
  overview: "Claire is surprised when she gets arrested for the murder of her childhood friend after she returns to Montpellier.",
  posterPath: "/t6jVlbPMtZOJoAOfeoR4yQmnjXM.jpg",
  name: "Chronicles of the Sun",
);

final tTvSeriesFromTableList = <TvSeries>[tTvSeriesFromTable];

const tTvSeriesTable = TvSeriesTable(
  id: 81329,
  title: "Chronicles of the Sun",
  posterPath: "/t6jVlbPMtZOJoAOfeoR4yQmnjXM.jpg",
  overview:
      "Claire is surprised when she gets arrested for the murder of her childhood friend after she returns to Montpellier.",
);

final tTvSeriesTableList = <TvSeriesTable>[tTvSeriesTable];

final tTvSeriesMap = {
  'id': 81329,
  'overview': 'Claire is surprised when she gets arrested for the murder of her childhood friend after she returns to Montpellier.',
  'posterPath': '/t6jVlbPMtZOJoAOfeoR4yQmnjXM.jpg',
  'title': 'Chronicles of the Sun',
};

final tTvSeriesMapList = <Map<String, dynamic>>[tTvSeriesMap];


