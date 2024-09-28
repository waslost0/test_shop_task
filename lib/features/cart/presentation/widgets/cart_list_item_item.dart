import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/core/utils/numer_formatter.dart';
import 'package:test_shop_task/core/widgets/app_slidable.dart';
import 'package:test_shop_task/core/widgets/card_widget.dart';
import 'package:test_shop_task/core/widgets/safe_network_image.dart';
import 'package:test_shop_task/features/cart/domain/entities/cart_entity.dart';
import 'package:test_shop_task/features/cart/presentation/provider/cart_provider.dart';
import 'package:test_shop_task/features/cart/presentation/provider/state/cart_notifier.dart';
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
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => model.deleteItem(index),
          child: AspectRatio(
            aspectRatio: 0.7,
            child: Container(
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
          ),
        ),
      ],
      extentRatio: 0.2,
      child: CardWidget(
        color: AppColors.lightRed,
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.all(7),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.lightRed,
          ),
          child: Row(
            children: [
              _buildProductImage(),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTitle(),
                    const SizedBox(height: 18),
                    buildPriceCounter(model),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      item.product?.name ?? 'Name',
      style: AppTextStyle.body,
    );
  }

  Widget buildPriceCounter(CartNotifier model) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${item.product?.price?.formatCurrency}',
          style: AppTextStyle.body.copyWith(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: ProductCounterWidget(
              count: item.count,
              onDecrement: () => model.decrementItem(index),
              onIncrement: () => model.increaseItem(index),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductImage() {
    return SizedBox(
      width: 80,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SafeNetworkImage(
          imageUrl: item.product?.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
