import 'package:get/get.dart';

import '../../controllers/base/base_controller.dart';
import '../../data/repositories/common_repository.dart';
import '../../data/repositories/home_repository.dart';
import '../../data/repositories/user_repository.dart';

class HomeController extends BaseController {
  final homeRepository = Get.find<HomeRepository>();
  final commonRepository = Get.find<CommonRepository>();
  final userRepository = Get.find<UserRepository>();
  RxInt pageIndex = 0.obs;

  void onTabChanged(int index) {
    pageIndex.value = index;
  }
}
