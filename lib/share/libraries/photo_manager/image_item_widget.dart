import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

import 'change_notifier_builder.dart';
import 'core/lru_map.dart';
import 'loading_widget.dart';
import 'photo_provider.dart';

class ImageItemWidget extends StatefulWidget {
  const ImageItemWidget({
    Key? key,
    required this.entity,
    required this.option,
  }) : super(key: key);

  final AssetEntity entity;
  final ThumbnailOption option;

  @override
  _ImageItemWidgetState createState() => _ImageItemWidgetState();
}

class _ImageItemWidgetState extends State<ImageItemWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Get.find<PhotoProvider>();
    return ChangeNotifierBuilder(
      builder: (c, p) {
        final format = provider.thumbFormat;
        return buildContent(format);
      },
      value: provider,
    );
  }

  Widget buildContent(ThumbnailFormat format) {
    if (widget.entity.type == AssetType.audio) {
      return const Center(
        child: Icon(
          Icons.audiotrack,
          size: 30,
        ),
      );
    }
    final item = widget.entity;
    final size = widget.option.size.width;
    final u8List = ImageLruCache.getData(item, size, format);

    Widget image;

    if (u8List != null) {
      return _buildImageWidget(item, u8List, size);
    } else {
      image = FutureBuilder<Uint8List?>(
        future: item.thumbnailDataWithOption(widget.option),
        builder: (context, snapshot) {
          Widget w;
          if (snapshot.hasError) {
            w = Center(
              child: Text("load error, error: ${snapshot.error}"),
            );
          }
          if (snapshot.hasData) {
            ImageLruCache.setData(item, size, format, snapshot.data!);
            w = _buildImageWidget(item, snapshot.data!, size);
          } else {
            w = Center(
              child: itemLoading(size.toDouble()),
            );
          }

          return w;
        },
      );
    }

    return image;
  }

  Widget _buildImageWidget(AssetEntity entity, Uint8List uint8list, num size) {
    return Image.memory(
      uint8list,
      width: size.toDouble(),
      height: size.toDouble(),
      fit: BoxFit.cover,
      filterQuality: FilterQuality.low,
    );
  }

  @override
  void didUpdateWidget(ImageItemWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.entity.id != oldWidget.entity.id) {
      setState(() {});
    }
  }
}
