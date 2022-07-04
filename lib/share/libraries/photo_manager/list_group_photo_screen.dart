import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

import 'image_item_widget.dart';
import 'photo_provider.dart';

class ListGroupPhotoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListGroupPhotoScreenState();
}

class _ListGroupPhotoScreenState extends State<ListGroupPhotoScreen> {
  PhotoProvider get photoProvider => Get.find<PhotoProvider>();

  ThumbnailOption get thumbOption => const ThumbnailOption(size: ThumbnailSize(65, 65));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: ListView.separated(
          padding: const EdgeInsetsDirectional.only(top: 1.0),
          itemCount: photoProvider.listGallerys.length,
          itemBuilder: (_, int index) => InkWell(
            child: (photoProvider.listThumb.length == photoProvider.listGallerys.length) ? _itemViewPhotoThumb(index) : _itemView(index),
            onTap: () {
              photoProvider.onChangedGallery(index);
            },
          ),
          separatorBuilder: (BuildContext _, int __) => Container(
            height: 0.5,
            color: Colors.black12,
          ),
        ),
      ),
    );
  }

  Widget _itemViewPhotoThumb(int index) {
    var item = photoProvider.listGallerys[index];
    var thumb = photoProvider.listThumb[index];
    return SizedBox(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: ImageItemWidget(
              key: ValueKey(thumb),
              entity: thumb,
              option: thumbOption,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "${item.assetCount}",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              )
            ],
          ),
          const Spacer(),
          if (index == photoProvider.galleryIndex)
            const Icon(
              Icons.check,
              size: 24,
              color: Colors.green,
            ),
        ],
      ),
    );
  }

  Widget _itemView(int index) {
    var item = photoProvider.listGallerys[index];
    return Container(
        height: 80,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${item.assetCount}",
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const Spacer(),
            if (index == photoProvider.galleryIndex)
              const Icon(
                Icons.check,
                size: 24,
                color: Colors.green,
              ),
          ],
        ));
  }
}
