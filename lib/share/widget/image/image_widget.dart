import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../res/style.dart';
import '../../../share/widget/shadow/shadow_widget.dart';
import '../../../share/widget/shimmers/image_shimmer.dart';
import 'image_cache_manager.dart';

class RoundNetworkImage extends StatelessWidget {
  final String? url;
  final double height;
  final double width;
  final double? radius;
  final Widget? errorHolder;
  final BoxFit? boxFit;
  final Color? strokeColor;
  final double? strokeWidth;

  const RoundNetworkImage({required this.width, required this.height, this.url, this.radius, this.errorHolder, this.boxFit, this.strokeColor, this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: CachedNetworkImage(
        cacheManager: CustomCacheManager.instance,
        fadeInDuration: const Duration(milliseconds: 300),
        fadeOutDuration: const Duration(milliseconds: 500),
        imageUrl: url ?? "",
        imageBuilder: (context, imageProvider) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 0)),
            border: Border.all(color: strokeColor ?? Colors.transparent, width: strokeWidth ?? 0),
            image: DecorationImage(
              image: imageProvider,
              fit: boxFit ?? BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => ImageShimmer(width: width, height: height),
        errorWidget: (context, url, error) =>
            errorHolder ??
            ImageShimmer(
              width: width,
              height: height,
              radius: radius ?? 0,
            ),
        memCacheWidth: width > 300 ? 300 : width.toInt(),
        memCacheHeight: height > 300 ? 300 : height.toInt(),
      ),
    );
  }
}

class CircleNetworkImage extends AvatarNetworkImage {
  const CircleNetworkImage({required double size, String? url, Widget? errorHolder, BoxFit? boxFit, Color? strokeColor, double? strokeWidth, Color? backgroundColor})
      : super(
            radius: size * 2 / 3,
            url: url,
            width: size,
            height: size,
            boxFit: boxFit,
            errorHolder: errorHolder,
            strokeWidth: strokeWidth,
            strokeColor: strokeColor,
            backgroundColor: backgroundColor);
}

class PhotoViewNetworkImage extends StatelessWidget {
  final String? url;
  final double height;
  final double width;
  final double? radius;
  final double margin;
  final Widget? errorHolder;
  final dynamic placeholder;
  final BoxFit? boxFit;
  final Color? strokeColor;
  final double? strokeWidth;

  const PhotoViewNetworkImage(
      {required this.width,
      required this.height,
      this.url,
      this.radius = 0.0,
      this.margin = 0.0,
      this.placeholder,
      this.errorHolder,
      this.boxFit,
      this.strokeColor,
      this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(radius!)),
            border: Border.all(color: strokeColor ?? Colors.transparent, width: strokeWidth ?? 0),
          ),
          child: url != null
              ? Padding(
                  padding: EdgeInsets.all(margin),
                  child: PhotoView(
                    minScale: PhotoViewComputedScale.covered,
                    maxScale: PhotoViewComputedScale.covered,
                    backgroundDecoration: const BoxDecoration(color: Colors.white),
                    filterQuality: FilterQuality.high,
                    initialScale: PhotoViewComputedScale.covered,
                    imageProvider: CachedNetworkImageProvider(url ?? ""),
                    loadingBuilder: (context, event) => ImageShimmer(width: width, height: height),
                  ),
                )
              : placeholder,
        ),
      ),
    );
  }
}

class NetworkCacheImage extends StatelessWidget {
  final String? url;
  final double height;
  final double width;
  final double? radius;
  final Widget? errorHolder;
  final dynamic placeholder;
  final BoxFit? boxFit;
  final Color? strokeColor;
  final double? strokeWidth;

  const NetworkCacheImage(
      {required this.width, required this.height, this.url, this.radius = 0.0, this.placeholder, this.errorHolder, this.boxFit, this.strokeColor, this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius!)),
          border: Border.all(color: strokeColor ?? Colors.transparent, width: strokeWidth ?? 0),
        ),
        child: CachedNetworkImage(
          imageUrl: url ?? '',
          errorWidget: (context, url, error) => errorHolder ?? _buildErrorWidget(radius!),
          fit: boxFit,
        ),
      ),
    );
  }

  Widget _buildErrorWidget(double radius) {
    return const SizedBox.shrink();
  }
}

class AvatarNetworkImage extends StatelessWidget {
  final String? url;
  final double height;
  final double width;
  final double? radius;
  final Widget? errorHolder;
  final BoxFit? boxFit;
  final Color? strokeColor;
  final Color? backgroundColor;
  final double? strokeWidth;
  final String? userName;
  final TextStyle? textStyle;

  const AvatarNetworkImage(
      {required this.width,
      required this.height,
      this.url,
      this.radius = 0.0,
      this.errorHolder,
      this.boxFit,
      this.strokeColor,
      this.backgroundColor,
      this.strokeWidth,
      this.userName,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: CachedNetworkImage(
        cacheManager: CustomCacheManager.instance,
        fadeInDuration: const Duration(milliseconds: 300),
        fadeOutDuration: const Duration(milliseconds: 500),
        imageUrl: url ?? "",
        //"$PHOTO_URL${url ?? ""}",
        imageBuilder: (context, imageProvider) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius!)),
            border: Border.all(color: strokeColor ?? Colors.transparent, width: strokeWidth ?? 0),
            image: DecorationImage(
              image: imageProvider,
              fit: boxFit ?? BoxFit.cover,
              colorFilter: ColorFilter.mode(backgroundColor ?? Colors.transparent, BlendMode.darken),
            ),
          ),
        ),
        placeholder: (context, url) => ImageShimmer(width: width, height: height),
        errorWidget: (context, url, error) => errorHolder ?? _buildErrorWidget(radius!),
        memCacheWidth: width > 300 ? 300 : width.toInt(),
        memCacheHeight: height > 300 ? 300 : height.toInt(),
      ),
    );
  }

  Widget _buildErrorWidget(double radius) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          gradient: LinearGradient(begin: const Alignment(1, 0), end: const Alignment(0, 1), colors: [getColor().onPrimary, getColor().onPrimary])),
      child: Text(
        getUserName(),
        style: textStyle ?? text24.bold.textWhiteColor,
      ),
    );
  }

  String getUserName() {
    if (userName == null || userName!.isEmpty) return "";
    final arrName = userName!.split(" ");
    if (arrName.length == 1) {
      return arrName[0][0];
    } else {
      return arrName[0][0] + arrName[arrName.length - 1][0];
    }
  }
}
