import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../res/style.dart';

class DataEmptyWidget extends StatelessWidget {
  final Color? background;

  const DataEmptyWidget({this.background});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: background ?? backgroundColor, //getColor().backgroundWhiteBlackColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            DPathCore.iconEmpty,
            width: 120.w,
            height: 120.w,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'data.empty'.tr,
            style: text16.textBlackColor,
          )
        ],
      ),
    );
  }
}
