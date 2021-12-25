import 'package:core/controllers/base/base_list_controller.dart';
import 'package:core/page/base/base_page.dart';
import 'package:core/res/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared/widget/loading/data_empty_widget.dart';
import 'package:shared/widget/loading/loading_widget.dart';

abstract class BaseGridPage<I, C extends BaseListController<I>> extends BasePage<C> {
  BaseGridPage({Key? key}) : super(key: key);

  EdgeInsets get padding => const EdgeInsets.all(0);

  double get itemSpacing => 0;

  Color get dividerColor => whiteColor;
  int crossAxisCount = 2;

  double childAspectRatio = 1;

  double mainAxisSpacing = 0;

  double crossAxisSpacing = 0;

  bool get shrinkWrap => false;

  Axis get axis => Axis.vertical;

  ScrollPhysics get scrollPhysics => const AlwaysScrollableScrollPhysics();
  double gridMarginHorizontal = 0;

  EdgeInsets get paddingGrid => EdgeInsets.symmetric(horizontal: gridMarginHorizontal);

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
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        childAspectRatio: childAspectRatio,
                        mainAxisSpacing: mainAxisSpacing,
                        crossAxisSpacing: crossAxisSpacing,
                      ),
                      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                        return buildItem(context, controller.items[index], index);
                      }, childCount: controller.items.length),
                    )),
                SliverToBoxAdapter(
                  child: Obx(
                    () => controller.isLoadMore.value
                        ? Container(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            alignment: Alignment.center,
                            child: const LoadingWidget(
                              radius: 16,
                            ),
                          )
                        : const SizedBox(),
                  ),
                ),
              ],
            )
          : const DataEmptyWidget(),
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
