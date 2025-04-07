import 'package:ditonton/firebase_options.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:ditonton/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'robot/evalutate_robot.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await dotenv.load(fileName: "assets/envs/key.env");

  di.init();

  testWidgets(
    'integrate test',
    (tester) async {
      final evaluateRobot = EvaluateRobot(tester);

      await evaluateRobot.loadUI(const MyApp());
      await tester.pumpAndSettle(const Duration(milliseconds: 1500));

      await evaluateRobot.clickItemOnMoviePopularList();
      await tester.pumpAndSettle(const Duration(milliseconds: 1500));

      await evaluateRobot.backFromMovieDetailPage();
      await tester.pumpAndSettle(const Duration(milliseconds: 1500));

      await evaluateRobot.clickDrawerButtonOnHome();
      await tester.pumpAndSettle(const Duration(milliseconds: 1500));

      await evaluateRobot.clickListTileTvSeriesOnDrawer();
      await tester.pumpAndSettle(const Duration(milliseconds: 1500));

      await evaluateRobot.clickItemOnTvSeriesPopularList();
      await tester.pumpAndSettle(const Duration(milliseconds: 1500));

      await evaluateRobot.backFromTvSeriesDetailPage();
      await tester.pumpAndSettle(const Duration(milliseconds: 1500));
    },
  );
}
