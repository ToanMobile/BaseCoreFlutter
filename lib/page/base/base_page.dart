import 'package:core/controllers/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/res/dimens.dart';
import 'package:shared/widget/loading/data_error_widget.dart';
import 'package:shared/widget/loading/loading_widget.dart';

abstract class BasePage<C extends BaseController> extends GetWidget<C> {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => buildViewState(context));
  }

  Widget buildViewState(BuildContext context) {
    switch (controller.viewState.value) {
      case ViewState.error:
        return DataErrorWidget(messageError: controller.dataException?.message, onReloadData: controller.onReloadData);
      case ViewState.loaded:
      case ViewState.empty:
        return Stack(
          children: [buildContentView(context, controller), if (controller.viewState.value == ViewState.empty) buildEmptyView],
        );
      case ViewState.loading:
        return Stack(
          children: [buildContentView(context, controller), if (controller.viewState.value == ViewState.loading) buildLoadingView],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget buildDefaultLoading() {
    return Center(
      child: LoadingWidget(
        radius: 16.r,
      ),
    );
  }

  Widget buildContentView(BuildContext context, C controller);

  Widget get buildLoadingView => buildDefaultLoading();

  Widget buildDefaultEmpty() => const SizedBox.shrink();

  Widget get buildEmptyView => buildDefaultEmpty(); //const DataEmptyWidget();
}

enum ViewState { initial, loading, loaded, empty, error }
