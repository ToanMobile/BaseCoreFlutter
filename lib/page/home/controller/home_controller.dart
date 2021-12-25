import 'package:core/controllers/base/base_controller.dart';
import 'package:core/data/api/models/user_info.dart';
import 'package:core/data/repositories/calendar_repository.dart';
import 'package:core/data/repositories/common_repository.dart';
import 'package:core/data/repositories/favourite_repository.dart';
import 'package:core/data/repositories/home_repository.dart';
import 'package:core/data/repositories/user_repository.dart';
import 'package:core/data/storage/key_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/util/permission_handle_manager.dart';

class HomeController extends BaseController with GetSingleTickerProviderStateMixin {
  final homeRepository = Get.find<HomeRepository>();
  final commonRepository = Get.find<CommonRepository>();
  final userRepository = Get.find<UserRepository>();
  final favouriteRepository = Get.find<FavouriteRepository>();
  final calendarRepository = Get.find<CalendarRepository>();

  final home_tab_bottom = HOME_TAB_BOTTOM.home.obs;
  final RxList<Tab> tabHome = <Tab>[].obs;
  final RxBool tabShowBottom = true.obs;
  final _userInfo = Rx<UserInfo?>(null);

  //Show info
  bool isShowInfo = false;
  final RxInt isShowIndexInfo = RxInt(-1);

  UserInfo? get userInfo => _userInfo.value;
  late ScrollController scrollController;
  late TabController tabHomeController;
  HOME_TAB homeTAB = HOME_TAB.NEW_LOOK;
  int page = 1;

  @override
  void onInit() async {
    initData();
    super.onInit();
  }

  void initData() async {
    await Get.find<PermissionHandleManager>().requestPermissionApp();
    userRepository.getMyUserInfo().then((value) => _userInfo.value = value);
  }

  @override
  void onClose() {
    tabHomeController.dispose();
    super.onClose();
  }

}

class ScrollListener extends ChangeNotifier {
  double bottom = 56;
  double _last = 0;

  ScrollListener.initialise(ScrollController controller, [double height = 56]) {
    controller.addListener(() {
      final current = controller.offset;
      bottom += _last - current;
      if (bottom <= -height) bottom = -height;
      if (bottom >= 0) bottom = 0;
      _last = current;
      if (bottom <= 0 && bottom >= -height) notifyListeners();
    });
  }
}
