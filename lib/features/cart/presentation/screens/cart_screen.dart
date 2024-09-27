import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/core/utils/numer_formatter.dart';
import 'package:test_shop_task/core/widgets/card_widget.dart';
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
    return Stack(
      children: [
        ListView.separated(
          itemCount: state.list.length,
          itemBuilder: (context, index) => CartListItem(
            item: state.list[index],
            index: index,
          ),
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 175,
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 16),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: buildSummaryInfo(),
        ),
      ],
    );
  }

  Widget buildSummaryInfo() {
    final model = ref.read(cartProvider.notifier);
    return CardWidget(
      boxShadow: [
        BoxShadow(
          color: AppColors.grey.withOpacity(0.3),
          blurRadius: 4,
          spreadRadius: 2,
        ),
      ],
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Количество товаров',
                style: AppTextStyle.body.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Text(
                  "${model.productCount()}",
                  style: AppTextStyle.body.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Общая стоимость заказа',
                style: AppTextStyle.body.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              Expanded(
                child: Text(
                  model.totalPrice().formatCurrency,
                  style: AppTextStyle.body.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Оформить заказ'),
          ),
        ],
      ),
    );
  }
}
