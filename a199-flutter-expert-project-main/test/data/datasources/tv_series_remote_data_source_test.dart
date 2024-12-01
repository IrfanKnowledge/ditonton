import 'dart:convert';
import 'dart:io';

import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tv_series_remote_data_source.dart';
import 'package:ditonton/data/models/tv_series/tv_series_detail_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_response_model.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail_recommendtaions.dart';
import 'package:ditonton/domain/usecases/get_tv_series_searched.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

///
/// Remote Data Source [TvSeriesRemoteDataSourceImpl], bergantung pada
/// [http.Client] yang melakukan request data melalui API.
///
void main() {
  late String apiKey;
  late String baseUrl;
  late Map<String, String> headers;

  late TvSeriesRemoteDataSourceImpl tvSeriesRemoteDataSource;
  late MockHttpClient mockHttpClient;

  setUp(
    () {
      dotenv.testLoad(
        fileInput: File('assets/envs/key.env').readAsStringSync(),
      );

      apiKey = "api_key=${dotenv.get('API_KEY_TMDB', fallback: '')}";
      baseUrl = kBaseUrl;
      headers = {
        "content-type": "application/json; charset=utf-8",
      };

      mockHttpClient = MockHttpClient();
      tvSeriesRemoteDataSource = TvSeriesRemoteDataSourceImpl(
        client: mockHttpClient,
        apiKey: apiKey,
        baseUrl: baseUrl,
      );
    },
  );

  group(
    'apiKey and baseUrl',
    () {
      test(
        'should return not empty apiKey dan baseUrl',
        () {
          // assert
          expect(apiKey.isNotEmpty, true);
          expect(baseUrl.isNotEmpty, true);
        },
      );
    },
  );

  group(
    'Tv Series Airing Today',
    () {
      late Uri uriParse;

      setUp(
        () {
          uriParse = Uri.parse('$baseUrl/tv/airing_today?$apiKey');
        },
      );

      test(
        'should return list of tv series airing today '
        'when the response code is >= 200 and < 300',
        () async {
          final vJson = readJson('dummy_data/tv_series_airing_today.json');

          final tTvSeriesModelList = TvSeriesResponseModel.fromJson(
                json.decode(vJson),
              ).results ??
              [];

          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                vJson,
                200,
                headers: headers,
              );
            },
          );

          // act
          final result =
              await tvSeriesRemoteDataSource.getTvSeriesAiringToday();

          // assert
          verify(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          );

          // assert
          expect(result, tTvSeriesModelList);
        },
      );

      test(
        'should throw a ServerException when the response code is >= 400',
        () {
          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                'Not Found',
                404,
              );
            },
          );

          // act
          final call = tvSeriesRemoteDataSource.getTvSeriesAiringToday();

          // assert
          verify(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          );

          // assert
          expect(
            call,
            throwsA(
              isA<ServerException>(),
            ),
          );
        },
      );

      test(
        'should throw ParsingJsonException '
        'when the response code is >= 200 and < 300,'
        'but have different json structure',
        () {
          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                '',
                200,
                headers: headers,
              );
            },
          );

          // act
          final call = tvSeriesRemoteDataSource.getTvSeriesAiringToday();

          // assert
          expect(
            () => call,
            throwsA(
              isA<ParsingJsonException>(),
            ),
          );
        },
      );
    },
  );

  group(
    'Tv Series Popular',
    () {
      late Uri uriParse;

      setUp(
        () {
          uriParse = Uri.parse('$baseUrl/tv/popular?$apiKey');
        },
      );

      test(
        'should return list of tv series popular '
        'when the response code is >= 200 and < 300',
        () async {
          final vJson = readJson('dummy_data/tv_series_popular.json');

          final tTvSeriesModelList = TvSeriesResponseModel.fromJson(
                json.decode(vJson),
              ).results ??
              [];

          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                vJson,
                200,
                headers: headers,
              );
            },
          );

          // act
          final result = await tvSeriesRemoteDataSource.getTvSeriesPopular();

          // assert
          verify(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          );

          // assert
          expect(result, tTvSeriesModelList);
        },
      );

      test(
        'should throw a ServerException when the response code is >= 400',
        () {
          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                'Not Found',
                404,
              );
            },
          );

          // act
          final call = tvSeriesRemoteDataSource.getTvSeriesPopular();

          // assert
          verify(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          );

          // assert
          expect(
            call,
            throwsA(
              isA<ServerException>(),
            ),
          );
        },
      );

      test(
        'should throw ParsingJsonException '
        'when the response code is >= 200 and < 300,'
        'but have different json structure',
        () {
          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                '',
                200,
                headers: headers,
              );
            },
          );

          // act
          final call = tvSeriesRemoteDataSource.getTvSeriesPopular();

          // assert
          expect(
            () => call,
            throwsA(
              isA<ParsingJsonException>(),
            ),
          );
        },
      );
    },
  );

  group(
    'Tv Series Top Rated',
    () {
      late Uri uriParse;

      setUp(
        () {
          uriParse = Uri.parse('$baseUrl/tv/top_rated?$apiKey');
        },
      );

      test(
        'should return list of tv series top rated '
        'when the response code is >= 200 and < 300',
        () async {
          final vJson = readJson('dummy_data/tv_series_top_rated.json');

          final tTvSeriesModelList = TvSeriesResponseModel.fromJson(
                json.decode(vJson),
              ).results ??
              [];

          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                vJson,
                200,
                headers: headers,
              );
            },
          );

          // act
          final result = await tvSeriesRemoteDataSource.getTvSeriesTopRated();

          // assert
          verify(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          );

          // assert
          expect(result, tTvSeriesModelList);
        },
      );

      test(
        'should throw a ServerException when the response code is >= 400',
        () {
          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                'Not Found',
                404,
              );
            },
          );

          // act
          final call = tvSeriesRemoteDataSource.getTvSeriesTopRated();

          // assert
          verify(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          );

          // assert
          expect(
            call,
            throwsA(
              isA<ServerException>(),
            ),
          );
        },
      );

      test(
        'should throw ParsingJsonException '
        'when the response code is >= 200 and < 300,'
        'but have different json structure',
        () {
          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                '',
                200,
                headers: headers,
              );
            },
          );

          // act
          final call = tvSeriesRemoteDataSource.getTvSeriesTopRated();

          // assert
          expect(
            () => call,
            throwsA(
              isA<ParsingJsonException>(),
            ),
          );
        },
      );
    },
  );

  group(
    'Tv Series Detail',
    () {
      late Uri uriParse;
      late GetTvSeriesDetailParams params;

      setUp(
        () {
          uriParse =
              Uri.parse('$baseUrl/tv/${tTvSeriesDetailModel.id}?$apiKey');
          params = GetTvSeriesDetailParams(id: tTvSeriesDetailModel.id!);
        },
      );

      test(
        'should return tv series detail '
        'when the response code is >= 200 and < 300',
        () async {
          final vJson = readJson('dummy_data/tv_series_detail.json');

          final tTvSeriesDetailModel = TvSeriesDetailModel.fromJson(
            json.decode(vJson),
          );

          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (realInvocation) async {
              return http.Response(
                vJson,
                200,
                headers: headers,
              );
            },
          );

          // act
          final result = await tvSeriesRemoteDataSource.getTvSeriesDetail(
            params,
          );

          // assert
          verify(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          );

          // assert
          expect(result, tTvSeriesDetailModel);
        },
      );

      test(
        'should throw a ServerException when the response code is >= 400',
        () {
          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                'Not Found',
                404,
              );
            },
          );

          // act
          final call = tvSeriesRemoteDataSource.getTvSeriesDetail(
            params,
          );

          // assert
          verify(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          );

          // assert
          expect(
            call,
            throwsA(
              isA<ServerException>(),
            ),
          );
        },
      );

      test(
        'should throw ParsingJsonException '
        'when the response code is >= 200 and < 300,'
        'but have different json structure',
        () {
          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                '',
                200,
                headers: headers,
              );
            },
          );

          // act
          final call = tvSeriesRemoteDataSource.getTvSeriesDetail(
            params,
          );

          // assert
          verify(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          );

          // assert
          expect(
            call,
            throwsA(
              isA<ParsingJsonException>(),
            ),
          );
        },
      );
    },
  );

  group(
    'Tv Series Detail Recommendtaions',
    () {
      late Uri uriParse;
      late GetTvSeriesDetailRecommendationsParams params;

      setUp(
        () {
          uriParse = Uri.parse(
              '$baseUrl/tv/${tTvSeriesDetailRecommendationModel.id!}/recommendations?$apiKey');
          params = GetTvSeriesDetailRecommendationsParams(
            id: tTvSeriesDetailRecommendationModel.id!,
          );
        },
      );

      test(
        'should return tv series detail recommendations'
        'when the response code is >= 200 and < 300',
        () async {
          final vJson = readJson('dummy_data/tv_series_recommendations.json');

          final tTvSeriesDetailRecommendationModelList =
              TvSeriesResponseModel.fromJson(
                    json.decode(vJson),
                  ).results ??
                  [];

          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                vJson,
                200,
                headers: headers,
              );
            },
          );

          // act
          final result = await tvSeriesRemoteDataSource
              .getTvSeriesDetailRecommendations(params);

          // assert
          verify(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          );

          // assert
          expect(result, tTvSeriesDetailRecommendationModelList);
        },
      );

      test(
        'should throw a ServerException when the response code is >= 400',
        () {
          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                'Not Found',
                404,
              );
            },
          );

          // act
          final call =
              tvSeriesRemoteDataSource.getTvSeriesDetailRecommendations(params);

          // assert
          verify(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          );

          // assert
          expect(
            call,
            throwsA(
              isA<ServerException>(),
            ),
          );
        },
      );

      test(
        'should throw ParsingJsonException '
        'when the response code is >= 200 and < 300,'
        'but have different json structure',
        () {
          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                '',
                200,
                headers: headers,
              );
            },
          );

          // act
          final call =
              tvSeriesRemoteDataSource.getTvSeriesDetailRecommendations(params);

          // assert
          verify(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          );

          // assert
          expect(
            call,
            throwsA(
              isA<ParsingJsonException>(),
            ),
          );
        },
      );
    },
  );

  group(
    'Tv Series Searched',
    () {
      late Uri uriParse;
      late GetTvSeriesSearchedParams params;

      setUp(
        () {
          params = GetTvSeriesSearchedParams(
            name: tTvSeriesSearchedModel.name!,
          );
          uriParse =
              Uri.parse('$baseUrl/search/tv?$apiKey&query=${params.name}');
        },
      );

      test(
        'should return tv series searched'
        'when the response code is >= 200 and < 300',
        () async {
          final vJson = readJson('dummy_data/tv_series_search.json');

          final tTvSeriesSearchedModelList = TvSeriesResponseModel.fromJson(
                json.decode(vJson),
              ).results ??
              [];

          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                vJson,
                200,
                headers: headers,
              );
            },
          );

          // act
          final result =
              await tvSeriesRemoteDataSource.getTvSeriesSearched(params);

          // assert
          verify(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          );

          // assert
          expect(result, tTvSeriesSearchedModelList);
        },
      );

      test(
        'should throw a ServerException when the response code is >= 400',
        () {
          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                'Not Found',
                404,
              );
            },
          );

          // act
          final call = tvSeriesRemoteDataSource.getTvSeriesSearched(params);

          // assert
          verify(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          );

          // assert
          expect(
            call,
            throwsA(
              isA<ServerException>(),
            ),
          );
        },
      );

      test(
        'should throw ParsingJsonException '
        'when the response code is >= 200 and < 300,'
        'but have different json structure',
        () {
          // arrange
          when(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          ).thenAnswer(
            (_) async {
              return http.Response(
                '',
                200,
                headers: headers,
              );
            },
          );

          // act
          final call =
              tvSeriesRemoteDataSource.getTvSeriesSearched(params);

          // assert
          verify(
            mockHttpClient.get(
              uriParse,
              headers: headers,
            ),
          );

          // assert
          expect(
            call,
            throwsA(
              isA<ParsingJsonException>(),
            ),
          );
        },
      );
    },
  );
}
