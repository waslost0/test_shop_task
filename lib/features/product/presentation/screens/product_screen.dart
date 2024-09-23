import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/core/widgets/safe_networkImage.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';
import 'package:test_shop_task/features/catalog/presentation/provider/state/catalog_state.dart';
import 'package:test_shop_task/features/product/presentation/provider/product_provider.dart';

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
  Widget buildBody(BuildContext context) {
    final model = ref.read(productProvider(widget.category).notifier);
    final state = ref.watch(productProvider(widget.category));
    return RefreshIndicator(
      onRefresh: () => model.reloadData(),
      child: state is Loading
          ? const Center(child: CircularProgressIndicator())
          : buildGrid(),
    );
  }

  Widget buildGrid() {
    final state = ref.watch(productProvider(widget.category));
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
      itemBuilder: (context, index) => SafeNetworkImage(
        imageUrl: state.list[index].imageUrl,
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

  double get childAspectRatio => 1.0;
}
