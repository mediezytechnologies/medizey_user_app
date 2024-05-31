// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_three_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgetPasswordThreeEvent {
  String get newPassword => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newPassword) successPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newPassword)? successPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newPassword)? successPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuccessPassword value) successPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuccessPassword value)? successPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuccessPassword value)? successPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgetPasswordThreeEventCopyWith<ForgetPasswordThreeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPasswordThreeEventCopyWith<$Res> {
  factory $ForgetPasswordThreeEventCopyWith(ForgetPasswordThreeEvent value,
          $Res Function(ForgetPasswordThreeEvent) then) =
      _$ForgetPasswordThreeEventCopyWithImpl<$Res, ForgetPasswordThreeEvent>;
  @useResult
  $Res call({String newPassword});
}

/// @nodoc
class _$ForgetPasswordThreeEventCopyWithImpl<$Res,
        $Val extends ForgetPasswordThreeEvent>
    implements $ForgetPasswordThreeEventCopyWith<$Res> {
  _$ForgetPasswordThreeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
  }) {
    return _then(_value.copyWith(
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuccessPasswordImplCopyWith<$Res>
    implements $ForgetPasswordThreeEventCopyWith<$Res> {
  factory _$$SuccessPasswordImplCopyWith(_$SuccessPasswordImpl value,
          $Res Function(_$SuccessPasswordImpl) then) =
      __$$SuccessPasswordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String newPassword});
}

/// @nodoc
class __$$SuccessPasswordImplCopyWithImpl<$Res>
    extends _$ForgetPasswordThreeEventCopyWithImpl<$Res, _$SuccessPasswordImpl>
    implements _$$SuccessPasswordImplCopyWith<$Res> {
  __$$SuccessPasswordImplCopyWithImpl(
      _$SuccessPasswordImpl _value, $Res Function(_$SuccessPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
  }) {
    return _then(_$SuccessPasswordImpl(
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessPasswordImpl implements _SuccessPassword {
  const _$SuccessPasswordImpl({required this.newPassword});

  @override
  final String newPassword;

  @override
  String toString() {
    return 'ForgetPasswordThreeEvent.successPassword(newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessPasswordImpl &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessPasswordImplCopyWith<_$SuccessPasswordImpl> get copyWith =>
      __$$SuccessPasswordImplCopyWithImpl<_$SuccessPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newPassword) successPassword,
  }) {
    return successPassword(newPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newPassword)? successPassword,
  }) {
    return successPassword?.call(newPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newPassword)? successPassword,
    required TResult orElse(),
  }) {
    if (successPassword != null) {
      return successPassword(newPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuccessPassword value) successPassword,
  }) {
    return successPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuccessPassword value)? successPassword,
  }) {
    return successPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuccessPassword value)? successPassword,
    required TResult orElse(),
  }) {
    if (successPassword != null) {
      return successPassword(this);
    }
    return orElse();
  }
}

abstract class _SuccessPassword implements ForgetPasswordThreeEvent {
  const factory _SuccessPassword({required final String newPassword}) =
      _$SuccessPasswordImpl;

  @override
  String get newPassword;
  @override
  @JsonKey(ignore: true)
  _$$SuccessPasswordImplCopyWith<_$SuccessPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgetPasswordThreeState {
  bool get isloding => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  SuccessPasswordModel? get successPasswordModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgetPasswordThreeStateCopyWith<ForgetPasswordThreeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPasswordThreeStateCopyWith<$Res> {
  factory $ForgetPasswordThreeStateCopyWith(ForgetPasswordThreeState value,
          $Res Function(ForgetPasswordThreeState) then) =
      _$ForgetPasswordThreeStateCopyWithImpl<$Res, ForgetPasswordThreeState>;
  @useResult
  $Res call(
      {bool isloding,
      bool isError,
      String message,
      bool status,
      SuccessPasswordModel? successPasswordModel});
}

/// @nodoc
class _$ForgetPasswordThreeStateCopyWithImpl<$Res,
        $Val extends ForgetPasswordThreeState>
    implements $ForgetPasswordThreeStateCopyWith<$Res> {
  _$ForgetPasswordThreeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloding = null,
    Object? isError = null,
    Object? message = null,
    Object? status = null,
    Object? successPasswordModel = freezed,
  }) {
    return _then(_value.copyWith(
      isloding: null == isloding
          ? _value.isloding
          : isloding // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      successPasswordModel: freezed == successPasswordModel
          ? _value.successPasswordModel
          : successPasswordModel // ignore: cast_nullable_to_non_nullable
              as SuccessPasswordModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ForgetPasswordThreeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isloding,
      bool isError,
      String message,
      bool status,
      SuccessPasswordModel? successPasswordModel});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ForgetPasswordThreeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloding = null,
    Object? isError = null,
    Object? message = null,
    Object? status = null,
    Object? successPasswordModel = freezed,
  }) {
    return _then(_$InitialImpl(
      isloding: null == isloding
          ? _value.isloding
          : isloding // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      successPasswordModel: freezed == successPasswordModel
          ? _value.successPasswordModel
          : successPasswordModel // ignore: cast_nullable_to_non_nullable
              as SuccessPasswordModel?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isloding,
      required this.isError,
      required this.message,
      required this.status,
      this.successPasswordModel});

  @override
  final bool isloding;
  @override
  final bool isError;
  @override
  final String message;
  @override
  final bool status;
  @override
  final SuccessPasswordModel? successPasswordModel;

  @override
  String toString() {
    return 'ForgetPasswordThreeState(isloding: $isloding, isError: $isError, message: $message, status: $status, successPasswordModel: $successPasswordModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isloding, isloding) ||
                other.isloding == isloding) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.successPasswordModel, successPasswordModel) ||
                other.successPasswordModel == successPasswordModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isloding, isError, message, status, successPasswordModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ForgetPasswordThreeState {
  const factory _Initial(
      {required final bool isloding,
      required final bool isError,
      required final String message,
      required final bool status,
      final SuccessPasswordModel? successPasswordModel}) = _$InitialImpl;

  @override
  bool get isloding;
  @override
  bool get isError;
  @override
  String get message;
  @override
  bool get status;
  @override
  SuccessPasswordModel? get successPasswordModel;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
