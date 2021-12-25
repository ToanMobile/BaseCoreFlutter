import 'package:flutter/cupertino.dart';

class Gender {
  String name;
  IconData icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);

  @override
  String toString() {
    return 'Gender{name: $name, icon: $icon, isSelected: $isSelected}';
  }

}