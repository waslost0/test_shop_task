import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/features/product/presentation/provider/product_list_provider.dart';
import 'package:test_shop_task/features/product/presentation/screens/product_screen.dart';

mixin ProductListMixin<T extends ProductListPage> on BasePageState<T> {
  int get infinityScrollOffset => 1;

  void onSearch(String searchString) async {
    final state = ref.read(productListProvider(widget.categoryId));
    final model = ref.read(productListProvider(widget.categoryId).notifier);
    if (state.listParams.searchString?.trim() == searchString.trim()) {
      return;
    }
    if (searchString.isNotEmpty &&
        state.listParams.searchString?.trim() == searchString.trim() &&
        state.items.isNotEmpty) return;
    showLoadingIndicator();
    await model.search(searchString);
    hideLoadingIndicator();
  }

  void tryPreloadNextItems(int renderedItemIndex) {
    final state = ref.read(productListProvider(widget.categoryId));
    if (state.isLoading || state.items.isEmpty || state.isAllLoaded) return;

    final model = ref.read(productListProvider(widget.categoryId).notifier);
    var isListEnd =
        (renderedItemIndex >= (state.items.length - infinityScrollOffset));
    if (isListEnd) {
      model.loadData();
    }
  }
}
