import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/satates/base_list_state.dart';

abstract class BaseListStateProvider<TState extends BaseListState<TList>, TList>
    extends StateNotifier<TState> {
  BaseListStateProvider(super.state);

  bool get isLoading => state.isLoading;

  bool get isAllLoaded => state.isAllLoaded;

  Future<void> loadNextItems();

  Future<void> loadData() async {
    if (isAllLoaded || isLoading) {
      return;
    }
    state = state.copyWith(isLoading: true) as TState;
    await loadNextItems();
  }

  Future<void> onNextItemsLoaded(List<TList> nextItems) async {
    state = state.copyWith(
      isLoading: false,
      isFullReloading: false,
      items: state.isFullReloading ? nextItems : [...state.items, ...nextItems],
      listParams: state.listParams.copyWith(
        offset: state.listParams.offset + nextItems.length,
      ),
      isAllLoaded: nextItems.isEmpty,
    ) as TState;
  }

  Future<void> reloadData({
    bool soft = true,
  }) async {
    reset(soft: soft);
    state.isFullReloading = true;
    await loadData();
  }

  void reset({bool soft = false}) {
    state = state.copyWith(
      isLoading: false,
      isFullReloading: false,
      items: soft ? state.items : [],
      listParams: state.listParams.copyWith(
        offset: 0,
        searchString: state.listParams.searchString,
      ),
      isAllLoaded: false,
      exception: null,
    ) as TState;
  }

  Future<void> search(String? searchString) async {
    state = state.copyWith(
      listParams: state.listParams.copyWith(
        searchString: searchString,
      ),
    ) as TState;
    await reloadData();
  }
}
