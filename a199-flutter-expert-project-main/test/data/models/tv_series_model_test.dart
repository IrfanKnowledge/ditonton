import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  group(
    'toEntity',
    () {
      test(
        'should be a subclass of Tv Series Entity without media type',
            () {
          // act
          final result = tTvSeriesModel.toEntity();

          // assert
          expect(result, tTvSeries);
        },
      );

      test(
        'should be a subclass of Tv Series Entity with media type',
            () {
          // act
          final result = tTvSeriesDetailRecommendationModel.toEntity();

          // assert
          expect(result, tTvSeriesDetailRecommendation);
        },
      );
    },
  );
}
