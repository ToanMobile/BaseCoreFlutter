import 'package:core/controllers/base/base_controller.dart';
import 'package:core/page/base/base_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared/constant/constant.dart';

abstract class BaseGridController<I> extends BaseController {
  int totalItem = 0;
  RxList<I> items = <I>[].obs;
  late ScrollController scrollController;
  int page = 1;

  int get pageSize => PAGE_SIZE;

  int get itemCount => items.length;

  RxBool isLoadMore = false.obs;

  int get initIndexPage => 0;

  bool get autoLoadData => true;

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
    if (scrollController.position.extentAfter < rangeLoadMore) {
      loadMoreData();
    }
  }

  loadMoreData({dynamic params}) {
    if (isLoadMore.value) return;
    isLoadMore.value = true;
    loadData(params: params);
  }

  Future<void> onRrefresh({dynamic params}) async {
    page = 1;
    loadData(params: params, isClear: true);
  }

  @override
  void onInit() {
    super.onInit();
    scrollController = new ScrollController()..addListener(_scrollListener);
    if (isLoadCacheData) {
      loadCacheData();
    } else if (autoLoadData) {
      loadData();
    }
  }

  loadData({dynamic params, bool isClear = false}) async {
    print(
        "\n\n*************************** page: $page ***************************\n\n");
    try {
      final data = await getData();
      if (isClear) items.clear();
      if (data?.isNotEmpty == true) {
        items.addAll(data!);
        page++;
      }
      viewState.value = ViewState.loaded;
    } catch (e) {
      viewState.value = ViewState.error;
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
        viewState.value = ViewState.error;
      }
    } catch (e) {
      viewState.value = ViewState.error;
    }
    isLoadMore.value = false;
  }

  Future<List<I>?> getData();

  Future<List<I>?>? getCacheData({dynamic params}) {
    return null;
  }
}
