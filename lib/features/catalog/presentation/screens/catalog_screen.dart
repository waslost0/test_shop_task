import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/logic/app_model.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/features/catalog/presentation/provider/catalog_provider.dart';
import 'package:test_shop_task/features/catalog/presentation/provider/state/catalog_state.dart';

class CatalogPage extends BasePage {
  const CatalogPage({
    super.key,
    super.title = 'Каталог',
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => CatalogPageState();
}

class CatalogPageState extends BasePageState<CatalogPage> {
  late AppModel appModel = ref.read(appModelProvider);

  @override
  Widget buildBody(BuildContext context) {
    final model = ref.read(catalogProvider.notifier);
    final state = ref.watch(catalogProvider);
    return RefreshIndicator(
      onRefresh: () => model.reloadData(),
      child: state is Loading
          ? const Center(child: CircularProgressIndicator())
          : buildGrid(),
    );
  }

  Widget buildGrid() {
    final state = ref.watch(catalogProvider);

    return GridView.builder(
      gridDelegate: createGridDelegate(),
      itemCount: state.list.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) => const Placeholder(),
    );
  }

  @protected
  SliverGridDelegate createGridDelegate() {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: getCrossAxisCount(context),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1.0,
    );
  }

  @protected
  int getCrossAxisCount(BuildContext context) {
    return 2;
  }
}
