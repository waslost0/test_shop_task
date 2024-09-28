// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductListState {
  List<ProductEntity> get list => throw _privateConstructorUsedError;
  AppFailure? get exception => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isAllLoaded => throw _privateConstructorUsedError;
  ProductListParams get listParams => throw _privateConstructorUsedError;

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductListStateCopyWith<ProductListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListStateCopyWith<$Res> {
  factory $ProductListStateCopyWith(
          ProductListState value, $Res Function(ProductListState) then) =
      _$ProductListStateCopyWithImpl<$Res, ProductListState>;
  @useResult
  $Res call(
      {List<ProductEntity> list,
      AppFailure? exception,
      bool isLoading,
      bool isAllLoaded,
      ProductListParams listParams});
}

/// @nodoc
class _$ProductListStateCopyWithImpl<$Res, $Val extends ProductListState>
    implements $ProductListStateCopyWith<$Res> {
  _$ProductListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? exception = freezed,
    Object? isLoading = null,
    Object? isAllLoaded = null,
    Object? listParams = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppFailure?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAllLoaded: null == isAllLoaded
          ? _value.isAllLoaded
          : isAllLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      listParams: null == listParams
          ? _value.listParams
          : listParams // ignore: cast_nullable_to_non_nullable
              as ProductListParams,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductListStateImplCopyWith<$Res>
    implements $ProductListStateCopyWith<$Res> {
  factory _$$ProductListStateImplCopyWith(_$ProductListStateImpl value,
          $Res Function(_$ProductListStateImpl) then) =
      __$$ProductListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductEntity> list,
      AppFailure? exception,
      bool isLoading,
      bool isAllLoaded,
      ProductListParams listParams});
}

/// @nodoc
class __$$ProductListStateImplCopyWithImpl<$Res>
    extends _$ProductListStateCopyWithImpl<$Res, _$ProductListStateImpl>
    implements _$$ProductListStateImplCopyWith<$Res> {
  __$$ProductListStateImplCopyWithImpl(_$ProductListStateImpl _value,
      $Res Function(_$ProductListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? exception = freezed,
    Object? isLoading = null,
    Object? isAllLoaded = null,
    Object? listParams = null,
  }) {
    return _then(_$ProductListStateImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppFailure?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAllLoaded: null == isAllLoaded
          ? _value.isAllLoaded
          : isAllLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      listParams: null == listParams
          ? _value.listParams
          : listParams // ignore: cast_nullable_to_non_nullable
              as ProductListParams,
    ));
  }
}

/// @nodoc

class _$ProductListStateImpl implements _ProductListState {
  const _$ProductListStateImpl(
      {final List<ProductEntity> list = const [],
      this.exception,
      this.isLoading = false,
      this.isAllLoaded = false,
      this.listParams = const ProductListParams()})
      : _list = list;

  final List<ProductEntity> _list;
  @override
  @JsonKey()
  List<ProductEntity> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final AppFailure? exception;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isAllLoaded;
  @override
  @JsonKey()
  final ProductListParams listParams;

  @override
  String toString() {
    return 'ProductListState(list: $list, exception: $exception, isLoading: $isLoading, isAllLoaded: $isAllLoaded, listParams: $listParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductListStateImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isAllLoaded, isAllLoaded) ||
                other.isAllLoaded == isAllLoaded) &&
            (identical(other.listParams, listParams) ||
                other.listParams == listParams));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_list),
      exception,
      isLoading,
      isAllLoaded,
      listParams);

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductListStateImplCopyWith<_$ProductListStateImpl> get copyWith =>
      __$$ProductListStateImplCopyWithImpl<_$ProductListStateImpl>(
          this, _$identity);
}

abstract class _ProductListState implements ProductListState {
  const factory _ProductListState(
      {final List<ProductEntity> list,
      final AppFailure? exception,
      final bool isLoading,
      final bool isAllLoaded,
      final ProductListParams listParams}) = _$ProductListStateImpl;

  @override
  List<ProductEntity> get list;
  @override
  AppFailure? get exception;
  @override
  bool get isLoading;
  @override
  bool get isAllLoaded;
  @override
  ProductListParams get listParams;

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductListStateImplCopyWith<_$ProductListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
