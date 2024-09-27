import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/features/cart/presentation/provider/cart_provider.dart';
import 'package:test_shop_task/features/cart/presentation/screens/cart_screen.dart';

class CartCountButton extends ConsumerWidget {
  const CartCountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProvider);
    final model = ref.read(cartProvider.notifier);

    return FutureBuilder(
      future: model.cartItemCountCount(),
      builder: (context, snapshot) {
        final count = snapshot.data ?? state.list.length;
        return _buildNotificationIcon(count, context);
      },
    );
  }

  Widget _buildNotificationIcon(
    int count,
    BuildContext context,
  ) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CartListPage(),
        ));
      },
      icon: Stack(
        children: [
          const Icon(
            Icons.shopping_bag,
            size: 30,
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              alignment: Alignment.center,
              width: 15,
              height: 15,
              padding: Platform.isIOS
                  ? const EdgeInsets.only(bottom: 0.4)
                  : const EdgeInsets.only(top: 0.4),
              decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: FittedBox(
                child: Text(
                  count.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}