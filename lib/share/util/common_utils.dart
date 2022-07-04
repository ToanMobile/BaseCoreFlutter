import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

/*import 'package:url_launcher/url_launcher.dart';

Future<void> launchAction(String url) async {
  if (await canLaunch(url))
    await launch(url);
  else
    throw 'Could not launch $url';
}*/

String formatNumber(num? value) {
  if (value == 0 || value == null) return '0';
  final formatter = NumberFormat("#,###.#");
  return formatter.format(value.round());
}

String formatCurrency(dynamic value) {
  final formatter = NumberFormat.currency(locale: "vi_VN", symbol: "VND");
  return formatter.format(value);
}

String formatNumberDivThousand(int? value) {
  final formatter = NumberFormat("#,###.#");
  if (value == null) return "";
  if (value < 1000000) {
    return formatter.format(value);
  } else {
    double number = value / 1000;
    return formatter.format(number) + "K";
  }
}

String formatNumberDistance(dynamic value) {
  final formatter = NumberFormat("#,###.#");
  final formatMeter = NumberFormat("#,###.##");
  if (value == null) return "";
  if (value < 10) {
    return "0.01 km";
  } else if (value >= 10 && value < 1000) {
    double number = value / 1000;
    return formatMeter.format(number) + " km";
  } else {
    double number = value / 1000;
    return formatter.format(number) + " km";
  }
}

List<T> shuffle<T>(List<T> original, {int length = -1}) {
  List items = <T>[]..addAll(original);
  int bottom = 0;
  if (length != -1 && length <= items.length) {
    bottom = items.length - length;
  }
  var random = new Random();
  // Go through all elements.
  for (var i = items.length - 1; i > bottom; i--) {
    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  final end = length == -1 || length >= items.length ? items.length : length;

  return items.sublist(0, end) as List<T>;
}

bool isUpdate(String oldVersion, String newVersion) {
  bool result = false;
  try {
    List<String> oldVersions = oldVersion.split(".");
    List<String> newVersions = newVersion.split(".");
    for (int i = 0; i < oldVersions.length; i++) {
      if (int.parse(newVersions[i]) > int.parse(oldVersions[i])) {
        result = true;
      }
    }
  } catch (e) {
    print(e);
  }
  return result;
}

File createFile(String path) {
  final file = File(path);
  if (!file.existsSync()) {
    file.createSync(recursive: true);
  }

  return file;
}

double convertPosition(num? position, double size) {
  return ((position ?? 0.0) / 12.0) * size;
}

double convertPositionNewLook(num? position, double size) {
  return ((position ?? 0.0) / 100) * size;
}

Future<void> openCall(String mobilePhone) async {
  var phoneNumber = Uri.parse('tel:$mobilePhone');
  if (await canLaunchUrl(phoneNumber)) {
    await launchUrl(phoneNumber);
  } else {
    throw 'Could not open the map.';
  }
}

bool isCameraCapture = false;

Future<void> orientation({bool isLandscape = false}) async {
  try {
    if (isCameraCapture) return;
    if (isLandscape) {
      if (Platform.isAndroid) {
        return SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
      } else {
        return SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
      }
    } else {
      return SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }
  } catch (e) {}
}
