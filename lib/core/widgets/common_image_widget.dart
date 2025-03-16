import 'dart:io';

import 'package:bardix/core/app_constants/app_repo_assets.dart';
import 'package:bardix/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonSVGImageProvider extends StatelessWidget {
  final BoxFit boxFit;
  final double? height;
  final double? width;
  final String imagePath;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  final Alignment alignment;
  final Widget? child;
  final ColorFilter? colorFilter;

  const CommonSVGImageProvider({
    super.key,
    this.boxFit = BoxFit.fill,
    this.height,
    this.width,
    required this.imagePath,
    this.borderRadius,
    this.onTap,
    this.margin,
    this.alignment = Alignment.center,
    this.child,
    this.colorFilter,
  });

  @override
  Widget build(BuildContext context) =>
      imagePath.isEmpty
          ? _buildPlaceholder(context)
          : GestureDetector(
            onTap: onTap,
            child: Container(
              height: height,
              width: width,
              margin: margin,
              alignment: alignment,
              decoration: BoxDecoration(borderRadius: borderRadius),
              child: _buildImage(context),
            ),
          );

  /// 🔹 Builds the placeholder image
  Widget _buildPlaceholder(BuildContext context) => Image.asset(
    AppRepoAssets().logoImage,
    fit: boxFit,
    errorBuilder:
        (_, __, ___) => Icon(
          Icons.image,
          color: Theme.of(context).colorScheme.error,
          size: 20.convertPxToDp(),
        ),
  );

  /// 🔹 Builds the actual image
  Widget _buildImage(BuildContext context) {
    if (imagePath.startsWith('http')) {
      return SvgPicture.network(imagePath, fit: boxFit);
    }

    if (imagePath.startsWith('asset')) {
      return imagePath.endsWith('.png')
          ? Image.asset(imagePath, fit: boxFit)
          : SvgPicture.asset(imagePath, fit: boxFit, colorFilter: colorFilter);
    }

    if (imagePath.endsWith('.svg')) {
      return SvgPicture.file(File(imagePath), fit: boxFit);
    }

    return Image.file(File(imagePath), fit: boxFit);
  }
}
