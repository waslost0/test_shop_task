import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
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
  final PageController pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.onPrimaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 8),
            blurRadius: 28.0,
            spreadRadius: 0,
            color: AppColors.black.withOpacity(0.06),
          ),
        ],
      ),
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: buildProductGallery(),
          ),
          if (widget.product.images.length > 1)
            buildPageIndicator(widget.product.images.length),
        ],
      ),
    );
  }

  Widget buildPageIndicator(int length) {
    return Positioned(
      bottom: 12,
      child: SmoothPageIndicator(
        controller: pageController,
        count: widget.product.images.length,
        effect: const WormEffect(
          spacing: 4,
          dotWidth: 8,
          dotHeight: 2,
          activeDotColor: AppColors.secondaryColor,
          dotColor: AppColors.lightGrey,
        ),
      ),
    );
  }

  Widget buildProductGallery() {
    var imageList = widget.product.images;
    if (imageList.length < 2) {
      return SafeNetworkImage(
        imageUrl: imageList.firstOrNull,
      );
    }
    return PageView.builder(
      padEnds: false,
      controller: pageController,
      itemCount: imageList.length,
      onPageChanged: (value) {
        _currentPageNotifier.value = value;
      },
      itemBuilder: (BuildContext context, int index) {
        var item = imageList[index];
        return SafeNetworkImage(
          imageUrl: item,
        );
      },
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

  Widget buildPrice(num? price) {
    if (price == null) {
      return const SizedBox.shrink();
    }
    return Text(
      price.toString(),
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
        Icons.add_shopping_cart_rounded,
      ),
    );
  }
}
