import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/logic/app_model.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';
import 'package:test_shop_task/features/catalog/presentation/provider/state/catalog_state.dart';
import 'package:test_shop_task/features/product/presentation/provider/product_provider.dart';

class ProductListPage extends BasePage {
  final CategoryEntity category;

  const ProductListPage({
    super.key,
    super.title = 'Продукты',
    required this.category,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ProductListPageState();
}

class ProductListPageState extends BasePageState<ProductListPage> {
  late AppModel appModel = ref.read(appModelProvider);

  @override
  Widget buildBody(BuildContext context) {
    final model = ref.read(productProvider.notifier);
    final state = ref.watch(productProvider);
    return RefreshIndicator(
      onRefresh: () => model.reloadData(),
      child: state is Loading
          ? const Center(child: CircularProgressIndicator())
          : buildGrid(),
    );
  }

  Widget buildGrid() {
    final state = ref.watch(productProvider);
    return GridView.builder(
      itemCount: state.list.length,
      itemBuilder: (context, index) => Placeholder(),
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
