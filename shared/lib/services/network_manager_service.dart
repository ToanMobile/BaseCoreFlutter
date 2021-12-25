import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManagerService extends GetxService {
  Rx<NetWorkState> networkState = NetWorkState.wifi.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;
  bool isNotiNetwork = false;

  @override
  void onInit() {
    getConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  Future<void> getConnectionType() async {
    var connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      print(e);
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        networkState.value = NetWorkState.wifi;
        if (isNotiNetwork) {
          Get.snackbar(
              'network.success.title'.tr, 'network.success.content'.tr);
          isNotiNetwork = false;
        }
        break;
      case ConnectivityResult.mobile:
        networkState.value = NetWorkState.mobile;
        if (isNotiNetwork) {
          Get.snackbar(
              'network.success.title'.tr, 'network.success.content'.tr);
          isNotiNetwork = false;
        }
        break;
      case ConnectivityResult.none:
        networkState.value = NetWorkState.none;
        Get.snackbar('network.error.title'.tr, 'network.error.content'.tr);
        isNotiNetwork = true;
        break;
      default:
        Get.snackbar('Network Error', 'Failed to get Network Status');
        break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}

enum NetWorkState { none, wifi, mobile }
