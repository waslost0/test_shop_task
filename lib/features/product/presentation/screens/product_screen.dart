import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/router/routes.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/core/widgets/search_bar.dart';
import 'package:test_shop_task/features/cart/presentation/widgets/cart_count_button.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';
import 'package:test_shop_task/features/product/presentation/mixins/product_list_mixin.dart';
import 'package:test_shop_task/features/product/presentation/provider/product_list_provider.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_list_state.dart';
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

class ProductListPageState extends BasePageState<ProductListPage>
    with ProductListMixin {
  @override
  List<Widget> buildAppBarActions() {
    return [const CartCountButton()];
  }

  @override
  Widget buildBody(BuildContext context) {
    final model = ref.read(productListProvider(widget.category).notifier);
    final state = ref.watch(productListProvider(widget.category));
    if (state.isLoading && state.list.isEmpty) {
      return buildLoadingIndicator();
    }
    return RefreshIndicator(
      onRefresh: () => model.reloadData(),
      child: buildGrid(state),
    );
  }

  Widget buildEmptyPlaceholder(String? message) {
    return Center(
      child: Text(
        message ?? 'Список пуст',
        style: AppTextStyle.title,
      ),
    );
  }

  Widget buildGrid(ProductListState state) {
    if (state.isAllLoaded && state.list.isEmpty) {
      return buildEmptyPlaceholder('Список пуст');
    }

    return Stack(
      children: [
        if (state.list.isEmpty)
          buildEmptyPlaceholder('Список пуст')
        else
          GridView.builder(
            itemCount: state.list.length,
            itemBuilder: (context, index) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) => tryPreloadNextItems(index),
              );
              return GestureDetector(
                onTap: () {
                  ProductDetailRouteData(
                    productId: state.list[index].productId,
                  ).push(context);
                },
                child: ProductGridItem(
                  product: state.list[index],
                ),
              );
            },
            gridDelegate: createGridDelegate(context),
            padding: const EdgeInsets.only(
              top: 66,
              left: 16,
              right: 16,
              bottom: 16,
            ),
          ),
        buildSearchBar(state),
      ],
    );
  }

  Widget buildSearchBar(ProductListState state) {
    if (state.list.isEmpty && state.isAllLoaded && state.searchString == null) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: AppSearchBar(onChanged: onSearch),
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
