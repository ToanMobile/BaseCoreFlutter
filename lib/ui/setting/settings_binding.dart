import 'package:get/get.dart';

import 'settings_controller.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController());
  }
}
