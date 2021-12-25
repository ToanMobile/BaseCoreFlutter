import 'package:core/app/app_pages.dart';
import 'package:core/page/base/base_page.dart';
import 'package:core/page/base/base_scaffold.dart';
import 'package:core/page/widgets/appbar/default_appbar.dart';
import 'package:core/res/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/login_controller.dart';

class LoginPage extends BasePage<LoginController> {
  @override
  Widget buildContentView(BuildContext context, LoginController controller) {
    return BaseScaffold(
      resizeToAvoidBottomInset: true,
      appbar: DefaultAppbar(title: 'login.login'.text),
      isPaddingDefault: true,
      marginCustom: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.w),
      body: buildWidgetHome(),
    );
  }

  buildWidgetHome() => Center(
        child: Container(
          width: 100.w,
          height: 50.w,
          decoration: BoxDecoration(
            color: dividerColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: TextButton(
            child: Text('tab.home'.text, style: text18.bold.textBlackColor),
            onPressed: () => Get.offAllNamed(AppRoutes.HOME),
          ),
        ),
      );
}
