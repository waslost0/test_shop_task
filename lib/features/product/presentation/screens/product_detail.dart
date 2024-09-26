import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
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
  @override
  Widget buildBody(BuildContext context) {
    final state = ref.watch(productProvider(widget.productId));
    return state is Loading
        ? const Center(child: CircularProgressIndicator())
        : buildGrid();
  }

  Widget buildGrid() {
    final state = ref.watch(productProvider(widget.productId));
    if (state is Failure) {
      return const Center(
        child: Text(
          'Список пуст',
          style: AppTextStyle.title,
        ),
      );
    }
    return Placeholder();
  }
}
