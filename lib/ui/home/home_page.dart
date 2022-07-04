import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/style.dart';
import '../../ui/base/base_page.dart';
import '../../ui/base/base_scaffold.dart';
import '../../ui/setting/settings_page.dart';
import '../task/task_page.dart';
import '../widgets/menu/custom_bottom_menu.dart';
import 'home_controller.dart';

class HomePage extends BasePage<HomeController> {
  final List<Widget> pages = [SettingsPage(), TaskPage(), SettingsPage()];

  @override
  Widget buildContentView(BuildContext context, HomeController controller) {
    return BaseScaffold(
      isPaddingDefault: false,
      bottomNavigationBar: buildWidgetBottom(),
      body: IndexedStack(
        index: controller.pageIndex.value,
        children: pages,
      ),
    );
  }

  buildWidgetBottom() => Obx(
        () => SizedBox(
          height: 60.h,
          child: CustomBottomMenu(
            index: controller.pageIndex.value,
            items: buildWidgetNavigationItem(),
            backgroundColor: primaryColor,
            onTabChanged: controller.onTabChanged,
          ),
        ),
      );

  buildWidgetNavigationItem() => [
        BottomNavigationBarItem(
          label: LocalString.homeDashboard,
          icon: Assets.svg.home.iconDashboard.svg(),
          activeIcon: Assets.svg.home.iconDashboard.svg(color: whiteColor),
        ),
        BottomNavigationBarItem(
          label: LocalString.homeTask,
          icon: Assets.svg.home.iconTask.svg(),
          activeIcon: Assets.svg.home.iconTask.svg(color: whiteColor),
        ),
        BottomNavigationBarItem(
          label: LocalString.homeSettings,
          icon: Assets.svg.home.iconSetting.svg(),
          activeIcon: Assets.svg.home.iconSetting.svg(color: whiteColor),
        ),
      ];
}
