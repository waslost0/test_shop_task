import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/core/utils/debouncer/debouncer.dart';

class AppSearchBar extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFocusChanged;
  final ValueChanged<String>? onSubmitted;

  final String? initString;

  const AppSearchBar({
    super.key,
    this.onChanged,
    this.onFocusChanged,
    this.onSubmitted,
    this.initString,
  });

  @override
  AppSearchBarState createState() => AppSearchBarState();
}

class AppSearchBarState extends State<AppSearchBar> {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  final Debouncer debouncer = Debouncer();

  @override
  void initState() {
    _searchController.text = widget.initString ?? '';
    _searchFocusNode.addListener(() {
      widget.onFocusChanged?.call();
      setState(() {});
    });
    _searchController.addListener(() {
      if (_searchController.text.isNotEmpty) setState(() {});
      if (_searchFocusNode.hasFocus) {
        debouncer.call(
          () => _onSearch(_searchController.text.trim()),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _searchController,
      focusNode: _searchFocusNode,
      onSubmitted: _onSubmitted,
      textInputAction: TextInputAction.search,
      hintText: 'Поиск',
      leading: Icon(
        Icons.search,
        size: 16,
      ),
      trailing: [
        if (isSearchActive)
          CupertinoButton(
            minSize: 24,
            padding: EdgeInsets.zero,
            onPressed: () {
              _searchController.clear();
              _searchFocusNode.unfocus();
            },
            child: const Icon(
              Icons.cancel_outlined,
              size: 24,
              color: AppColors.lightBlack,
            ),
          ),
      ],
    );
  }

  InputDecoration textFieldDecoration() {
    return InputDecoration(
      prefixIconConstraints: BoxConstraints.tight(const Size(40, 36)),
      prefixIcon: Center(
        child: const SizedBox(
          height: 24,
          width: 24,
          child: Icon(Icons.search),
        ),
      ),
      hintText: 'Поиск',
      suffixIconConstraints: BoxConstraints.tight(const Size(40, 36)),
      suffixIcon: !isSearchActive
          ? null
          : CupertinoButton(
              minSize: 24,
              padding: EdgeInsets.zero,
              onPressed: () {
                _searchController.clear();
                _searchFocusNode.unfocus();
              },
              child: const Icon(
                Icons.cancel_outlined,
                size: 24,
                color: AppColors.lightBlack,
              ),
            ),
    );
  }

  void _onSearch(String searchString) {
    widget.onChanged?.call(searchString);
  }

  void _onSubmitted(String searchString) {
    _searchFocusNode.unfocus();
    _onSearch(searchString.trim());
  }

  void clear() {
    _searchController.clear();
    widget.onChanged?.call('');
  }

  bool get isSearchActive {
    return _searchFocusNode.hasFocus && _searchController.text.isNotEmpty;
  }
}
