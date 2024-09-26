import 'package:base_flutter/core/model/app_model.dart';
import 'package:base_flutter/core/model/helpers/assets_catalog.dart';
import 'package:base_flutter/core/theme/theme_builder.dart';
import 'package:base_flutter/core/view/extension/simple_padding_extension.dart';
import 'package:base_flutter/core/view/image/safe_network_image.dart';
import 'package:base_flutter/core/view/widgets/card_widget.dart';
import 'package:base_flutter/core/view/widgets/slidable/app_slidable.dart';
import 'package:base_flutter/l10n/plural_strings.dart';
import 'package:base_flutter/shop/products/model/entities/shopping_cart_item.dart';
import 'package:base_flutter/shop/products/model/shopping_cart_list_model.dart';
import 'package:base_flutter/shop/products/view/mixin/add_product_shopping_cart_mixin.dart';
import 'package:base_flutter/shop/products/view/product_counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ShoppingCartItemWidget extends StatelessWidget
    with AddProductShoppingCartMixin {
  final ShoppingCartItem item;
  final AppModel appModel;
  final NumberFormat formatter = NumberFormat.simpleCurrency(
    locale: "RU_ru",
    name: "₽",
  );

  final VoidCallback? onRemoveProduct;

  ShoppingCartItemWidget({
    required this.item,
    required this.appModel,
    this.onRemoveProduct,
  });

  ShoppingCartListModel get shoppingCart => appModel.shopModule.shoppingCart;

  bool get avaliableAmountLoaded => !shoppingCart.isRecommendedLoading.value;

  bool get currentItemOrderEnabled => item.product.orderEnabled();

  @override
  Widget build(BuildContext context) {
    return AppSlidable(
      extentRatio: 0.23,
      key: ValueKey(item),
      actionPaneBuilder: () {
        return [
          GestureDetector(
            onTap: () {
              shoppingCart.setSoppingCartCount(
                item: item,
                count: 0,
              );
              onRemoveProduct?.call();
            },
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                AssetsCatalog.icDelete,
                color: AppColors.white,
              ),
            ),
          ),
        ];
      },
      child: CardWidget(
        borderRadius: BorderRadius.circular(22),
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildProductImage(context, item.product.imageUrl),
                  SizedBox(width: 20),
                  Expanded(
                    child: currentItemOrderEnabled
                        ? _buildProductDetailsAvailable(context)
                        : _buildProductDetailsNotAvailable(context),
                  ),
                ],
              ),
            ),
            if (currentItemOrderEnabled &&
                item.product.blockOnAmount(item.count) &&
                avaliableAmountLoaded)
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "В наличии только ${PluralStrings.pluralPortions(item.product.amount)}",
                  style: AppTextStyle.body1.copyWith(
                    color: AppColors.amaranthRed,
                  ),
                ).rightPadding(10),
              ).topPadding(8),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(BuildContext context, String? imageUrl) {
    return SizedBox(
      width: 100,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Container(
          foregroundDecoration: BoxDecoration(
            color: currentItemOrderEnabled
                ? null
                : AppColors.grey.withOpacity(0.64),
          ),
          child: SafeNetworkImage(imageUrl: imageUrl),
        ),
      ),
    );
  }

  Widget _buildProductDetailsAvailable(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle(),
            SizedBox(height: 4),
            buildWeightOrVolume(),
            if (item.product.modifiersText.isNotEmpty) ...[
              SizedBox(height: 5),
              buildModifiers(),
            ],
          ],
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: buildPrice(),
              ),
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: buildAddToCartButton(context),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductDetailsNotAvailable(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: buildTitle()),
            GestureDetector(
              onTap: () => shoppingCart.setProductCount(
                product: item.product,
                count: 0,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Image.asset(AssetsCatalog.icDelete),
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        buildWeightOrVolume(),
        Spacer(),
        Flexible(child: builtProductNotAvailableText()),
      ],
    );
  }

  Widget buildTitle() {
    return Text(
      item.product.name.replaceAll('\n', ''),
      style: AppTextStyle.body2.copyWith(
        color: currentItemOrderEnabled ? null : AppColors.grey,
        height: 1,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  String get priceText => "${NumberFormat.currency(
    locale: "ru_RU",
    symbol: '₽',
    decimalDigits: 0,
  ).format(item.product.price)}";

  Widget buildWeightOrVolume() {
    return Text(
      "${item.product.weightOrVolume} ${item.product.unitUsed.isGram ? "г" : "мл"}",
      style: AppTextStyle.body1.copyWith(
        height: 1,
        color: currentItemOrderEnabled ? AppColors.hint : AppColors.grey,
      ),
    );
  }

  Widget buildModifiers() {
    return Text(
      "${item.product.modifiersText}",
      style: AppTextStyle.smallText.copyWith(
        height: 1.2,
        color: currentItemOrderEnabled ? AppColors.hint : AppColors.grey,
      ),
    );
  }

  Widget buildPrice() {
    return Text(
      priceText,
      style: AppTextStyle.body2.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget buildAddToCartButton(BuildContext context) {
    return Consumer<ShoppingCartListModel>(
      builder: (BuildContext context, ShoppingCartListModel shoppingCart, _) {
        return ProductCounterWidget.filled(
          count: item.count,
          onInc: () => shoppingCart.setSoppingCartCount(
            item: item,
            count: item.count + 1,
          ),
          maxCount: item.product.amount,
          onDec: () {
            var count = item.count - 1;
            shoppingCart.setSoppingCartCount(
              item: item,
              count: count,
            );
            if (count == 0) {
              onRemoveProduct?.call();
            }
          },
        );
      },
    );
  }

  Widget builtProductNotAvailableText() {
    return Text(
      item.product.isNotFindedOnServer
          ? "Товар закончился"
          : "Товар недоступен к заказу",
      style: AppTextStyle.body1.copyWith(
        color: AppColors.amaranthRed,
        height: 1,
      ),
    );
  }
}
