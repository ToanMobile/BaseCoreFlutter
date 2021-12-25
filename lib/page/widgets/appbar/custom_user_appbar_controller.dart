import 'package:core/controllers/app_controller.dart';
import 'package:core/controllers/base/base_controller.dart';
import 'package:core/data/api/models/user_info.dart';
import 'package:get/get.dart';

class CustomUserAppbarController extends BaseController {
  UserInfo? user;

  @override
  void onInit() {
    super.onInit();
    user = Get.find<AppController>().user;
    print(user);
  }

  String get userName => user?.lastName ?? "Đăng nhập";
}
