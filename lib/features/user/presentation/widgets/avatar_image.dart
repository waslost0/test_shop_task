import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_shop_task/core/model/custom_file.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/core/widgets/safe_network_image.dart';
import 'package:universal_io/io.dart';

class AvatarImage extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final File? imageFile;
  final Color? backgroundColor;

  const AvatarImage(
    this.imageUrl, {
    super.key,
    this.size = double.infinity,
    this.backgroundColor,
  }) : imageFile = null;

  const AvatarImage.file(
    this.imageFile, {
    super.key,
    this.size = double.infinity,
    this.backgroundColor,
  }) : imageUrl = null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? AppColors.raisinBlack.withOpacity(0.62),
          border: Border.all(color: AppColors.border, width: 1.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 1.0,
              offset: Offset(0.0, 0.0),
              spreadRadius: 4.0,
            )
          ],
        ),
        child: ClipOval(
          child: image(context),
        ),
      ),
    );
  }

  Widget image(BuildContext context) {
    if (imageFile != null) {
      return SafeNetworkImage.customFile(
        customFile: CustomFile(file: imageFile),
      );
    }

    return SafeNetworkImage(
      placeholderFit: BoxFit.scaleDown,
      imageUrl: imageUrl,
    );
  }
}
