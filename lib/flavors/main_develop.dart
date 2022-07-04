import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../app/base_app_config.dart';
import '../../app/main_app.dart';
import '../../controllers/app_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDi0T8sQB2VWbwO96V2Nlo7GIOiBgjG6I0",
      appId: "1:780905452279:android:ec03a8b8506a77aac2f9f2",
      messagingSenderId: "XXX",
      projectId: "tradein-c9597",
    ),
  );*/
  await Get.put<AppController>(AppController()).init(Environment.dev);
  setupStatusBar();
  // runZonedGuarded(
  //   () {
  //     runApp(TradeInApp());
  //   },
  //   FirebaseCrashlytics.instance.recordError,
  // );
  runApp(TradeInApp());
}
