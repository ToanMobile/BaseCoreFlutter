//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars

import 'package:camera_web/camera_web.dart';
import 'package:connectivity_for_web/connectivity_for_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  CameraPlugin.registerWith(registrar);
  ConnectivityPlugin.registerWith(registrar);
  ImagePickerPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}