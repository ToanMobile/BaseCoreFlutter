import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/style.dart';
import '../../../ui/base/base_scaffold.dart';
import 'image_widget.dart';

class ImageFullWidget extends StatelessWidget {
  final String? url;

  const ImageFullWidget({required this.url});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isPaddingDefault: false,
      body: Container(
        color: blackColor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 20),
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: whiteColor,
                  size: 40,
                ),
                onPressed: () => Get.back(),
              ),
            ),
            Expanded(
              child: NetworkCacheImage(
                width: double.infinity,
                height: double.infinity,
                url: url,
                boxFit: BoxFit.contain,
                placeholder: SizedBox(
                  child: Center(
                    child: Assets.images.noImage.image(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
