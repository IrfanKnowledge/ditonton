import 'dart:convert';

import 'package:ditonton/data/models/tv_series/tv_series_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../json_reader.dart';

void main() {
  group(
    "fromJson",
    () {
      test(
        'should return a valid model from JSON',
        () async {
          // arrange
          final Map<String, dynamic> jsonMap = json.decode(
            readJson('dummy_data/tv_series_airing_today.json'),
          );

          // act
          final result = TvSeriesResponseModel.fromJson(jsonMap);

          // assert
          expect(result, tTvSeriesResponseModel);
        },
      );
    },
  );
}
