// ignore_for_file: must_be_immutable

import 'package:core/page/widgets/button/touchable_opacity.dart';
import 'package:core/res/style.dart';
import 'package:flutter/material.dart';

import 'gender.dart';

class CustomRadio extends StatelessWidget {
  Gender _gender;
  final VoidCallback onPress;
  CustomRadio(this._gender, this.onPress, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onPressed: onPress,
      child: Card(
        color: _gender.isSelected ? const Color(0xFF3B4257) : Colors.white,
        child: Container(
          height: 30.h,
          width: 90.w,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                _gender.icon,
                color: _gender.isSelected ? Colors.white : Colors.grey,
                size: 30.h,
              ),
              const SizedBox(height: 2),
              Text(
                _gender.name,
                style: TextStyle(color: _gender.isSelected ? Colors.white : Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
