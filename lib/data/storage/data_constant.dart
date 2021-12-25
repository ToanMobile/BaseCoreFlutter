import 'package:core/res/style.dart';
import 'package:flutter/material.dart';

import 'key_constant.dart';

final List<Tab> TAB_HOME = <Tab>[
  Tab(child: Text('home.new_look'.text)),
  Tab(child: Text('home.boutique'.text)),
  Tab(child: Text('home.sell_corner'.text)),
  Tab(child: Text(''.text)),
  //Tab(child: Text('home.creator'.text)),
];

final List<Tab> TAB_SHIT = <Tab>[
  Tab(child: Text('home.vestiums'.text)),
  Tab(child: Text('home.ves_corner'.text)),
  Tab(child: Text('home.ves_set'.text)),
  Tab(child: Text('home.ves_brand'.text)),
];

final List<Tab> TAB_FAVOURITE = <Tab>[
  Tab(child: Text('home.favourite'.text))
];

final List<Tab> TAB_CALENDAR = <Tab>[
  Tab(child: Text('home.calender'.text)),
  Tab(child: Text('home.suitcase'.text)),
];

String? getTargetSource(homeTAB) {
  switch (homeTAB) {
    case HOME_TAB.NEW_LOOK:
      return NEW_LOOKS;
    case HOME_TAB.BOUTIQUE:
      return BOUTIQUE;
    case HOME_TAB.VES_SET:
      return VES_SET;
    case HOME_TAB.VESBRAND:
      return VES_BRAND;
    default:
      return null;
  }
}