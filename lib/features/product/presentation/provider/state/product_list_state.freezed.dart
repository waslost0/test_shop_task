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
  ProductListParams get listParams => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ProductEntity> list, ProductListParams listParams)
        initial,
    required TResult Function(
            List<ProductEntity> list, ProductListParams listParams)
        loading,
    required TResult Function(List<ProductEntity> list,
            ProductListParams listParams, AppFailure exception)
        failure,
    required TResult Function(
            List<ProductEntity> list, ProductListParams listParams)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductEntity> list, ProductListParams listParams)?
        initial,
    TResult? Function(List<ProductEntity> list, ProductListParams listParams)?
        loading,
    TResult? Function(List<ProductEntity> list, ProductListParams listParams,
            AppFailure exception)?
        failure,
    TResult? Function(List<ProductEntity> list, ProductListParams listParams)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductEntity> list, ProductListParams listParams)?
        initial,
    TResult Function(List<ProductEntity> list, ProductListParams listParams)?
        loading,
    TResult Function(List<ProductEntity> list, ProductListParams listParams,
            AppFailure exception)?
        failure,
    TResult Function(List<ProductEntity> list, ProductListParams listParams)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

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
  $Res call({List<ProductEntity> list, ProductListParams listParams});
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
    Object? listParams = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      listParams: null == listParams
          ? _value.listParams
          : listParams // ignore: cast_nullable_to_non_nullable
              as ProductListParams,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ProductListStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductEntity> list, ProductListParams listParams});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProductListStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? listParams = null,
  }) {
    return _then(_$InitialImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      listParams: null == listParams
          ? _value.listParams
          : listParams // ignore: cast_nullable_to_non_nullable
              as ProductListParams,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl(
      {final List<ProductEntity> list = const [],
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
  @JsonKey()
  final ProductListParams listParams;

  @override
  String toString() {
    return 'ProductListState.initial(list: $list, listParams: $listParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.listParams, listParams) ||
                other.listParams == listParams));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), listParams);

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ProductEntity> list, ProductListParams listParams)
        initial,
    required TResult Function(
            List<ProductEntity> list, ProductListParams listParams)
        loading,
    required TResult Function(List<ProductEntity> list,
            ProductListParams listParams, AppFailure exception)
        failure,
    required TResult Function(
            List<ProductEntity> list, ProductListParams listParams)
        success,
  }) {
    return initial(list, listParams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductEntity> list, ProductListParams listParams)?
        initial,
    TResult? Function(List<ProductEntity> list, ProductListParams listParams)?
        loading,
    TResult? Function(List<ProductEntity> list, ProductListParams listParams,
            AppFailure exception)?
        failure,
    TResult? Function(List<ProductEntity> list, ProductListParams listParams)?
        success,
  }) {
    return initial?.call(list, listParams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductEntity> list, ProductListParams listParams)?
        initial,
    TResult Function(List<ProductEntity> list, ProductListParams listParams)?
        loading,
    TResult Function(List<ProductEntity> list, ProductListParams listParams,
            AppFailure exception)?
        failure,
    TResult Function(List<ProductEntity> list, ProductListParams listParams)?
        success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(list, listParams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ProductListState {
  const factory Initial(
      {final List<ProductEntity> list,
      final ProductListParams listParams}) = _$InitialImpl;

  @override
  List<ProductEntity> get list;
  @override
  ProductListParams get listParams;

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $ProductListStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductEntity> list, ProductListParams listParams});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ProductListStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? listParams = null,
  }) {
    return _then(_$LoadingImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      listParams: null == listParams
          ? _value.listParams
          : listParams // ignore: cast_nullable_to_non_nullable
              as ProductListParams,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl(
      {final List<ProductEntity> list = const [],
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
  @JsonKey()
  final ProductListParams listParams;

  @override
  String toString() {
    return 'ProductListState.loading(list: $list, listParams: $listParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.listParams, listParams) ||
                other.listParams == listParams));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), listParams);

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ProductEntity> list, ProductListParams listParams)
        initial,
    required TResult Function(
            List<ProductEntity> list, ProductListParams listParams)
        loading,
    required TResult Function(List<ProductEntity> list,
            ProductListParams listParams, AppFailure exception)
        failure,
    required TResult Function(
            List<ProductEntity> list, ProductListParams listParams)
        success,
  }) {
    return loading(list, listParams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductEntity> list, ProductListParams listParams)?
        initial,
    TResult? Function(List<ProductEntity> list, ProductListParams listParams)?
        loading,
    TResult? Function(List<ProductEntity> list, ProductListParams listParams,
            AppFailure exception)?
        failure,
    TResult? Function(List<ProductEntity> list, ProductListParams listParams)?
        success,
  }) {
    return loading?.call(list, listParams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductEntity> list, ProductListParams listParams)?
        initial,
    TResult Function(List<ProductEntity> list, ProductListParams listParams)?
        loading,
    TResult Function(List<ProductEntity> list, ProductListParams listParams,
            AppFailure exception)?
        failure,
    TResult Function(List<ProductEntity> list, ProductListParams listParams)?
        success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(list, listParams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ProductListState {
  const factory Loading(
      {final List<ProductEntity> list,
      final ProductListParams listParams}) = _$LoadingImpl;

  @override
  List<ProductEntity> get list;
  @override
  ProductListParams get listParams;

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res>
    implements $ProductListStateCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductEntity> list,
      ProductListParams listParams,
      AppFailure exception});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$ProductListStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? listParams = null,
    Object? exception = null,
  }) {
    return _then(_$FailureImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      listParams: null == listParams
          ? _value.listParams
          : listParams // ignore: cast_nullable_to_non_nullable
              as ProductListParams,
      exception: null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppFailure,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements Failure {
  const _$FailureImpl(
      {final List<ProductEntity> list = const [],
      this.listParams = const ProductListParams(),
      required this.exception})
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
  @JsonKey()
  final ProductListParams listParams;
  @override
  final AppFailure exception;

  @override
  String toString() {
    return 'ProductListState.failure(list: $list, listParams: $listParams, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.listParams, listParams) ||
                other.listParams == listParams) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_list), listParams, exception);

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ProductEntity> list, ProductListParams listParams)
        initial,
    required TResult Function(
            List<ProductEntity> list, ProductListParams listParams)
        loading,
    required TResult Function(List<ProductEntity> list,
            ProductListParams listParams, AppFailure exception)
        failure,
    required TResult Function(
            List<ProductEntity> list, ProductListParams listParams)
        success,
  }) {
    return failure(list, listParams, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductEntity> list, ProductListParams listParams)?
        initial,
    TResult? Function(List<ProductEntity> list, ProductListParams listParams)?
        loading,
    TResult? Function(List<ProductEntity> list, ProductListParams listParams,
            AppFailure exception)?
        failure,
    TResult? Function(List<ProductEntity> list, ProductListParams listParams)?
        success,
  }) {
    return failure?.call(list, listParams, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductEntity> list, ProductListParams listParams)?
        initial,
    TResult Function(List<ProductEntity> list, ProductListParams listParams)?
        loading,
    TResult Function(List<ProductEntity> list, ProductListParams listParams,
            AppFailure exception)?
        failure,
    TResult Function(List<ProductEntity> list, ProductListParams listParams)?
        success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(list, listParams, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements ProductListState {
  const factory Failure(
      {final List<ProductEntity> list,
      final ProductListParams listParams,
      required final AppFailure exception}) = _$FailureImpl;

  @override
  List<ProductEntity> get list;
  @override
  ProductListParams get listParams;
  AppFailure get exception;

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $ProductListStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductEntity> list, ProductListParams listParams});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ProductListStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? listParams = null,
  }) {
    return _then(_$SuccessImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      listParams: null == listParams
          ? _value.listParams
          : listParams // ignore: cast_nullable_to_non_nullable
              as ProductListParams,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl(
      {required final List<ProductEntity> list, required this.listParams})
      : _list = list;

  final List<ProductEntity> _list;
  @override
  List<ProductEntity> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final ProductListParams listParams;

  @override
  String toString() {
    return 'ProductListState.success(list: $list, listParams: $listParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.listParams, listParams) ||
                other.listParams == listParams));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), listParams);

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ProductEntity> list, ProductListParams listParams)
        initial,
    required TResult Function(
            List<ProductEntity> list, ProductListParams listParams)
        loading,
    required TResult Function(List<ProductEntity> list,
            ProductListParams listParams, AppFailure exception)
        failure,
    required TResult Function(
            List<ProductEntity> list, ProductListParams listParams)
        success,
  }) {
    return success(list, listParams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductEntity> list, ProductListParams listParams)?
        initial,
    TResult? Function(List<ProductEntity> list, ProductListParams listParams)?
        loading,
    TResult? Function(List<ProductEntity> list, ProductListParams listParams,
            AppFailure exception)?
        failure,
    TResult? Function(List<ProductEntity> list, ProductListParams listParams)?
        success,
  }) {
    return success?.call(list, listParams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductEntity> list, ProductListParams listParams)?
        initial,
    TResult Function(List<ProductEntity> list, ProductListParams listParams)?
        loading,
    TResult Function(List<ProductEntity> list, ProductListParams listParams,
            AppFailure exception)?
        failure,
    TResult Function(List<ProductEntity> list, ProductListParams listParams)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(list, listParams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements ProductListState {
  const factory Success(
      {required final List<ProductEntity> list,
      required final ProductListParams listParams}) = _$SuccessImpl;

  @override
  List<ProductEntity> get list;
  @override
  ProductListParams get listParams;

  /// Create a copy of ProductListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
