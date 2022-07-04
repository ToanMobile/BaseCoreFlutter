//Constant service
import 'package:flutter/material.dart';

import '../../res/style.dart';

const KEY_MAP = 'AIzaSyCnoK_EgBGQPSj6JKEmCBvMqiLfX8fV9Z4';

final List<Tab> TAB_ESTIMATION = <Tab>[
  Tab(child: Text(LocalString.documentTabDaft)),
  Tab(child: Text(LocalString.documentTabProgress)),
  Tab(child: Text(LocalString.documentTabSold)),
  Tab(child: Text(LocalString.documentTabArchive)),
];

final List<String> listSourceColor = <String>['Red', 'Blue', 'Black', 'White', 'Yellow', 'Gray', 'Green', 'Brown', 'Violet', 'Silver'];

final List<String> listSourceFuelType = <String>['liquid', 'electric', 'mixed'];

bool isDetailsFromEstimation = false;

enum LOADING { non, loading, complete }
