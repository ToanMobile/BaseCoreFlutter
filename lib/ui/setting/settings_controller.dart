import 'package:get/get.dart';

import '../../../controllers/base/base_controller.dart';
import '../../../data/repositories/common_repository.dart';
import '../../../data/repositories/home_repository.dart';
import '../../../data/repositories/user_repository.dart';

class SettingsController extends BaseController {
  final homeRepository = Get.find<HomeRepository>();
  final commonRepository = Get.find<CommonRepository>();
  final userRepository = Get.find<UserRepository>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
