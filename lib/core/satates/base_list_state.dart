import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/params/list_params.dart';

 class BaseListState<T> {
  bool isLoading;
  bool isAllLoaded;
  ListParams listParams;
  AppFailure? exception;
  List<T> items;

  bool get hasError => exception?.message?.isNotEmpty ?? false;

  String? get searchString => listParams.searchString;

  String? get errorMessage => exception?.message;

  BaseListState({
    this.isAllLoaded = false,
    this.isLoading = false,
    this.listParams = const ListParams(),
    this.items = const [],
    this.exception,
  });

  BaseListState copyWith({
    bool? isLoading,
    bool? isAllLoaded,
    ListParams? listParams,
    List<T>? items,
    AppFailure? exception,
  }) {
    return BaseListState(
      isLoading: isLoading ?? this.isLoading,
      isAllLoaded: isAllLoaded ?? this.isAllLoaded,
      listParams: listParams ?? this.listParams,
      items: items ?? this.items,
      exception: exception ?? this.exception,
    );
  }
}
