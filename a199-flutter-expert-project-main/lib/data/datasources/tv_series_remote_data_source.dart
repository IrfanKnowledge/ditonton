import 'dart:convert';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/tv_series/tv_series_detail_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_response_model.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail_recommendtaions.dart';
import 'package:ditonton/domain/usecases/get_tv_series_searched.dart';
import 'package:http/http.dart' as http;

import '../../domain/usecases/get_tv_series_detail.dart';
import '../models/tv_series/tv_series_model.dart';

abstract class TvSeriesRemoteDataSource {
  Future<List<TvSeriesModel>> getTvSeriesAiringToday();

  Future<List<TvSeriesModel>> getTvSeriesPopular();

  Future<List<TvSeriesModel>> getTvSeriesTopRated();

  Future<TvSeriesDetailModel> getTvSeriesDetail(GetTvSeriesDetailParams params);

  Future<List<TvSeriesModel>> getTvSeriesDetailRecommendations(
      GetTvSeriesDetailRecommendationsParams params);

  Future<List<TvSeriesModel>> getTvSeriesSearched(
      GetTvSeriesSearchedParams params);
}

class TvSeriesRemoteDataSourceImpl implements TvSeriesRemoteDataSource {
  final http.Client client;
  final String apiKey;
  final String baseUrl;
  late final Map<String, String> headers;

  TvSeriesRemoteDataSourceImpl({
    required this.client,
    required this.apiKey,
    required this.baseUrl,
  }) {
    headers = {
      "content-type": "application/json; charset=utf-8",
    };
  }

  @override
  Future<List<TvSeriesModel>> getTvSeriesAiringToday() async {
    final uriParse = Uri.parse('$baseUrl/tv/airing_today?$apiKey');
    final response = await client.get(
      uriParse,
      headers: headers,
    );

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

  @override
  Future<List<TvSeriesModel>> getTvSeriesPopular() async {
    final uriParse = Uri.parse('$baseUrl/tv/popular?$apiKey');
    final response = await client.get(
      uriParse,
      headers: headers,
    );

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

  @override
  Future<List<TvSeriesModel>> getTvSeriesTopRated() async {
    final uriParse = Uri.parse('$baseUrl/tv/top_rated?$apiKey');
    final response = await client.get(
      uriParse,
      headers: headers,
    );

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

  @override
  Future<TvSeriesDetailModel> getTvSeriesDetail(
      GetTvSeriesDetailParams params) async {
    final seriesId = params.id;
    final uriParse = Uri.parse('$baseUrl/tv/$seriesId?$apiKey');
    final response = await client.get(
      uriParse,
      headers: headers,
    );

    final is200To299 = response.statusCode >= 200 && response.statusCode < 300;
    if (is200To299) {
      try {
        final dataModel = TvSeriesDetailModel.fromJson(
          json.decode(response.body),
        );

        return dataModel;
      } catch (_, __) {
        throw ParsingJsonException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> getTvSeriesDetailRecommendations(
      GetTvSeriesDetailRecommendationsParams params) async {
    final seriesId = params.id;
    final uriParse = Uri.parse('$baseUrl/tv/$seriesId/recommendations?$apiKey');
    final response = await client.get(
      uriParse,
      headers: headers,
    );

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

  @override
  Future<List<TvSeriesModel>> getTvSeriesSearched(
      GetTvSeriesSearchedParams params) async {
    final name = params.name;
    final uriParse = Uri.parse('$baseUrl/search/tv?$apiKey&query=$name');

    final response = await client.get(
      uriParse,
      headers: {
        "content-type": "application/json; charset=utf-8",
      },
    );

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
