import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/params/list_params.dart';
import 'package:test_shop_task/features/catalog/domain/usecases/category_list_usecase.dart';
import 'package:test_shop_task/features/catalog/presentation/provider/state/catalog_state.dart';

class CatalogNotifier extends StateNotifier<CatalogState> {
  final CatalogRepositoryUseCase loadList;

  CatalogNotifier(
    this.loadList,
  ) : super(const CatalogState.initial());

  Future<void> loginList() async {
    if (state.list.isEmpty) {
      state = Loading(listParams: state.listParams);
    }
    final result = await loadList.call(
      state.listParams,
    );

    state = await result.fold(
      (l) => CatalogState.failure(exception: l),
      (r) => CatalogState.success(
        list: [...state.list, ...r],
        listParams: ListParams(
          offset: state.listParams.offset + r.length,
        ),
      ),
    );
  }

  Future<void> reloadData() async {
    state = state.copyWith(listParams: const ListParams());

    final result = await loadList.call(
      const ListParams(),
    );

    state = await result.fold(
      (l) => CatalogState.failure(exception: l),
      (r) => CatalogState.success(
        list: r,
        listParams: ListParams(
          offset: state.listParams.offset + r.length,
        ),
      ),
    );
  }
}
