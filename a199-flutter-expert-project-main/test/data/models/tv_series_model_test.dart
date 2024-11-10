import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test(
    'should be a subclass of Tv Series Entity',
    () {
      // act
      final result = tTvSeriesModel.toEntity();

      // assert
      expect(result, tTvSeries);
    },
  );
}
