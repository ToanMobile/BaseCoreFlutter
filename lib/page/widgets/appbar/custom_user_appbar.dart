import 'package:core/page/base/base_page.dart';
import 'package:core/page/widgets/appbar/custom_user_appbar_controller.dart';
import 'package:core/res/style.dart';
import 'package:flutter/material.dart';
import 'package:shared/widget/image/image_widget.dart';

class CustomUserAppbar extends BasePage<CustomUserAppbarController>
    implements PreferredSizeWidget {
  final Color? color;

  CustomUserAppbar({this.color});

  @override
  Size get preferredSize => Size.fromHeight(58.w);

  @override
  Widget buildContentView(
      BuildContext context, CustomUserAppbarController controller) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 5.h,
              ),
              AvatarNetworkImage(
                url: "",
                width: 40.w,
                height: 40.w,
                radius: 30,
                userName: controller.user!.firstName,
                textStyle: text16.bold.textWhiteColor,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                controller.userName,
                style: text16.bold.textPrimaryColor,
              ),
              Spacer(),
              Image.asset(
                DPath.homeIcSearch,
                width: 23.2.w,
                height: 24.w,
              ),
              SizedBox(
                width: 5.w,
              )
            ],
          ),
          backgroundColor: color ?? transparentColor,
          elevation: 0,
        ));
  }
}
