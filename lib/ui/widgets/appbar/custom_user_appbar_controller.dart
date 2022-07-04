import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import '../../../controllers/base/base_controller.dart';
import '../../../data/api/models/response/login/user_entity.dart';

class CustomUserAppbarController extends BaseController {
  UserEntity? user;

  @override
  void onInit() {
    super.onInit();
    user = Get.find<AppController>().user;
    print(user);
  }

  String get userName => user?.lastName ?? "Đăng nhập";
}
