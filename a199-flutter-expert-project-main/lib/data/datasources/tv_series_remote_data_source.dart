import 'dart:convert';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/tv_series/tv_series_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/tv_series/tv_series_model.dart';

class TvSeriesRemoteDataSource {
  final http.Client client;
  final String apiKey;
  final String baseUrl;

  TvSeriesRemoteDataSource({
    required this.client,
    required this.apiKey,
    required this.baseUrl,
  });

  Future<List<TvSeriesModel>> getTvSeriesAiringToday() async {
    final uriParse = Uri.parse('$baseUrl/tv/airing_today?$apiKey');
    final response = await client.get(uriParse);

    final is200To299 = response.statusCode >= 200 && response.statusCode < 300;
    if (is200To299) {
      try {
        final dataModel = TvSeriesResponseModel.fromJson(
              json.decode(response.body),
            ).results ??
            [];

        return dataModel;
      } catch (_, __) {
        throw ParsingJsonException();
      }
    } else {
      throw ServerException();
    }
  }

  Future<List<TvSeriesModel>> getTvSeriesPopular() async {
    final uriParse = Uri.parse('$baseUrl/tv/popular?$apiKey');
    final response = await client.get(uriParse);

    final is200To299 = response.statusCode >= 200 && response.statusCode < 300;
    if (is200To299) {
      try {
        final dataModel = TvSeriesResponseModel.fromJson(
              json.decode(response.body),
            ).results ??
            [];

        return dataModel;
      } catch (_, __) {
        throw ParsingJsonException();
      }
    } else {
      throw ServerException();
    }
  }

  Future<List<TvSeriesModel>> getTvSeriesTopRated() async {
    final uriParse = Uri.parse('$baseUrl/tv/top_rated?$apiKey');
    final response = await client.get(uriParse);

    final is200To299 = response.statusCode >= 200 && response.statusCode < 300;
    if (is200To299) {
      try {
        final dataModel = TvSeriesResponseModel.fromJson(
          json.decode(response.body),
        ).results ??
            [];

        return dataModel;
      } catch (_, __) {
        throw ParsingJsonException();
      }
    } else {
      throw ServerException();
    }
  }
}
