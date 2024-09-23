// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CatalogState {
  List<CategoryEntity> get list => throw _privateConstructorUsedError;
  CategoryListParams get listParams => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CategoryEntity> list, CategoryListParams listParams)
        initial,
    required TResult Function(
            List<CategoryEntity> list, CategoryListParams listParams)
        loading,
    required TResult Function(List<CategoryEntity> list,
            CategoryListParams listParams, Failure exception)
        failure,
    required TResult Function(
            List<CategoryEntity> list, CategoryListParams listParams)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams)?
        initial,
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams)?
        loading,
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams,
            Failure exception)?
        failure,
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams)?
        initial,
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams)?
        loading,
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams,
            Failure exception)?
        failure,
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CatalogFailure value) failure,
    required TResult Function(Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CatalogFailure value)? failure,
    TResult? Function(Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CatalogFailure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CatalogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CatalogStateCopyWith<CatalogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogStateCopyWith<$Res> {
  factory $CatalogStateCopyWith(
          CatalogState value, $Res Function(CatalogState) then) =
      _$CatalogStateCopyWithImpl<$Res, CatalogState>;
  @useResult
  $Res call({List<CategoryEntity> list, CategoryListParams listParams});
}

/// @nodoc
class _$CatalogStateCopyWithImpl<$Res, $Val extends CatalogState>
    implements $CatalogStateCopyWith<$Res> {
  _$CatalogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CatalogState
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
              as List<CategoryEntity>,
      listParams: null == listParams
          ? _value.listParams
          : listParams // ignore: cast_nullable_to_non_nullable
              as CategoryListParams,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CatalogStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CategoryEntity> list, CategoryListParams listParams});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CatalogStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CatalogState
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
              as List<CategoryEntity>,
      listParams: null == listParams
          ? _value.listParams
          : listParams // ignore: cast_nullable_to_non_nullable
              as CategoryListParams,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl(
      {final List<CategoryEntity> list = const [],
      this.listParams = const CategoryListParams()})
      : _list = list;

  final List<CategoryEntity> _list;
  @override
  @JsonKey()
  List<CategoryEntity> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  @JsonKey()
  final CategoryListParams listParams;

  @override
  String toString() {
    return 'CatalogState.initial(list: $list, listParams: $listParams)';
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

  /// Create a copy of CatalogState
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
            List<CategoryEntity> list, CategoryListParams listParams)
        initial,
    required TResult Function(
            List<CategoryEntity> list, CategoryListParams listParams)
        loading,
    required TResult Function(List<CategoryEntity> list,
            CategoryListParams listParams, Failure exception)
        failure,
    required TResult Function(
            List<CategoryEntity> list, CategoryListParams listParams)
        success,
  }) {
    return initial(list, listParams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams)?
        initial,
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams)?
        loading,
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams,
            Failure exception)?
        failure,
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams)?
        success,
  }) {
    return initial?.call(list, listParams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams)?
        initial,
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams)?
        loading,
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams,
            Failure exception)?
        failure,
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams)?
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
    required TResult Function(CatalogFailure value) failure,
    required TResult Function(Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CatalogFailure value)? failure,
    TResult? Function(Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CatalogFailure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements CatalogState {
  const factory Initial(
      {final List<CategoryEntity> list,
      final CategoryListParams listParams}) = _$InitialImpl;

  @override
  List<CategoryEntity> get list;
  @override
  CategoryListParams get listParams;

  /// Create a copy of CatalogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $CatalogStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CategoryEntity> list, CategoryListParams listParams});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CatalogStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CatalogState
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
              as List<CategoryEntity>,
      listParams: null == listParams
          ? _value.listParams
          : listParams // ignore: cast_nullable_to_non_nullable
              as CategoryListParams,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl(
      {final List<CategoryEntity> list = const [],
      this.listParams = const CategoryListParams()})
      : _list = list;

  final List<CategoryEntity> _list;
  @override
  @JsonKey()
  List<CategoryEntity> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  @JsonKey()
  final CategoryListParams listParams;

  @override
  String toString() {
    return 'CatalogState.loading(list: $list, listParams: $listParams)';
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

  /// Create a copy of CatalogState
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
            List<CategoryEntity> list, CategoryListParams listParams)
        initial,
    required TResult Function(
            List<CategoryEntity> list, CategoryListParams listParams)
        loading,
    required TResult Function(List<CategoryEntity> list,
            CategoryListParams listParams, Failure exception)
        failure,
    required TResult Function(
            List<CategoryEntity> list, CategoryListParams listParams)
        success,
  }) {
    return loading(list, listParams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams)?
        initial,
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams)?
        loading,
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams,
            Failure exception)?
        failure,
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams)?
        success,
  }) {
    return loading?.call(list, listParams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams)?
        initial,
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams)?
        loading,
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams,
            Failure exception)?
        failure,
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams)?
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
    required TResult Function(CatalogFailure value) failure,
    required TResult Function(Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CatalogFailure value)? failure,
    TResult? Function(Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CatalogFailure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements CatalogState {
  const factory Loading(
      {final List<CategoryEntity> list,
      final CategoryListParams listParams}) = _$LoadingImpl;

  @override
  List<CategoryEntity> get list;
  @override
  CategoryListParams get listParams;

  /// Create a copy of CatalogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CatalogFailureImplCopyWith<$Res>
    implements $CatalogStateCopyWith<$Res> {
  factory _$$CatalogFailureImplCopyWith(_$CatalogFailureImpl value,
          $Res Function(_$CatalogFailureImpl) then) =
      __$$CatalogFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CategoryEntity> list,
      CategoryListParams listParams,
      Failure exception});
}

