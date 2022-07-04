import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

class PhotoProvider extends ChangeNotifier {
  ValueNotifier<bool> spinnerValue = ValueNotifier(true); //True up
  List<AssetPathEntity> listGallerys = [];
  List<AssetEntity> listThumb = [];
  int galleryIndex = 0;

  init() async {
    if (await Permission.storage.request().isGranted) {
      refreshGalleryList();
    }
  }

  RequestType type = RequestType.image;

  var hasAll = true;

  var onlyAll = false;

  Map<AssetPathEntity, AssetPathProvider> pathProviderMap = {};

  bool _notifying = false;

  bool _needTitle = false;

  bool get needTitle => _needTitle;

  AssetPathEntity? get currentGroup {
    if (listGallerys.isNotEmpty && galleryIndex <= listGallerys.length) {
      return listGallerys[galleryIndex];
    }
    return null;
  }

  bool _containsEmptyAlbum = false;

  bool _containsPathModified = false;

  bool get containsPathModified => _containsPathModified;

  bool get containsEmptyAlbum => _containsEmptyAlbum;

  set needTitle(bool? needTitle) {
    if (needTitle == null) {
      return;
    }
    _needTitle = needTitle;
    notifyListeners();
  }

  changeSpinnerValue() {
    spinnerValue.value = !spinnerValue.value;
    notifyListeners();
  }

  onChangedGallery(int index) {
    if (index != galleryIndex) {
      galleryIndex = index;
      Get.find<AssetPathProvider>().changeGallery(listGallerys[galleryIndex]);
    }
    changeSpinnerValue();
  }

  set containsEmptyAlbum(bool containsEmptyAlbum) {
    _containsEmptyAlbum = containsEmptyAlbum;
    notifyListeners();
  }

  set containsPathModified(bool containsPathModified) {
    _containsPathModified = containsPathModified;
    notifyListeners();
  }

  DateTime _startDt = DateTime(2005); // Default Before 8 years

  DateTime get startDt => _startDt;

  set startDt(DateTime startDt) {
    _startDt = startDt;
    notifyListeners();
  }

  DateTime _endDt = DateTime.now();

  DateTime get endDt => _endDt;

  set endDt(DateTime endDt) {
    _endDt = endDt;
    notifyListeners();
  }

  bool _asc = false;

  bool get asc => _asc;

  set asc(bool? asc) {
    if (asc == null) {
      return;
    }
    _asc = asc;
    notifyListeners();
  }

  var _thumbFormat = ThumbnailFormat.png;

  ThumbnailFormat get thumbFormat => _thumbFormat;

  set thumbFormat(thumbFormat) {
    _thumbFormat = thumbFormat;
    notifyListeners();
  }

  bool get notifying => _notifying;

  String minWidth = "0";
  String maxWidth = "10000";
  String minHeight = "0";
  String maxHeight = "10000";
  bool _ignoreSize = true;

  bool get ignoreSize => _ignoreSize;

  set ignoreSize(bool? ignoreSize) {
    if (ignoreSize == null) {
      return;
    }
    _ignoreSize = ignoreSize;
    notifyListeners();
  }

  Duration _minDuration = Duration.zero;

  Duration get minDuration => _minDuration;

  set minDuration(Duration minDuration) {
    _minDuration = minDuration;
    notifyListeners();
  }

  Duration _maxDuration = const Duration(hours: 1);

  Duration get maxDuration => _maxDuration;

  set maxDuration(Duration maxDuration) {
    _maxDuration = maxDuration;
    notifyListeners();
  }

  set notifying(bool? notifying) {
    if (notifying == null) {
      return;
    }
    _notifying = notifying;
    notifyListeners();
  }

  void changeType(RequestType type) {
    this.type = type;
    notifyListeners();
  }

  void changeHasAll(bool? value) {
    if (value == null) {
      return;
    }
    hasAll = value;
    notifyListeners();
  }

  void changeOnlyAll(bool? value) {
    if (value == null) {
      return;
    }
    onlyAll = value;
    notifyListeners();
  }

  void changeContainsEmptyAlbum(bool? value) {
    if (value == null) {
      return;
    }
    containsEmptyAlbum = value;
    notifyListeners();
  }

  void changeContainsPathModified(bool? value) {
    if (value == null) {
      return;
    }
    containsPathModified = value;
  }

  void reset() {
    listGallerys.clear();
    pathProviderMap.clear();
  }

  Future<void> refreshAll() async {
    await refreshGalleryList();
    Get.find<AssetPathProvider>().onRefresh();
  }

  Future<void> refreshGalleryList() async {
    final option = makeOption();
    reset();
    var galleryList = await PhotoManager.getAssetPathList(
      type: type,
      hasAll: hasAll,
      onlyAll: onlyAll,
      filterOption: option,
    );
    galleryList.sort((s1, s2) {
      return s2.assetCount.compareTo(s1.assetCount);
    });
    listGallerys.clear();
    listGallerys.addAll(galleryList);
    if (listGallerys.isNotEmpty) {
      Get.find<AssetPathProvider>().path = listGallerys[galleryIndex];
      await getGalleryListThumb();
    }
  }

  Future<void> getGalleryListThumb() async {
    if (listGallerys.isEmpty) {
      return;
    }
    listThumb.clear();
    await Future.forEach(listGallerys, (AssetPathEntity element) async {
      var items = await element.getAssetListPaged(page: 0, size: 1);
      listThumb.add(items[0]);
    });
  }

