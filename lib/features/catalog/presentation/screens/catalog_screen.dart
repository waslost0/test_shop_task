import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/router/routes.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/features/cart/presentation/widgets/cart_count_button.dart';
import 'package:test_shop_task/features/catalog/presentation/provider/catalog_provider.dart';
import 'package:test_shop_task/features/catalog/presentation/provider/state/catalog_state.dart';
import 'package:test_shop_task/features/catalog/presentation/widgets/category_list_item.dart';

class CatalogListPage extends BasePage {
  final int? parentId;

  const CatalogListPage({
    this.parentId,
    super.key,
    super.title = 'Каталог',
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => CatalogListPageState();
}

class CatalogListPageState extends BasePageState<CatalogListPage> {
  @override
  List<Widget> buildAppBarActions() {
    return [const CartCountButton()];
  }

  @override
  Widget buildBody(BuildContext context) {
    final model = ref.read(catalogProvider(widget.parentId).notifier);
    final state = ref.watch(catalogProvider(widget.parentId));
    return RefreshIndicator(
      onRefresh: () => model.reloadData(),
      child: state.map(
        initial: (value) => buildLoadingIndicator(),
        loading: (value) => buildLoadingIndicator(),
        failure: (value) => Text(value.exception.message ?? ''),
        success: (value) => buildListView(value),
      ),
    );
  }

  Widget buildListView(CatalogState state) {
    if (state.list.isEmpty) {
      return const Center(
        child: Text(
          'Список пуст',
          style: AppTextStyle.title,
        ),
      );
    }
    return ListView.separated(
      itemCount: state.list.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          final category = state.list[index];
          if (category.hasSubcategories) {
            CatalogRouteData(category.categoryId).push(context);
          } else {
            ProductListRouteData(category).push(context);
          }
        },
        child: CategoryListItem(
          state.list[index],
        ),
      ),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 10),
    );
  }
}
