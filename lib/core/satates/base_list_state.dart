import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/params/list_params.dart';

 class BaseListState<T> {
  bool isLoading;
  bool isAllLoaded;
  bool isFullReloading;
  ListParams listParams;
  AppFailure? exception;
  List<T> items;

  bool get hasError => exception?.message?.isNotEmpty ?? false;

  String? get searchString => listParams.searchString;

  String? get errorMessage => exception?.message;

  BaseListState({
    this.isAllLoaded = false,
    this.isLoading = false,
    this.isFullReloading = false,
    this.listParams = const ListParams(),
    this.items = const [],
    this.exception,
  });

  BaseListState copyWith({
    bool? isLoading,
    bool? isAllLoaded,
    bool? isFullReloading,
    ListParams? listParams,
    List<T>? items,
    AppFailure? exception,
  }) {
    return BaseListState(
      isLoading: isLoading ?? this.isLoading,
      isFullReloading: isFullReloading ?? this.isFullReloading,
      isAllLoaded: isAllLoaded ?? this.isAllLoaded,
      listParams: listParams ?? this.listParams,
      items: items ?? this.items,
      exception: exception ?? this.exception,
    );
  }
}
