import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:test_shop_task/core/model/custom_file.dart';
import 'package:test_shop_task/core/theme/assets_catalog.dart';

enum SafeNetworkImageType {
  network,
  customFile;

  bool get isNetwork => this == network;

  bool get isCustomFile => this == customFile;
}

class SafeNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final String placeholder;
  final String? blurHash;
  final int? decodingWidth;
  final int? decodingHeight;

  final CustomFile? customFile;

  final BoxFit fit;
  final BoxFit placeholderFit;
  final SafeNetworkImageType type;

  const SafeNetworkImage({
    super.key,
    this.imageUrl,
    this.placeholder = AssetsCatalog.placeholder,
    this.fit = BoxFit.cover,
    this.placeholderFit = BoxFit.cover,
  })  : type = SafeNetworkImageType.network,
        customFile = null,
        blurHash = null,
        decodingWidth = null,
        decodingHeight = null;

  SafeNetworkImage.customFile({
    required this.customFile,
    super.key,
    this.placeholder = AssetsCatalog.placeholder,
    this.fit = BoxFit.cover,
    this.placeholderFit = BoxFit.cover,
    this.decodingWidth,
    this.decodingHeight,
  })  : type = SafeNetworkImageType.customFile,
        imageUrl = customFile?.url,
        blurHash = customFile?.blurHash;

  @override
  Widget build(BuildContext context) {
    if (type.isNetwork && imageUrl == null) {
      return Image.asset(
        placeholder,
        fit: placeholderFit,
        colorBlendMode: BlendMode.color,
      );
    }

    if (type.isCustomFile && customFile?.file != null) {
      return ExtendedImage.file(
        customFile!.file!,
        fit: fit,
        loadStateChanged: onLoadStateChanged,
      );
    }

    return ExtendedImage.network(
      customFile?.url ?? imageUrl ?? '',
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
