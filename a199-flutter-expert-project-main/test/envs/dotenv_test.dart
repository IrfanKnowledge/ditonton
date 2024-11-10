import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'dotenv',
    () {
      setUp(
        () {
          if (kDebugMode) {
            print(Directory.current.toString());
          }
          dotenv.testLoad(
            fileInput: File('assets/envs/key.env').readAsStringSync(),
          ); // mergeWith: Platform.environment
        },
      );

      test(
        'when .env is loaded, we should be able to get the .env variables',
        () {
          expect(dotenv.env.containsKey('API_KEY_TMDB'), true);
        },
      );

      test(
        'when .env is loaded, the .env variables should be not empty',
        () {
          expect(dotenv.get('API_KEY_TMDB', fallback: "").isNotEmpty, true);
        },
      );
    },
  );
}
