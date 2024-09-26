import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/core/widgets/app_slidable.dart';
import 'package:test_shop_task/core/widgets/card_widget.dart';
import 'package:test_shop_task/core/widgets/safe_network_Image.dart';
import 'package:test_shop_task/features/cart/domain/entities/cart_entity.dart';
import 'package:test_shop_task/features/cart/presentation/provider/cart_provider.dart';
import 'package:test_shop_task/features/cart/presentation/widgets/product_count_widget.dart';

class CartListItem extends ConsumerWidget {
  final CartItemEntity item;
  final int index;

  const CartListItem({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartProvider);
    final model = ref.read(cartProvider.notifier);

    return AppSlidable(
      actionPaneBuilder: () => [
        Container(
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(10),
          child: const Icon(
            Icons.delete,
            color: AppColors.white,
          ),
        ),
      ],
      // extentRatio: 0.3,
      child: CardWidget(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeNetworkImage(
              imageUrl: item.product?.imageUrl,
            ),
            ProductCounterWidget(
              count: item.count,
              onDecrement: () => model.decrementItem(index),
              onIncrement: () => model.increaseItem(index),
            ),
          ],
        ),
      ),
    );
  }
}
