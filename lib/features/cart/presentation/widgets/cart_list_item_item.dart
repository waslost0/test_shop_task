import 'package:flutter/material.dart';
import 'package:test_shop_task/features/cart/domain/entities/cart_entity.dart';

class CartListItem extends StatefulWidget {
  final CartItemEntity item;

  const CartListItem({
    super.key,
    required this.item,
  });

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
