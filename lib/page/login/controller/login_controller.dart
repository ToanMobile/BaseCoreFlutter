import 'package:core/controllers/base/base_controller.dart';
import 'package:core/data/repositories/common_repository.dart';
import 'package:core/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final commonRepository = Get.find<CommonRepository>();
  final userRepository = Get.find<UserRepository>();
}