/// @nodoc
class __$$CatalogFailureImplCopyWithImpl<$Res>
    extends _$CatalogStateCopyWithImpl<$Res, _$CatalogFailureImpl>
    implements _$$CatalogFailureImplCopyWith<$Res> {
  __$$CatalogFailureImplCopyWithImpl(
      _$CatalogFailureImpl _value, $Res Function(_$CatalogFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of CatalogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? listParams = null,
    Object? exception = null,
  }) {
    return _then(_$CatalogFailureImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
      listParams: null == listParams
          ? _value.listParams
          : listParams // ignore: cast_nullable_to_non_nullable
              as CategoryListParams,
      exception: null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$CatalogFailureImpl implements CatalogFailure {
  const _$CatalogFailureImpl(
      {final List<CategoryEntity> list = const [],
      this.listParams = const CategoryListParams(),
      required this.exception})
      : _list = list;

  final List<CategoryEntity> _list;
  @override
  @JsonKey()
  List<CategoryEntity> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  @JsonKey()
  final CategoryListParams listParams;
  @override
  final Failure exception;

  @override
  String toString() {
    return 'CatalogState.failure(list: $list, listParams: $listParams, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogFailureImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.listParams, listParams) ||
                other.listParams == listParams) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_list), listParams, exception);

  /// Create a copy of CatalogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogFailureImplCopyWith<_$CatalogFailureImpl> get copyWith =>
      __$$CatalogFailureImplCopyWithImpl<_$CatalogFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CategoryEntity> list, CategoryListParams listParams)
        initial,
    required TResult Function(
            List<CategoryEntity> list, CategoryListParams listParams)
        loading,
    required TResult Function(List<CategoryEntity> list,
            CategoryListParams listParams, Failure exception)
        failure,
    required TResult Function(
            List<CategoryEntity> list, CategoryListParams listParams)
        success,
  }) {
    return failure(list, listParams, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams)?
        initial,
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams)?
        loading,
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams,
            Failure exception)?
        failure,
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams)?
        success,
  }) {
    return failure?.call(list, listParams, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams)?
        initial,
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams)?
        loading,
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams,
            Failure exception)?
        failure,
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams)?
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
    required TResult Function(CatalogFailure value) failure,
    required TResult Function(Success value) success,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CatalogFailure value)? failure,
    TResult? Function(Success value)? success,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CatalogFailure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class CatalogFailure implements CatalogState {
  const factory CatalogFailure(
      {final List<CategoryEntity> list,
      final CategoryListParams listParams,
      required final Failure exception}) = _$CatalogFailureImpl;

  @override
  List<CategoryEntity> get list;
  @override
  CategoryListParams get listParams;
  Failure get exception;

  /// Create a copy of CatalogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CatalogFailureImplCopyWith<_$CatalogFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $CatalogStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CategoryEntity> list, CategoryListParams listParams});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$CatalogStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of CatalogState
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
              as List<CategoryEntity>,
      listParams: null == listParams
          ? _value.listParams
          : listParams // ignore: cast_nullable_to_non_nullable
              as CategoryListParams,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl(
      {required final List<CategoryEntity> list, required this.listParams})
      : _list = list;

  final List<CategoryEntity> _list;
  @override
  List<CategoryEntity> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final CategoryListParams listParams;

  @override
  String toString() {
    return 'CatalogState.success(list: $list, listParams: $listParams)';
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

  /// Create a copy of CatalogState
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
            List<CategoryEntity> list, CategoryListParams listParams)
        initial,
    required TResult Function(
            List<CategoryEntity> list, CategoryListParams listParams)
        loading,
    required TResult Function(List<CategoryEntity> list,
            CategoryListParams listParams, Failure exception)
        failure,
    required TResult Function(
            List<CategoryEntity> list, CategoryListParams listParams)
        success,
  }) {
    return success(list, listParams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams)?
        initial,
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams)?
        loading,
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams,
            Failure exception)?
        failure,
    TResult? Function(List<CategoryEntity> list, CategoryListParams listParams)?
        success,
  }) {
    return success?.call(list, listParams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams)?
        initial,
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams)?
        loading,
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams,
            Failure exception)?
        failure,
    TResult Function(List<CategoryEntity> list, CategoryListParams listParams)?
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
    required TResult Function(CatalogFailure value) failure,
    required TResult Function(Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CatalogFailure value)? failure,
    TResult? Function(Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CatalogFailure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements CatalogState {
  const factory Success(
      {required final List<CategoryEntity> list,
      required final CategoryListParams listParams}) = _$SuccessImpl;

  @override
  List<CategoryEntity> get list;
  @override
  CategoryListParams get listParams;

  /// Create a copy of CatalogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
