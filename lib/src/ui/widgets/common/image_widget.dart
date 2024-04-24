import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/extensions/double_extensions.dart';
import 'package:zexonline/src/extensions/string_extensions.dart';
import 'package:zexonline/src/ui/widgets/common/custom_circular_progress.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
    this.aspectRatio,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.radius,
    this.colorImage,
    this.opacity = 1,
    this.fit,
    this.progressIndicatorWidget,
  });

  final String image;
  final double? aspectRatio;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? radius;
  final Color? colorImage;
  final double opacity; // >=0 and <= 1
  final BoxFit? fit;
  final Widget? progressIndicatorWidget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: Container(
        padding: padding,
        margin: margin,
        color: backgroundColor,
        child: aspectRatio != null
            ? AspectRatio(
                aspectRatio: aspectRatio!,
                child: _buildImage(),
              )
            : _buildImage(),
      ),
    );
  }

  Widget _buildImage() {
    Widget errorWidget = const Icon(
      Icons.error_outline,
      color: AppColors.red,
    );
    return Stack(
      alignment: Alignment.center,
      children: [
        image.isEmpty
            ? errorWidget
            : image.isNetworkUri
                ? CachedNetworkImage(
                    imageUrl: image,
                    color: colorImage,
                    width: widthImage(),
                    height: heightImage(),
                    fit: fit ?? BoxFit.cover,
                    errorWidget: (_, __, ___) {
                      return Container(
                        width: widthImage(),
                        height: heightImage(),
                        decoration: BoxDecoration(gradient: AppColors.gradient()),
                        child: Center(
                          child: SizedBox(width: 20, height: 20, child: errorWidget),
                        ),
                      );
                    },
                    progressIndicatorBuilder: (_, __, ___) =>
                        progressIndicatorWidget ??
                        Container(
                          width: widthImage(),
                          height: heightImage() ?? Get.height,
                          decoration: BoxDecoration(gradient: AppColors.gradient()),
                          child: const Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CustomCircularProgress(),
                            ),
                          ),
                        ),
                  )
                : image.isSvg
                    ? SvgPicture.asset(
                        image,
                        width: widthImage(),
                        height: heightImage(),
                        fit: fit ?? BoxFit.contain,
                      )
                    : (image.isLocalPath
                        ? Image.file(
                            File(image),
                            color: colorImage,
                            width: widthImage(),
                            height: heightImage(),
                            fit: fit ?? BoxFit.cover,
                          )
                        : Image.asset(
                            image,
                            color: colorImage,
                            width: widthImage(),
                            height: heightImage(),
                            fit: fit ?? BoxFit.cover,
                          )),
        // opacity
        Container(
          width: widthImage(),
          height: heightImage(),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(1 - opacity),
            borderRadius: BorderRadius.circular(radius ?? 0),
          ),
        ),
      ],
    );
  }

  double? widthImage() => aspectRatio.isNotNull ? double.maxFinite : width;

  double? heightImage() => aspectRatio.isNotNull ? double.maxFinite : height;
}
