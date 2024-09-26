import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    return Column(
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
    );
  }
}
