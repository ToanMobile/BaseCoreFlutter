import 'package:get/get.dart';

import '../setting/settings_controller.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(SettingsController());
  }
}
