import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/core/utils/numer_formatter.dart';
import 'package:test_shop_task/core/widgets/card_widget.dart';
import 'package:test_shop_task/core/widgets/expandable_text.dart';
import 'package:test_shop_task/core/widgets/full_screen_photo_page.dart';
import 'package:test_shop_task/core/widgets/safe_network_image.dart';
import 'package:test_shop_task/features/cart/presentation/provider/cart_provider.dart';
import 'package:test_shop_task/features/cart/presentation/widgets/cart_count_button.dart';
import 'package:test_shop_task/features/product/presentation/provider/product_detail_provider.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_detail_state.dart';

class ProductDetailPage extends BasePage {
  final int productId;

  const ProductDetailPage({
    super.key,
    super.title = 'Продукт',
    required this.productId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ProductDetailPageState();
}

class ProductDetailPageState extends BasePageState<ProductDetailPage> {
  final PageController pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  @override
  List<Widget> buildAppBarActions() {
    return [const CartCountButton()];
  }

  @override
  Widget buildBody(BuildContext context) {
    final state = ref.watch(productDetailProvider(widget.productId));
    return state.map(
      initial: (value) => buildLoadingIndicator(),
      loading: (value) => buildLoadingIndicator(),
      failure: (value) => buildEmptyPlaceholder(value.exception.message),
      success: (value) => buildContent(value),
    );
  }

  Widget buildContent(Success state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeader(state),
          const SizedBox(height: 16),
          buildName(state),
          const SizedBox(height: 16),
          buildDescription(state),
          const SizedBox(height: 16),
          buildAddToCartButton(state),
        ],
      ),
    );
  }

  Widget buildEmptyPlaceholder(String? message) {
    return Center(
      child: Text(
        message ?? 'Не удалось загрузить товар',
        style: AppTextStyle.title,
      ),
    );
  }

  Widget buildHeader(Success state) {
    return CardWidget(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1.8,
            child: buildProductGallery(),
          ),
          if (state.product.images.length > 1)
            buildPageIndicator(
              state.product.images.length,
            ),
        ],
      ),
    );
  }

  Widget buildPageIndicator(int length) {
    return Positioned(
      bottom: 8,
      child: SmoothPageIndicator(
        controller: pageController,
        count: length,
        effect: const WormEffect(
          spacing: 4,
          dotWidth: 22,
          dotHeight: 3,
          radius: 4,
          activeDotColor: AppColors.secondaryColor,
          dotColor: AppColors.lightGrey,
        ),
      ),
    );
  }

  Widget buildProductGallery() {
    final state = ref.read(productDetailProvider(widget.productId)) as Success;
    if (state.product.images.length < 2) {
      return SafeNetworkImage.customFile(
        customFile: state.product.images.firstOrNull,
      );
    }
    return PageView.builder(
      padEnds: false,
      controller: pageController,
      itemCount: state.product.images.length,
      onPageChanged: (value) {
        _currentPageNotifier.value = value;
      },
      itemBuilder: (BuildContext context, int index) {
        var image = state.product.images[index];
        return GestureDetector(
          onTap: () {
            FullscreenPhotoPage.openPage(
              context,
              state.product.images.map((e) => e).toList(),
              initialIndex: index,
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeNetworkImage.customFile(
              customFile: image,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }

  Widget buildName(Success state) {
    return CardWidget(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            state.product.name,
            style: AppTextStyle.body.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            state.product.price?.formatCurrency ?? "",
            style: AppTextStyle.title2.copyWith(
              color: AppColors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDescription(Success state) {
    return CardWidget(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Описание',
            style: AppTextStyle.title2,
          ),
          const SizedBox(height: 5),
          ExpandableTextWidget(
            state.product.productDescription ?? '',
            moreStyle: AppTextStyle.body.copyWith(
              color: AppColors.red,
              fontWeight: FontWeight.w500,
            ),
            lessStyle: AppTextStyle.body.copyWith(
              color: AppColors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddToCartButton(Success state) {
    return ElevatedButton(
      onPressed: () {
        ref.read(cartProvider.notifier).addProduct(state.product);
      },
      child: const Text('Добавить в корзину'),
    );
  }
}
