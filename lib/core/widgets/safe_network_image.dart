import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:test_shop_task/core/model/custom_file.dart';
import 'package:test_shop_task/core/theme/assets_catalog.dart';
import 'package:universal_io/io.dart';

class SafeNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final String placeholder;
  final String? blurHash;
  final int? decodingWidth;
  final int? decodingHeight;

  final CustomFile? image;
  final File? imageFile;

  final BoxFit fit;
  final BoxFit placeholderFit;

  const SafeNetworkImage({
    super.key,
    this.imageUrl,
    this.placeholder = AssetsCatalog.placeholder,
    this.fit = BoxFit.cover,
    this.placeholderFit = BoxFit.cover,
  })  : image = null,
        blurHash = null,
        imageFile = null,
        decodingWidth = null,
        decodingHeight = null;

  SafeNetworkImage.customFile({
    required this.image,
    super.key,
    this.placeholder = AssetsCatalog.placeholder,
    this.fit = BoxFit.cover,
    this.placeholderFit = BoxFit.cover,
    this.decodingWidth,
    this.decodingHeight,
  })  : imageUrl = image?.url,
        imageFile = null,
        blurHash = image?.blurHash;

  const SafeNetworkImage.file({
    required this.imageFile,
    super.key,
    this.placeholder = AssetsCatalog.placeholder,
    this.fit = BoxFit.cover,
    this.placeholderFit = BoxFit.cover,
    this.blurHash,
    this.image,
  })  : imageUrl = null,
        decodingWidth = null,
        decodingHeight = null;

  @override
  Widget build(BuildContext context) {
    if (imageUrl?.isEmpty ?? true) {
      return Image.asset(
        placeholder,
        fit: placeholderFit,
        colorBlendMode: BlendMode.color,
      );
    }
    return ExtendedImage.network(
      imageUrl ?? '',
      fit: fit,
      loadStateChanged: onLoadStateChanged,
    );
  }

  Widget? onLoadStateChanged(ExtendedImageState state) {
    if (state.extendedImageLoadState == LoadState.completed) {
      return null;
    }
    if (blurHash?.isNotEmpty ?? false) {
      return BlurHash(
        hash: blurHash!,
      );
    }
    return Image.asset(
      placeholder,
      fit: placeholderFit,
    );
  }
}
