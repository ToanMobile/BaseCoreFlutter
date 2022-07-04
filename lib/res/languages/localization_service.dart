import 'dart:ui';

import 'package:get/get.dart';

import '../../data/storage/app_storage.dart';
import 'st_en_us.dart';
import 'st_vi_vn.dart';

class LocalizationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {"vi": viVN, "en": enUS};

  final store = Get.find<AppStorage>();
  static const VI_VN = "vi";
  static const EN_US = "en";

  String _language = EN_US;

  String get currentLanguage => _language;

  init() {
    loadLanguage();
  }

  Future<void> loadLanguage() async {
    _language = await store.getLanguage();
  }

  Locale? get getLocale {
    //if (_language.isNotEmpty) return Locale(_language);
    return Get.deviceLocale;
  }

  Future<void> updateLanguage(String value) async {
    _language = value;
    await store.setLanguage(value);
    if (getLocale != null) {
      Get.updateLocale(getLocale!);
    }
  }
}
