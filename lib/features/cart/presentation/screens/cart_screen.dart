import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/features/cart/presentation/provider/cart_provider.dart';
import 'package:test_shop_task/features/cart/presentation/provider/state/cart_state.dart';
import 'package:test_shop_task/features/cart/presentation/widgets/cart_list_item_item.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';

class CartListPage extends BasePage {
  final CategoryEntity? category;

  const CartListPage({
    super.key,
    super.title = 'Корзина',
    this.category,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => CartListPageState();
}

class CartListPageState extends BasePageState<CartListPage> {
  @override
  List<Widget> buildAppBarActions() {
    return [
      TextButton(
        onPressed: () {
          ref.read(cartProvider.notifier).clearCart();
        },
        child: const Text('Очистить'),
      ),
    ];
  }

  @override
  Widget buildBody(BuildContext context) {
    final state = ref.watch(cartProvider);
    return state.map(
      initial: (_) => buildLoadingIndicator(),
      loading: (_) => buildLoadingIndicator(),
      failure: (value) => buildEmptyPlaceholder(
        value.exception.message,
      ),
      success: (state) => buildList(state),
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

  Widget buildList(Success state) {
    final state = ref.watch(cartProvider);
    if (state.list.isEmpty) {
      return buildEmptyPlaceholder('Список пуст');
    }
    // TODO: Total count price
    return ListView.separated(
      itemCount: state.list.length,
      itemBuilder: (context, index) => CartListItem(
        item: state.list[index],
        index: index,
      ),
      padding: const EdgeInsets.all(16),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 16),
    );
  }
}
