import 'package:flutter/material.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/core/widgets/card_widget.dart';
import 'package:test_shop_task/core/widgets/safe_networkImage.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';

class CategoryListItem extends StatelessWidget {
  final CategoryEntity category;

  const CategoryListItem(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      margin: EdgeInsets.zero,
      child: Container(
        color: AppColors.lightRed,
        height: 78,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTitleWidget(context),
                    _buildTextWidget(context),
                  ],
                ),
              ),
            ),
            if (category.icon != null) Padding(
              padding: const EdgeInsets.only(right: 10),
              child: _buildImageWidget(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleWidget(BuildContext context) {
    return Text(
      category.title,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: AppTextStyle.title.copyWith(
        fontSize: 16,
      ),
    );
  }

  Widget _buildTextWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Смотреть",
          style: AppTextStyle.body.copyWith(color: AppColors.red),
        ),
        const Icon(
          Icons.keyboard_arrow_right,
          color: AppColors.red,
        ),
      ],
    );
  }

  Widget _buildImageWidget(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.white,
        width: 70,
        height: 70,
        padding: const EdgeInsets.all(5),
        child: SafeNetworkImage(
          imageUrl: category.icon,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
