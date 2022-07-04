import 'package:flutter/material.dart';

class ColoredTabBar extends ColoredBox implements PreferredSizeWidget {
  const ColoredTabBar({required this.color, required this.tabBar}) : super(color: color, child: tabBar);

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;
}
