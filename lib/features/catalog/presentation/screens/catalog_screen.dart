import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/router/routes.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/features/cart/presentation/widgets/cart_count_button.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';
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
  int itemsCount(Success state) {
    if (widget.parentId == null) {
      return state.list.length + 1;
    }
    return state.list.length;
  }

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
        failure: (value) =>
            buildEmptyPlaceholder(value.exception.message ?? ''),
        success: (value) => buildListView(value),
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

  Widget buildListView(Success state) {
    if (state.list.isEmpty) {
      return buildEmptyPlaceholder('Список пуст');
    }
    return ListView.separated(
      itemCount: itemsCount(state),
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        if (index == 0) {
          return GestureDetector(
            onTap: () {
              ProductListRouteData().push(context);
            },
            child: CategoryListItem(
              CategoryEntity(categoryId: 0, title: 'Все товары'),
            ),
          );
        }
        index--;
        return GestureDetector(
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
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 10),
    );
  }
}
