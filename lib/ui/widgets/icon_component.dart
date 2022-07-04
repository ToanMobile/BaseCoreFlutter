import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class MyIcons extends StatelessWidget {
  final String? type;

  const MyIcons({
    Key? key,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 'email':
        return Assets.svg.login.iconEmail.svg(color: const Color.fromRGBO(170, 170, 170, 1));
      case 'lock':
        return Assets.svg.login.iconLock.svg(color: const Color.fromRGBO(170, 170, 170, 1));
      default:
        return const SizedBox();
    }
  }
}
