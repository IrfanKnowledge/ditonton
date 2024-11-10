import 'dart:convert';
import 'dart:io';

import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tv_series_remote_data_source.dart';
import 'package:ditonton/data/models/tv_series/tv_series_response_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

///
/// Remote Data Source [TvSeriesRemoteDataSource], bergantung pada
/// [http.Client] yang melakukan request data melalui API.
///
void main() {
  late String apiKey;
  late String baseUrl;

  late TvSeriesRemoteDataSource tvSeriesRemoteDataSource;
  late MockHttpClient mockHttpClient;

  setUp(
    () {
      dotenv.testLoad(
        fileInput: File('assets/envs/key.env').readAsStringSync(),
      );

      apiKey = "api_key=${dotenv.get('API_KEY_TMDB', fallback: '')}";
      baseUrl = kBaseUrl;

      mockHttpClient = MockHttpClient();
      tvSeriesRemoteDataSource = TvSeriesRemoteDataSource(
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
          uriParse = uriParse = Uri.parse('$baseUrl/tv/airing_today?$apiKey');
        },
      );

      test(
        'should return list of tv series airing today '
        'when the response code is >= 200 and < 300',
        () async {
          final vJson =
              readJson('dummy_data/tv_series_airing_today.json');

          final tTvSeriesModelList = TvSeriesResponseModel.fromJson(
                json.decode(vJson),
              ).results ??
              [];

          // arrange
          when(mockHttpClient.get(uriParse)).thenAnswer(
            (_) async {
              return http.Response(
                vJson,
                200,
              );
            },
          );

          // act
          final result =
              await tvSeriesRemoteDataSource.getTvSeriesAiringToday();

          // assert
          verify(mockHttpClient.get(uriParse));

          // assert
          expect(result, tTvSeriesModelList);
        },
      );

      test(
        'should throw a ServerException when the response code is >= 400',
        () {
          // arrange
          when(mockHttpClient.get(uriParse)).thenAnswer(
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
          verify(mockHttpClient.get(uriParse));

          // assert
          expect(call, throwsA(isA<ServerException>()));
        },
      );

      test(
        'should throw ParsingJsonException '
        'when the response code is >= 200 and < 300,'
        'but have different json structure',
        () {
          // arrange
          when(mockHttpClient.get(uriParse)).thenAnswer(
            (_) async {
              return http.Response(
                '',
                200,
              );
            },
          );

          // act
          final call = tvSeriesRemoteDataSource.getTvSeriesAiringToday();

          // assert
          expect(() => call, throwsA(isA<ParsingJsonException>()));
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
          uriParse = uriParse = Uri.parse('$baseUrl/tv/popular?$apiKey');
        },
      );

      test(
        'should return list of tv series popular '
        'when the response code is >= 200 and < 300',
        () async {
          final vJson =
              readJson('dummy_data/tv_series_popular.json');

          final tTvSeriesModelList = TvSeriesResponseModel.fromJson(
                json.decode(vJson),
              ).results ??
              [];

          // arrange
          when(mockHttpClient.get(uriParse)).thenAnswer(
            (_) async {
              return http.Response(
                vJson,
                200,
              );
            },
          );

          // act
          final result = await tvSeriesRemoteDataSource.getTvSeriesPopular();

          // assert
          verify(mockHttpClient.get(uriParse));

          // assert
          expect(result, tTvSeriesModelList);
        },
      );

      test(
        'should throw a ServerException when the response code is >= 400',
        () {
          // arrange
          when(mockHttpClient.get(uriParse)).thenAnswer(
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
          verify(mockHttpClient.get(uriParse));

          // assert
          expect(call, throwsA(isA<ServerException>()));
        },
      );

      test(
        'should throw ParsingJsonException '
        'when the response code is >= 200 and < 300,'
        'but have different json structure',
        () {
          // arrange
          when(mockHttpClient.get(uriParse)).thenAnswer(
            (_) async {
              return http.Response(
                '',
                200,
              );
            },
          );

          // act
          final call = tvSeriesRemoteDataSource.getTvSeriesPopular();

          // assert
          expect(() => call, throwsA(isA<ParsingJsonException>()));
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
          uriParse = uriParse = Uri.parse('$baseUrl/tv/top_rated?$apiKey');
        },
      );

      test(
        'should return list of tv series top rated '
            'when the response code is >= 200 and < 300',
            () async {
          final vJson =
          readJson('dummy_data/tv_series_top_rated.json');

          final tTvSeriesModelList = TvSeriesResponseModel.fromJson(
            json.decode(vJson),
          ).results ??
              [];

          // arrange
          when(mockHttpClient.get(uriParse)).thenAnswer(
                (_) async {
              return http.Response(
                vJson,
                200,
              );
            },
          );

          // act
          final result = await tvSeriesRemoteDataSource.getTvSeriesTopRated();

          // assert
          verify(mockHttpClient.get(uriParse));

          // assert
          expect(result, tTvSeriesModelList);
        },
      );

      test(
        'should throw a ServerException when the response code is >= 400',
            () {
          // arrange
          when(mockHttpClient.get(uriParse)).thenAnswer(
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
          verify(mockHttpClient.get(uriParse));

          // assert
          expect(call, throwsA(isA<ServerException>()));
        },
      );

      test(
        'should throw ParsingJsonException '
            'when the response code is >= 200 and < 300,'
            'but have different json structure',
            () {
          // arrange
          when(mockHttpClient.get(uriParse)).thenAnswer(
                (_) async {
              return http.Response(
                '',
                200,
              );
            },
          );

          // act
          final call = tvSeriesRemoteDataSource.getTvSeriesTopRated();

          // assert
          expect(() => call, throwsA(isA<ParsingJsonException>()));
        },
      );
    },
  );
}
