import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../controllers/base/base_controller.dart';
import '../../share/constant/constant.dart';
import '../../ui/base/base_page.dart';

abstract class BaseListController<I> extends BaseController {
  int totalItem = 0;
  RxList<I> items = <I>[].obs;
  late ScrollController scrollController;
  int page = 1;

  int get pageSize => PAGE_SIZE;

  int get itemCount => items.length;

  RxBool isLoadMore = false.obs;

  int get initIndexPage => 0;

  bool get autoLoadData => true;

  bool continueLoadMore = true;

  double get rangeLoadMore => 500;

  bool get enableRefresh => true;

  bool get isLoadCacheData => false; //Load data from cache

  ViewState get initState => ViewState.loading;

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    super.dispose();
    scrollController.dispose();
  }

  @override
  Future<void> onReloadData() async {
    getData();
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter == rangeLoadMore && continueLoadMore) {
      loadMoreData();
    }
  }

  loadMoreData({dynamic params}) {
    if (isLoadMore.value) return;
    isLoadMore.value = true;
    loadData(params: params);
  }

  Future<void> onRefresh({dynamic params}) async {
    page = 1;
    loadData(params: params, isClear: true);
  }

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController()..addListener(_scrollListener);
    if (isLoadCacheData) {
      loadCacheData();
    } else if (autoLoadData) {
      loadData();
    }
  }

  loadData({dynamic params, bool isClear = false}) async {
    print("\n\n*************************** page: $page ***************************\n\n");
    try {
      final data = await getData();
      if (isClear) items.clear();
      continueLoadMore = data != null && data.isNotEmpty ? true : false;
      if (data != null && data.isNotEmpty) {
        items.addAll(data);
        page++;
      }
      viewState?.value = ViewState.loaded;
    } catch (e) {
      viewState?.value = ViewState.error;
    }
    isLoadMore.value = false;
  }

  loadCacheData({dynamic params}) async {
    try {
      final cacheData = await getCacheData(params: params);
      if (cacheData != null && cacheData.length > 0) {
        items.clear();
        items.addAll(cacheData);
        page++;
      } else {
        viewState?.value = ViewState.error;
      }
    } catch (e) {
      viewState?.value = ViewState.error;
    }
    isLoadMore.value = false;
  }

  Future<List<I>?> getData();

  Future<List<I>?>? getCacheData({dynamic params}) {
    return null;
  }
}
