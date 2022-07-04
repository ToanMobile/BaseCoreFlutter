import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../data/api/services/common_service.dart';
import '../data/api/services/home_service.dart';
import '../data/api/services/request_service.dart';
import '../data/api/services/user_service.dart';
import '../data/repositories/common_repository.dart';
import '../data/repositories/home_repository.dart';
import '../data/repositories/request_repository.dart';
import '../data/repositories/user_repository.dart';
import '../share/libraries/photo_manager/photo_provider.dart';
import '../share/util/permission_handle_manager.dart';
import '../ui/widgets/appbar/custom_user_appbar_controller.dart';

enum Environment { dev, prod }

setupLocator() async {
  //Setup service
  Get.put(CommonService());
  Get.put(RequestService());
  Get.put(UserService());
  Get.put(HomeService());

  //Setup repository
  Get.put(CommonRepository());
  Get.put(RequestRepository());
  Get.put(UserRepository());
  Get.put(HomeRepository());

  Get.put(PhotoProvider());
  Get.put(AssetPathProvider());
  Get.put(PermissionHandleManager());
  Get.lazyPut<CustomUserAppbarController>(() => CustomUserAppbarController(), fenix: true);
}

setupStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}
