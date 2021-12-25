import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/res/style_core.dart';

class DataErrorWidget extends StatelessWidget {
  final String? messageError;
  final Function() onReloadData;

  DataErrorWidget({
    this.messageError,
    required this.onReloadData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: getColor().backgroundWhiteBlackColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            DPathCore.imagesImgDataError,
            width: 90,
            height: 90,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            messageError ?? 'data.error'.tr,
            style: text16.textBlackColor,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          ElevatedButton(
            onPressed: () => onReloadData(),
            child: Text('refresh'.text),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
            ),
          )
        ],
      ),
    );
  }
}