  FilterOptionGroup makeOption() {
    final option = FilterOption(
      sizeConstraint: SizeConstraint(
        minWidth: int.tryParse(minWidth) ?? 0,
        maxWidth: int.tryParse(maxWidth) ?? 100000,
        minHeight: int.tryParse(minHeight) ?? 0,
        maxHeight: int.tryParse(maxHeight) ?? 100000,
        ignoreSize: ignoreSize,
      ),
      durationConstraint: DurationConstraint(
        min: minDuration,
        max: maxDuration,
      ),
      needTitle: needTitle,
    );

    final createDtCond = DateTimeCond(
      min: startDt,
      max: endDt,
      ignore: false,
    );

    return FilterOptionGroup()
      ..setOption(AssetType.video, option)
      ..setOption(AssetType.image, option)
      ..setOption(AssetType.audio, option)
      ..createTimeCond = createDtCond
      ..containsLivePhotos = _containsEmptyAlbum
      ..containsPathModified = _containsPathModified
      ..addOrderOption(
        OrderOption(
          type: OrderOptionType.updateDate,
          asc: asc,
        ),
      );
  }

  Future<void> refreshAllGalleryProperties() async {
    for (var gallery in listGallerys) {
      await gallery.fetchPathProperties();
    }
    Get.find<AssetPathProvider>().onRefresh();
    notifyListeners();
  }

  void changeThumbFormat() {
    if (thumbFormat == ThumbnailFormat.jpeg) {
      thumbFormat = ThumbnailFormat.png;
    } else {
      thumbFormat = ThumbnailFormat.jpeg;
    }
  }
}

class AssetPathProvider extends ChangeNotifier {
  ValueNotifier<bool> loadingValue = ValueNotifier(false);
  static const loadCount = 30;
  bool isInit = false;
  int totalPhoto = 1;
  AssetPathEntity? path;

  initData(List<PhotoInfo>? itemsSelected, int totalPhoto) {
    this.itemsSelected.clear();
    if (itemsSelected != null) {
      for (var element in itemsSelected) {
        this.itemsSelected.add(DPhoto(id: element.id ?? "", path: element.path));
      }
    }
    this.totalPhoto = totalPhoto;
  }

  AssetPathProvider();

  List<AssetEntity> list = [];
  List<DPhoto> itemsSelected = [];

  var page = 0;

  int get showItemCount {
    if (list.length == path?.assetCount) {
      return path?.assetCount ?? 0;
    } else {
      return list.length;
    }
  }

  reloadAssetPathEntity() async {
    await path?.fetchPathProperties();
    onRefresh();
  }

  changeGallery(AssetPathEntity path) {
    this.path = path;
    itemsSelected.clear();
    list.clear();
    reloadAssetPathEntity();
  }

  photoRemoveItem(String id) async {
    if (itemsSelected.isEmpty) {
      return;
    }
    itemsSelected.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Future<void> photoAddItem(AssetEntity entity, bool isMultiple) async {
    if (itemsSelected.length >= totalPhoto && isMultiple) return;
    if (!isMultiple) itemsSelected.clear();
    if (totalPhoto == itemsSelected.length) return;
    itemsSelected.add(DPhoto(id: entity.id, entity: entity));
    notifyListeners();
  }

  int getIndexPhotoChecked(String id) {
    if (itemsSelected.isEmpty) {
      return -1;
    }
    return itemsSelected.indexWhere((element) => element.id == id);
  }

  clearAllData() {
    totalPhoto = 1;
    itemsSelected.clear();
  }

  bool refreshing = false;

  Future onRefresh() async {
    if (refreshing || path == null) {
      return;
    }
    refreshing = true;
    await path?.fetchPathProperties();
    page = 0;
    final list = await path?.getAssetListPaged(page: page, size: loadCount);
    this.list.clear();
    this.list.addAll(list ?? List.empty());
    isInit = true;
    notifyListeners();
    printListLength("onRefresh");
    refreshing = false;
  }

  Future<void> onLoadMore() async {
    if (refreshing) {
      return;
    }
    if (showItemCount >= (path?.assetCount ?? 0)) {
      return;
    }
    if ((page + 1) * loadCount == showItemCount) {
      page = page + 1;
      final list = await path?.getAssetListPaged(page: page, size: loadCount);
      this.list.addAll(list ?? List.empty());
      notifyListeners();
      printListLength("loadmore");
    }
  }

  void printListLength(String tag) {
    print("$tag length : ${list.length}");
  }

  Future<List<PhotoInfo>> getListPaths() async {
    List<PhotoInfo> items = [];
    loadingValue.value = true;
    notifyListeners();
    await Future.forEach(itemsSelected, (DPhoto element) async {
      if (element.entity != null) {
        final file = await element.entity!.file;
        if (file != null) items.add(PhotoInfo(id: element.entity!.id, path: file.path));
      } else {
        if (element.path != null) items.add(PhotoInfo(id: element.entity?.id ?? "", path: element.path!));
      }
    });
    loadingValue.value = false;
    notifyListeners();
    return items;
  }
}

class PhotoInfo {
  String? id;
  String? path; //Path la chon hinh moi
  String? link; //Link khi hinh tren server danh cho truong hop edit
  bool isVertical;
  bool isEdited;
  bool isCamera;
  double? ratio;

  @override
  String toString() {
    return 'PhotoInfo{id: $id, path: $path, link: $link, isVertical: $isVertical, isEdited: $isEdited, isCamera: $isCamera, ratio: $ratio}';
  }

  PhotoInfo({this.id, this.path, this.link, this.isVertical = false, this.isEdited = false, this.isCamera = false, this.ratio});
}

class DPhoto {
  String id;
  String? path;
  AssetEntity? entity;

  DPhoto({required this.id, this.path, this.entity});
}
