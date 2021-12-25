import 'package:core/page/base/base_page.dart';
import 'package:core/page/base/base_scaffold.dart';
import 'package:core/page/widgets/appbar/default_appbar.dart';
import 'package:core/res/style.dart';
import 'package:flutter/material.dart';

import 'controller/home_controller.dart';

class HomePage extends BasePage<HomeController> {
  @override
  Widget buildContentView(BuildContext context, HomeController controller) {
    return BaseScaffold(
      resizeToAvoidBottomInset: true,
      appbar: DefaultAppbar(
        title: 'new.add_new'.text,
        isMargin: true,
      ),
      isPaddingDefault: true,
      marginCustom: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.w),
      body: buildWidgetHome(),
    );
  }

  buildWidgetHome() => Center(
    child: Container(
          child: Text('tab.home'.text, style: text18.bold.textBlackColor),
        ),
  );
}
