import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/logic/app_model.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/features/cart/presentation/widgets/cart_count_button.dart';
import 'package:test_shop_task/features/catalog/presentation/provider/catalog_provider.dart';
import 'package:test_shop_task/features/catalog/presentation/provider/state/catalog_state.dart';
import 'package:test_shop_task/features/catalog/presentation/widgets/category_list_item.dart';
import 'package:test_shop_task/features/product/presentation/screens/product_screen.dart';

class CatalogPage extends BasePage {
  final int? parentId;

  const CatalogPage({
    this.parentId,
    super.key,
    super.title = 'Каталог',
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => CatalogPageState();
}

class CatalogPageState extends BasePageState<CatalogPage> {
  late AppModel appModel = ref.read(appModelProvider);

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
      child: state is Loading
          ? const Center(child: CircularProgressIndicator())
          : buildListView(state),
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
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (context) => CatalogPage(
                  parentId: category.categoryId,
                ),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductListPage(
                  category: category,
                ),
              ),
            );
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
