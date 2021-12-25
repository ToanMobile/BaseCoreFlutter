import 'package:core/data/api/exceptions/data_exception.dart';
import 'package:core/page/base/base_page.dart';
import 'package:core/res/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseController<C> extends GetxController {
  //Khi có exception thì có hiện popup thông báo hay không
  bool get isShowScreenError => false;

  @override
  void onInit() async {
    super.onInit();
    viewState = initState.obs;
  }

  late Rx<ViewState> viewState;
  DataException? dataException;

  ViewState get initState => ViewState.loaded;

  showErrors(Object exception) {
    if (exception is DataException) {
      dataException = exception;
      switch (exception.statusCode) {
        case 401:
      }
    }
    if (isShowScreenError) {
      viewState.value = ViewState.error;
    } else {
      viewState.value = ViewState.loaded;
      Get.snackbar(
        'noti.error.title'.text,
        dataException?.message ?? (exception.toString().isNotEmpty ? exception.toString() : 'noti.error.content'.text),
        colorText: Colors.black,
      );
    }
  }

  showSnackBar(String? error) => Get.snackbar('noti.error.title'.text, error ?? 'noti.error.content'.text, colorText: Colors.black);

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
