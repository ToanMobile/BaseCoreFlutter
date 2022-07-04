import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/style.dart';
import '../../../ui/widgets/menu/custom_bottom_menu_controller.dart';

class CustomBottomMenu extends StatelessWidget {
  final int index;
  final List<BottomNavigationBarItem> items;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color? backgroundColor;
  final BottomNavigationBarType? type;
  final double? unselectedFontSize;
  final double? selectedFontSize;
  final Function(int) onTabChanged;

  const CustomBottomMenu(
      {required this.index,
      required this.items,
      this.selectedItemColor,
      this.unselectedItemColor,
      this.backgroundColor,
      this.type,
      this.unselectedFontSize,
      this.selectedFontSize,
      required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomBottomMenuController>(
      init: CustomBottomMenuController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: index,
            type: type ?? BottomNavigationBarType.fixed,
            selectedItemColor: selectedItemColor ?? getColor().onPrimary,
            unselectedItemColor: unselectedItemColor ?? getColor().themeGrayColor,
            backgroundColor: backgroundColor ?? getColor().backgroundWhiteBlackColor,
            onTap: onTabChanged,
            selectedLabelStyle: text10.textBlackColor,
            unselectedLabelStyle: text10.textGreyColor,
            unselectedFontSize: unselectedFontSize ?? 10.sp,
            selectedFontSize: selectedFontSize ?? 10.sp,
            items: items,
          ),
        );
      },
    );
  }
}
