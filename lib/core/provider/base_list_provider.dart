import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/satates/base_list_state.dart';

/// Abstract class providing a base implementation for state management of lists.
///
/// This class extends [StateNotifier] and uses [BaseListState] to manage the state of a list,
/// including loading status, pagination, and data manipulation. It provides methods for loading,
/// refreshing, resetting, and searching the list.
///
/// [TState] represents the specific type of list state.
/// [TList] represents the type of items in the list.
abstract class BaseListStateProvider<TState extends BaseListState<TList>, TList>
    extends StateNotifier<TState> {
  BaseListStateProvider(super.state);

  bool get isLoading => state.isLoading;

  /// Returns true if all items have been loaded, false otherwise.
  bool get isAllLoaded => state.isAllLoaded;

  /// Abstract method to be implemented by subclasses for loading the next set of items.
  Future<void> loadNextItems();

  Future<void> loadData() async {
    if (isAllLoaded || isLoading) {
      return;
    }
    state = state.copyWith(isLoading: true) as TState;
    await loadNextItems();
  }

  /// Updates the state after loading the next set of items.
  ///
  /// Appends the new items to the existing list or replaces the entire list if [isFullReloading] is true.
  /// Updates pagination parameters and sets [isAllLoaded] based on the loaded items.
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

  /// Reloads the entire list.
  ///
  /// [soft] If true, performs a soft reload (keeps existing items), otherwise performs a hard reload (clears existing items).
  Future<void> reloadData({
    bool soft = true,
  }) async {
    reset(soft: soft);
    state.isFullReloading = true;
    await loadData();
  }

  /// Resets the list to its initial state.
  ///
  /// [soft] If true, performs a soft reset (keeps existing items), otherwise performs a hard reset (clears existing items).
  ///
  /// Clears loading status, resets pagination parameters, and optionally clears the list.
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

  /// Performs a search on the list.
  ///
  /// [searchString] The search query.
  ///
  /// Updates the search string in the list parameters and reloads the data.
  Future<void> search(String? searchString) async {
    state = state.copyWith(
      listParams: state.listParams.copyWith(
        searchString: searchString,
      ),
    ) as TState;
    await reloadData();
  }
}