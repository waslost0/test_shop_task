import 'package:flutter/material.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/core/theme/theme.dart';
import 'package:test_shop_task/features/user/presentation/widgets/avatar_image.dart';
import 'package:universal_io/io.dart';

class EditProfileHeader extends StatelessWidget {
  final String? avatarUrl;
  final File? photoFile;
  final VoidCallback onChangeAvatarTap;

  static const double _avatarSize = 140;

  const EditProfileHeader({
    super.key,
    this.avatarUrl,
    this.photoFile,
    required this.onChangeAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          _buildAvatarWidget(context),
          _buildEditAvatarIconWidget(context),
        ],
      ),
    );
  }

  Widget _buildEditAvatarIconWidget(BuildContext context) {
    return Positioned(
      right: 6,
      top: 6,
      child: GestureDetector(
        onTap: onChangeAvatarTap,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(Icons.edit),
        ),
      ),
    );
  }

  Widget _buildAvatarWidget(BuildContext context) {
    return GestureDetector(
      onTap: onChangeAvatarTap,
      child: Container(
        decoration: ThemeBuilder.buildCircleDecoration,
        child: photoFile != null
            ? AvatarImage.file(
                photoFile,
                size: _avatarSize,
              )
            : AvatarImage(
                avatarUrl,
                size: _avatarSize,
              ),
      ),
    );
  }
}
