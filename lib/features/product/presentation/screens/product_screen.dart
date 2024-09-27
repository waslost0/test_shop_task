import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/features/cart/presentation/widgets/cart_count_button.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';
import 'package:test_shop_task/features/product/presentation/provider/product_list_provider.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_list_state.dart';
import 'package:test_shop_task/features/product/presentation/screens/product_detail.dart';
import 'package:test_shop_task/features/product/presentation/widgets/product_grid_item.dart';

class ProductListPage extends BasePage {
  final CategoryEntity? category;

  const ProductListPage({
    super.key,
    super.title = 'Продукты',
    this.category,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ProductListPageState();
}

class ProductListPageState extends BasePageState<ProductListPage> {
  @override
  List<Widget> buildAppBarActions() {
    return [const CartCountButton()];
  }

  @override
  Widget buildBody(BuildContext context) {
    final model = ref.read(productListProvider(widget.category).notifier);
    final state = ref.watch(productListProvider(widget.category));
    return RefreshIndicator(
      onRefresh: () => model.reloadData(),
      child: state is Loading
          ? const Center(child: CircularProgressIndicator())
          : buildGrid(),
    );
  }

  Widget buildGrid() {
    final state = ref.watch(productListProvider(widget.category));
    if (state.list.isEmpty) {
      return const Center(
        child: Text(
          'Список пуст',
          style: AppTextStyle.title,
        ),
      );
    }
    return GridView.builder(
      itemCount: state.list.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(
                productId: state.list[index].productId,
              ),
            ),
          );
        },
        child: ProductGridItem(
          product: state.list[index],
        ),
      ),
      gridDelegate: createGridDelegate(context),
      padding: const EdgeInsets.all(16),
    );
  }

  @protected
  int getCrossAxisCount(BuildContext context) {
    return 2;
  }

  @protected
  SliverGridDelegate createGridDelegate(BuildContext context) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: getCrossAxisCount(context),
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      childAspectRatio: childAspectRatio,
    );
  }

  double get mainAxisSpacing => 10;

  double get crossAxisSpacing => 10;

  double get childAspectRatio => 0.65;
}
