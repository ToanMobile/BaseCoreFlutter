import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:shared/res/style_core.dart';
import 'package:shared/res/theme/theme_service.dart';

import 'grid_photos_screen.dart';
import 'photo_provider.dart';

Future<PhotoInfo?> getImage({bool isEdit = false}) async {
  if (Get.find<PhotoProvider>().listGallerys.isEmpty) {
    await Get.find<PhotoProvider>().refreshGalleryList();
  }
  final PhotoInfo? result = await Get.to(() => GridPhotosScreen(
        totalPhoto: 1,
        isMultiple: false,
      ));
  if (isEdit && result?.path != null) {
    final pathImageEdit = await editPhoto(result!.path!);
    result.path = pathImageEdit;
    return result;
  } else {
    return result;
  }
}

Future<List<PhotoInfo>> getImages({int limit = 5, List<PhotoInfo>? items}) async {
  if (Get.find<PhotoProvider>().listGallerys.isEmpty) {
    await Get.find<PhotoProvider>().refreshGalleryList();
  }
  final result = await await Get.to(() => GridPhotosScreen(
        totalPhoto: limit,
        itemsSelected: items ?? [],
        isMultiple: true,
      ));
  return result;
}

Future<String?> editPhoto(String path) async {
  File? croppedFile = await ImageCropper.cropImage(
      maxWidth: 720,
      maxHeight: 1080,
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [CropAspectRatioPreset.square, CropAspectRatioPreset.ratio3x2, CropAspectRatioPreset.original, CropAspectRatioPreset.ratio4x3, CropAspectRatioPreset.ratio16x9]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'edit'.text,
          toolbarColor: getColor().themePrimaryColor,
          cropFrameColor: getColor().themePrimaryColor,
          activeControlsWidgetColor: getColor().themePrimaryColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        title: 'edit'.text,
      ));
  if (croppedFile != null) {
    return croppedFile.path;
  }
  return null;
}
