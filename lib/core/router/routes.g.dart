// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $myShellRouteData,
      $loginRoute,
    ];

RouteBase get $myShellRouteData => StatefulShellRouteData.$route(
      restorationScopeId: MyShellRouteData.$restorationScopeId,
      navigatorContainerBuilder: MyShellRouteData.$navigatorContainerBuilder,
      factory: $MyShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/catalog',
              factory: $CatalogRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'productList',
                  factory: $ProductListRouteDataExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'productDetail',
                      factory: $ProductDetailRouteDataExtension._fromState,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/cart',
              factory: $CartRouteDataExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/profile',
              factory: $ProfileRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'edit',
                  factory: $EditProfileRouteDataExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $MyShellRouteDataExtension on MyShellRouteData {
  static MyShellRouteData _fromState(GoRouterState state) =>
      const MyShellRouteData();
}

extension $CatalogRouteDataExtension on CatalogRouteData {
  static CatalogRouteData _fromState(GoRouterState state) => CatalogRouteData(
        parentId: _$convertMapValue(
            'parent-id', state.uri.queryParameters, int.parse),
        title: state.uri.queryParameters['title'],
      );

  String get location => GoRouteData.$location(
        '/catalog',
        queryParams: {
          if (parentId != null) 'parent-id': parentId!.toString(),
          if (title != null) 'title': title,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProductListRouteDataExtension on ProductListRouteData {
  static ProductListRouteData _fromState(GoRouterState state) =>
      ProductListRouteData(
        categoryId: _$convertMapValue(
            'category-id', state.uri.queryParameters, int.parse),
        title: state.uri.queryParameters['title'],
      );

  String get location => GoRouteData.$location(
        '/catalog/productList',
        queryParams: {
          if (categoryId != null) 'category-id': categoryId!.toString(),
          if (title != null) 'title': title,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProductDetailRouteDataExtension on ProductDetailRouteData {
  static ProductDetailRouteData _fromState(GoRouterState state) =>
      ProductDetailRouteData(
        productId: int.parse(state.uri.queryParameters['product-id']!),
      );

  String get location => GoRouteData.$location(
        '/catalog/productList/productDetail',
        queryParams: {
          'product-id': productId.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CartRouteDataExtension on CartRouteData {
  static CartRouteData _fromState(GoRouterState state) => const CartRouteData();

  String get location => GoRouteData.$location(
        '/cart',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileRouteDataExtension on ProfileRouteData {
  static ProfileRouteData _fromState(GoRouterState state) =>
      const ProfileRouteData();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EditProfileRouteDataExtension on EditProfileRouteData {
  static EditProfileRouteData _fromState(GoRouterState state) =>
      const EditProfileRouteData();

  String get location => GoRouteData.$location(
        '/profile/edit',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/auth',
      factory: $LoginRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'phoneConfirm',
          factory: $PhoneConfirmRouteExtension._fromState,
        ),
      ],
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute();

  String get location => GoRouteData.$location(
        '/auth',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PhoneConfirmRouteExtension on PhoneConfirmRoute {
  static PhoneConfirmRoute _fromState(GoRouterState state) => PhoneConfirmRoute(
        phoneNumber: state.uri.queryParameters['phone-number']!,
      );

  String get location => GoRouteData.$location(
        '/auth/phoneConfirm',
        queryParams: {
          'phone-number': phoneNumber,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
