import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/api/exceptions/data_exception.dart';
import '../../res/style.dart';
import '../../share/libraries/logger/flutter_logger.dart';
import '../../ui/base/base_page.dart';

abstract class BaseController<C> extends GetxController {
  //Khi có exception thì có hiện popup thông báo hay không
  bool get isShowScreenError => false;
  late Rx<ViewState> viewState;
  DataException? dataException;

  ViewState get initState => ViewState.loaded;

  void onInitState() {
    viewState = initState.obs;
  }

  showErrors(Object exception) {
    if (exception is DataException) {
      dataException = exception;
      switch (exception.statusCode) {
        case 401:
      }
    }
    Logger.e('_handleResponse111::' + (exception).toString());
    if (isShowScreenError) {
      viewState.value = ViewState.error;
    } else {
      viewState.value = ViewState.loaded;
      Get.snackbar(
        LocalString.notificationError,
        dataException?.message ?? (exception.toString().isNotEmpty ? exception.toString() : LocalString.notificationContent),
        colorText: Colors.white,
      );
    }
    Logger.e('showErrors:' + viewState.value.toString());
  }

  showSnackBar(String? error, {String? title, Color? colorText}) => Get.snackbar(
        title ?? LocalString.notificationError,
        error ?? LocalString.notificationContent,
        colorText: colorText ?? Colors.black,
      );

  showLoading() {
    viewState.value = ViewState.loading;
  }

  showEmpty() {
    viewState.value = ViewState.empty;
  }

  hideLoading() {
    viewState.value = ViewState.loaded;
  }

  bool get isLoadingData => viewState.value == ViewState.loading;

  void onReloadData() {}
}
