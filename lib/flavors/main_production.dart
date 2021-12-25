import 'package:core/app/base_app_config.dart';
import 'package:core/app/base_core_app.dart';
import 'package:core/controllers/app_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put<AppController>(AppController()).init(Environment.dev);
  setupStatusBar();
  runApp(BaseCoreApp());
}
