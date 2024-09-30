import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/core/widgets/safe_network_image.dart';
import 'package:test_shop_task/features/user/domain/entities/user_entity.dart';

class UserHeader extends StatefulWidget {
  final UserEntity user;

  const UserHeader({
    super.key,
    required this.user,
  });

  static const double dotSpacing = 4;

  @override
  State<UserHeader> createState() => _UserHeaderState();
}

class _UserHeaderState extends State<UserHeader> {
  final PageController controller = PageController(
    keepPage: true,
  );

  double dotWidth(BuildContext context) {
    return ((MediaQuery.of(context).size.width - 10) -
            UserHeader.dotSpacing * (widget.user.images.length - 1)) /
        widget.user.images.length;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.8,
          child: PageView.builder(

            controller: controller,
            itemCount: widget.user.images.length,
            itemBuilder: (BuildContext context, int index) {
              var item = widget.user.images[index];
              return SafeNetworkImage.customFile(
                image: item,
              );
            },
          ),
        ),
        Positioned(
          left: 5,
          right: 5,
          top: MediaQuery.of(context).viewPadding.top + 5,
          child: buildPageIndicator(context),
        ),
        Positioned(
          left: 16,
          bottom: 16,
          right: 16,
          child: buildName(context),
        ),
      ],
    );
  }

  Widget buildPageIndicator(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: widget.user.images.length,
      effect: WormEffect(
        spacing: UserHeader.dotSpacing,
        type: WormType.thin,
        dotWidth: dotWidth(context),
        dotHeight: 2,
        radius: 4,
        activeDotColor: AppColors.white,
        dotColor: AppColors.grey.withOpacity(0.7),
      ),
    );
  }

  Widget buildName(BuildContext context) {
    return Text(
      widget.user.name ?? '',
      style: AppTextStyle.title.copyWith(
        fontSize: 24,
        color: AppColors.white,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
