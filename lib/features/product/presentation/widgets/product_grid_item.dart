import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/core/utils/numer_formatter.dart';
import 'package:test_shop_task/core/widgets/card_widget.dart';
import 'package:test_shop_task/core/widgets/safe_network_image.dart';
import 'package:test_shop_task/features/cart/presentation/provider/cart_provider.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

class ProductGridItem extends ConsumerStatefulWidget {
  final ProductEntity product;

  const ProductGridItem({
    super.key,
    required this.product,
  });

  @override
  ConsumerState<ProductGridItem> createState() => _ProductGridItemState();
}

class _ProductGridItemState extends ConsumerState<ProductGridItem> {
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildHeader(),
          Expanded(child: buildData()),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: buildProductGallery(),
      ),
    );
  }

  Widget buildProductGallery() {
    var imageList = widget.product.images;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SafeNetworkImage.customFile(
        image: imageList.firstOrNull,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget buildData() {
    var product = widget.product;
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 8,
        left: 8,
        right: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          const SizedBox(height: 8),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: buildPrice(product.price),
              ),
              const SizedBox(width: 2),
              buildAddToCartWidget(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      widget.product.name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      style: AppTextStyle.small.copyWith(
        color: AppColors.black,
        height: 1.2,
      ),
    );
  }

  Widget buildPrice(double? price) {
    if (price == null) {
      return const SizedBox.shrink();
    }
    return Text(
      price.formatCurrency,
      style: AppTextStyle.small.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      maxLines: 1,
    );
  }

  Widget buildAddToCartWidget() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        minimumSize: const Size(32, 32),
      ),
      onPressed: () {
        ref.read(cartProvider.notifier).addProduct(widget.product);
      },
      child: const Icon(
        Icons.shopping_cart,
        size: 15,
        color: AppColors.white,
      ),
    );
  }
}
