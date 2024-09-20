// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_model_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppModelState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  Config get config => throw _privateConstructorUsedError;

  /// Create a copy of AppModelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppModelStateCopyWith<AppModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppModelStateCopyWith<$Res> {
  factory $AppModelStateCopyWith(
          AppModelState value, $Res Function(AppModelState) then) =
      _$AppModelStateCopyWithImpl<$Res, AppModelState>;
  @useResult
  $Res call({bool isLoading, String? error, Config config});
}

/// @nodoc
class _$AppModelStateCopyWithImpl<$Res, $Val extends AppModelState>
    implements $AppModelStateCopyWith<$Res> {
  _$AppModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppModelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? config = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppModelStateImplCopyWith<$Res>
    implements $AppModelStateCopyWith<$Res> {
  factory _$$AppModelStateImplCopyWith(
          _$AppModelStateImpl value, $Res Function(_$AppModelStateImpl) then) =
      __$$AppModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, Config config});
}

/// @nodoc
class __$$AppModelStateImplCopyWithImpl<$Res>
    extends _$AppModelStateCopyWithImpl<$Res, _$AppModelStateImpl>
    implements _$$AppModelStateImplCopyWith<$Res> {
  __$$AppModelStateImplCopyWithImpl(
      _$AppModelStateImpl _value, $Res Function(_$AppModelStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppModelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? config = null,
  }) {
    return _then(_$AppModelStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ));
  }
}

/// @nodoc

class _$AppModelStateImpl implements _AppModelState {
  const _$AppModelStateImpl(
      {this.isLoading = true, this.error = null, required this.config});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String? error;
  @override
  final Config config;

  @override
  String toString() {
    return 'AppModelState(isLoading: $isLoading, error: $error, config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppModelStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error, config);

  /// Create a copy of AppModelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppModelStateImplCopyWith<_$AppModelStateImpl> get copyWith =>
      __$$AppModelStateImplCopyWithImpl<_$AppModelStateImpl>(this, _$identity);
}

abstract class _AppModelState implements AppModelState {
  const factory _AppModelState(
      {final bool isLoading,
      final String? error,
      required final Config config}) = _$AppModelStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  Config get config;

  /// Create a copy of AppModelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppModelStateImplCopyWith<_$AppModelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
