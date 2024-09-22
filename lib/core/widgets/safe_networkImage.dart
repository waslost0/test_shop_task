import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_shop_task/core/theme/assets_catalog.dart';

class SafeNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final String placeholder;

  final BoxFit fit;
  final BoxFit placeholderFit;

  const SafeNetworkImage({
    super.key,
    this.imageUrl,
    this.placeholder = AssetsCatalog.placeholder,
    this.fit = BoxFit.cover,
    this.placeholderFit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl?.isEmpty ?? true) {
      return Image.asset(
        placeholder,
        fit: placeholderFit,
      );
    }
    return ExtendedImage.network(
      imageUrl ?? '',
      fit: fit,
      enableLoadState: true,
      cache: true,
      loadStateChanged: (state) => onLoadStateChanged(state),
    );
  }

  Widget? onLoadStateChanged(ExtendedImageState state) {
    if (state.extendedImageLoadState == LoadState.completed) {
      return null;
    }
    return Image.asset(
      placeholder,
      fit: placeholderFit,
    );
  }
}
