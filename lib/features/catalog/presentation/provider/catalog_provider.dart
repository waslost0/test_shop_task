import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/di/injection.dart';
import 'package:test_shop_task/features/catalog/domain/usecases/category_list_usecase.dart';
import 'package:test_shop_task/features/catalog/presentation/provider/state/catalog_notifier.dart';
import 'package:test_shop_task/features/catalog/presentation/provider/state/catalog_state.dart';

final catalogProvider = StateNotifierProvider<CatalogNotifier, CatalogState>(
  (ref) {
    return CatalogNotifier(getIt<CatalogRepositoryUseCase>())..loginList();
  },
);
