import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../../share/libraries/photo_manager/photo_provider.dart';
import 'common_utils.dart';

Future<File> compressImage(String imagePath, {double maxWidth = 800.0, double maxHeight = 1080, String fileName = "lomo_image.jpeg"}) async {
  Completer<File> completer = Completer<File>();
  File originalImage = File(imagePath);
  final imageFile = Image.file(originalImage);
  print("originalLength: ${originalImage.lengthSync()}");

  imageFile.image.resolve(const ImageConfiguration()).addListener(ImageStreamListener((info, _) async {
        print("ImageOriginalSize: ${info.image.width} x ${info.image.height}");
        double xScale = info.image.width / maxWidth;
        double yScale = info.image.height / maxHeight;
        double scale = max(xScale, yScale);
        final dir = await path_provider.getTemporaryDirectory();
        File file = createFile("${dir.absolute.path}/$fileName");
        final result = await FlutterImageCompress.compressAndGetFile(imagePath, file.path,
            quality: 100,
            minWidth: scale > 1 ? info.image.width ~/ scale : info.image.width,
            minHeight: scale > 1 ? info.image.height ~/ scale : info.image.height,
            format: CompressFormat.jpeg);
        print("comPressedLength: ${result!.lengthSync()}");
        completer.complete(result);
      }, onError: (exception, stackTrace) async {
        print("errorCompressed: $exception");
        final dir = await path_provider.getTemporaryDirectory();
        File file = createFile("${dir.absolute.path}/$fileName");
        final result = await FlutterImageCompress.compressAndGetFile(imagePath, file.path,
            quality: 100, minWidth: maxWidth.toInt(), minHeight: maxHeight.toInt(), format: CompressFormat.jpeg);
        print("comPressedLength: ${result!.lengthSync()}");
        completer.complete(result);
      }));

  return completer.future;
}

Future<String> getPathCompressImage(String path, String targetPath, int width, int height, int quality) async {
  final result = await FlutterImageCompress.compressAndGetFile(path, targetPath, quality: quality, minWidth: width, minHeight: height);
  return result!.path;
}

Future<PhotoInfo> compressImageAndGetPath(String imagePath, {double maxWidth = 800, double maxHeight = 1080}) async {
  Completer<PhotoInfo> completer = Completer<PhotoInfo>();
  File originalImage = File(imagePath);
  final imageFile = FileImage(originalImage);
  final length = originalImage.lengthSync();
  print("originalLength: $length");
  imageFile.resolve(const ImageConfiguration()).addListener(ImageStreamListener((info, _) async {
        final isVertical = info.image.height > info.image.width ? true : false;
        final ratio = double.parse((info.image.width / info.image.height).toStringAsFixed(2));
        if (!isVertical) {
          maxHeight = maxHeight != 1080 ? maxHeight : 800;
          maxWidth = maxHeight * (info.image.width / info.image.height);
        } else {
          maxWidth = maxWidth != 800 ? maxWidth : 800;
          maxHeight = maxWidth * (info.image.height / info.image.width);
        }
        String fileName = "lomo_${DateTime.now()}.jpeg";
        final dir = await path_provider.getTemporaryDirectory();
        File file = createFile("${dir.absolute.path}/$fileName");
        String compressPath = await getPathCompressImage(imagePath, file.path, maxWidth.toInt(), maxHeight.toInt(), getQuality(length));

        var photoInfo = PhotoInfo(path: compressPath, isVertical: isVertical, ratio: ratio);
        completer.complete(photoInfo);
      }, onError: (exception, stackTrace) async {
        print("errorCompressed: $exception");
        String fileName = "lomo_${DateTime.now()}.jpeg";
        final dir = await path_provider.getTemporaryDirectory();
        File file = createFile("${dir.absolute.path}/$fileName");

        String compressPath = await getPathCompressImage(imagePath, file.path, maxWidth.toInt(), maxHeight.toInt(), getQuality(length));
        var photoInfo = PhotoInfo(path: compressPath, isVertical: true, ratio: 1);
        completer.complete(photoInfo);
      }));
  return completer.future;
}

int getQuality(dynamic fileLength) {
  final isAndroid = Platform.isAndroid;
  int quality = 0;
  if (fileLength < 500000) {
    quality = 100;
  } else if (fileLength < (isAndroid ? 1200000 : 2000000)) {
    quality = 95;
  } else {
    quality = 100 ~/ (fileLength / (isAndroid ? 1200000 : 2000000));
    if (quality < 40) quality = 40;
  }
  return quality;
}

Future<File> writeToFile(Uint8List data, String path) {
  final buffer = data.buffer;
  return File(path).writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}

double getScaleRatio(BuildContext context) {
  var pixRatio = MediaQuery.of(context).devicePixelRatio;
  print("Corrected size W is ${MediaQuery.of(context).size.width * pixRatio}");
  print("Corrected size H is ${MediaQuery.of(context).size.height * pixRatio}");
  return 0.0;
}
