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
      items: [...state.items, ...nextItems],
      listParams: state.listParams.copyWith(
        offset: state.listParams.offset + nextItems.length,
      ),
      isAllLoaded: nextItems.isEmpty,
    ) as TState;
  }
}
