import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_shop_task/features/auth/presentation/screen/auth_by_phone.dart';
import 'package:test_shop_task/features/auth/presentation/screen/phone_confirmation_page.dart';
import 'package:test_shop_task/features/cart/presentation/screens/cart_screen.dart';
import 'package:test_shop_task/features/catalog/presentation/screens/catalog_screen.dart';
import 'package:test_shop_task/features/navigation/bottom_navigation.dart';
import 'package:test_shop_task/features/product/presentation/screens/product_detail.dart';
import 'package:test_shop_task/features/product/presentation/screens/product_screen.dart';
import 'package:test_shop_task/features/user/presentation/screen/edit_profile_page.dart';
import 'package:test_shop_task/features/user/presentation/screen/profile_page.dart';

part 'routes.g.dart';

class AppRoutes {
  static const String catalog = '/catalog';
  static const String cart = '/cart';
  static const String productList = 'productList';
  static const String productDetail = 'productDetail';
  static const String profile = '/profile';
  static const String edit = 'edit';
  static const String auth = '/auth';
  static const String phoneConfirm = 'phoneConfirm';
}

@TypedStatefulShellRoute<MyShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<BranchAData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<CatalogRouteData>(
          path: AppRoutes.catalog,
          routes: [
            TypedGoRoute<ProductListRouteData>(
              path: AppRoutes.productList,
              routes: [
                TypedGoRoute<ProductDetailRouteData>(
                  path: AppRoutes.productDetail,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<BranchAData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<CartRouteData>(path: AppRoutes.cart),
      ],
    ),
    TypedStatefulShellBranch<BranchCData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ProfileRouteData>(
          path: AppRoutes.profile,
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<EditProfileRouteData>(
              path: AppRoutes.edit,
            ),
          ],
        ),
      ],
    ),
  ],
)
class MyShellRouteData extends StatefulShellRouteData {
  const MyShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return navigationShell;
  }

  static const String $restorationScopeId = 'restorationScopeId';

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) {
    return BottomNavigation(
      navigationShell: navigationShell,
      children: children,
    );
  }
}

@TypedGoRoute<LoginRoute>(
  path: AppRoutes.auth,
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<PhoneConfirmRoute>(
      path: AppRoutes.phoneConfirm,
    ),
  ],
)
class LoginRoute extends GoRouteData {
  LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AuthByPhonePage();
  }
}

class PhoneConfirmRoute extends GoRouteData {
  final String phoneNumber;

  PhoneConfirmRoute({required this.phoneNumber});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PhoneConfirmationFormPage(phoneNumber: phoneNumber);
  }
}

class BranchAData extends StatefulShellBranchData {
  const BranchAData();
}

class BranchBData extends StatefulShellBranchData {
  const BranchBData();
}

class BranchCData extends StatefulShellBranchData {
  const BranchCData();
}

class ProfileRouteData extends GoRouteData {
  const ProfileRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfilePage();
  }
}

class EditProfileRouteData extends GoRouteData {
  const EditProfileRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EditProfilePage();
  }
}

class CatalogRouteData extends GoRouteData {
  final int? parentId;

  const CatalogRouteData([this.parentId]);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CatalogListPage(parentId: parentId);
  }
}

class CartRouteData extends GoRouteData {
  const CartRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CartListPage();
  }
}

class ProductListRouteData extends GoRouteData {
  final int? categoryId;

  const ProductListRouteData({this.categoryId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProductListPage(categoryId: categoryId);
  }
}

class ProductDetailRouteData extends GoRouteData {
  final int productId;

  const ProductDetailRouteData({
    required this.productId,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProductDetailPage(productId: productId);
  }
}
