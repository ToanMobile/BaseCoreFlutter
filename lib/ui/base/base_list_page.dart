import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controllers/base/base_list_controller.dart';
import '../../res/style.dart';
import '../../share/widget/loading/data_empty_widget.dart';
import '../../share/widget/loading/loading_widget.dart';
import '../../ui/base/base_page.dart';

// ignore: use_key_in_widget_constructors
abstract class BaseListPage<I, C extends BaseListController<I>> extends BasePage<C> {
  EdgeInsets get padding => const EdgeInsets.symmetric(horizontal: 0, vertical: 15);

  double get itemSpacing => 0;

  Color get dividerColor => whiteColor;

  Color get background => getColor().backgroundWhiteBlackColor;

  Widget buildItem(BuildContext context, I item, int index);

  @override
  Widget buildContentView(BuildContext context, C controller) {
    return Container(
      color: background,
      child: (controller.items.isNotEmpty || controller.viewState.value == ViewState.loading)
          ? CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: controller.scrollController,
              slivers: [
                CupertinoSliverRefreshControl(
                  onRefresh: controller.enableRefresh ? controller.onRefresh : null,
                  builder: (_, __, a1, a2, a3) {
                    return Container(
                      alignment: Alignment.center,
                      child: const LoadingWidget(
                        radius: 12,
                      ),
                    );
                  },
                ),
                SliverPadding(
                  padding: padding,
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Column(
                          children: [buildItem(context, controller.items[index], index), Divider(height: itemSpacing, color: dividerColor)],
                        );
                      },
                      childCount: controller.items.length,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: controller.isLoadMore.value
                      ? Container(
                          padding: const EdgeInsets.only(bottom: 10, top: 10),
                          alignment: Alignment.center,
                          child: const LoadingWidget(
                            radius: 12,
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            )
          : DataEmptyWidget(background: background),
    );
  }

  jumpToTop() {
    controller.scrollController.animateTo(
      0.0,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
