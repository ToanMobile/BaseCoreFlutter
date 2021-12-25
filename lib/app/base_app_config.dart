import 'package:core/data/api/services/calendar_service.dart';
import 'package:core/data/api/services/common_service.dart';
import 'package:core/data/api/services/favourite_service.dart';
import 'package:core/data/api/services/home_service.dart';
import 'package:core/data/api/services/user_service.dart';
import 'package:core/data/repositories/calendar_repository.dart';
import 'package:core/data/repositories/common_repository.dart';
import 'package:core/data/repositories/favourite_repository.dart';
import 'package:core/data/repositories/filter_repository.dart';
import 'package:core/data/repositories/home_repository.dart';
import 'package:core/data/repositories/user_repository.dart';
import 'package:core/page/widgets/appbar/custom_user_appbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared/libraries/photo_manager/photo_provider.dart';
import 'package:shared/services/network_manager_service.dart';
import 'package:shared/util/permission_handle_manager.dart';

enum Environment { dev, prod }

setupLocator() async {
  //Setup service
  Get.put(CommonService());
  Get.put(UserService());
  Get.put(HomeService());
  Get.put(FavouriteService());
  Get.put(CalendarService());

  //Setup repository
  Get.put(CommonRepository());
  Get.put(UserRepository());
  Get.put(HomeRepository());
  Get.put(FavouriteRepository());
  Get.put(CalendarRepository());
  Get.put(FilterRepository());

  Get.put(PhotoProvider());
  Get.put(AssetPathProvider());
  Get.put(PermissionHandleManager());
  //Setup service
  Get.put(NetworkManagerService());

  Get.lazyPut<CustomUserAppbarController>(() => CustomUserAppbarController(), fenix: true);
}

setupStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.dark, systemNavigationBarIconBrightness: Brightness.dark),
  );
}
