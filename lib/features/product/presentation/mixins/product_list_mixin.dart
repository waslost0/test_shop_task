import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/features/product/presentation/provider/product_list_provider.dart';
import 'package:test_shop_task/features/product/presentation/screens/product_screen.dart';

mixin ProductListMixin<T extends ProductListPage> on BasePageState<T> {
  void onSearch(String searchString) async {
    final state = ref.read(productListProvider(widget.category));
    final model = ref.read(productListProvider(widget.category).notifier);
    if (searchString.isNotEmpty &&
        state.listParams.searchString?.trim() == searchString.trim() &&
        state.list.isNotEmpty) return;
    showLoadingIndicator();
    await model.reloadData(searchString: searchString);
    hideLoadingIndicator();
  }
}
