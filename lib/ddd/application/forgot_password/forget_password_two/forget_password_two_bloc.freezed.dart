// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_two_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgetPasswordTwoEvent {
  String get otp => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String otp) otpVerification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String otp)? otpVerification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String otp)? otpVerification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OtpVerification value) otpVerification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OtpVerification value)? otpVerification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OtpVerification value)? otpVerification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgetPasswordTwoEventCopyWith<ForgetPasswordTwoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPasswordTwoEventCopyWith<$Res> {
  factory $ForgetPasswordTwoEventCopyWith(ForgetPasswordTwoEvent value,
          $Res Function(ForgetPasswordTwoEvent) then) =
      _$ForgetPasswordTwoEventCopyWithImpl<$Res, ForgetPasswordTwoEvent>;
  @useResult
  $Res call({String otp});
}

/// @nodoc
class _$ForgetPasswordTwoEventCopyWithImpl<$Res,
        $Val extends ForgetPasswordTwoEvent>
    implements $ForgetPasswordTwoEventCopyWith<$Res> {
  _$ForgetPasswordTwoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
  }) {
    return _then(_value.copyWith(
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpVerificationImplCopyWith<$Res>
    implements $ForgetPasswordTwoEventCopyWith<$Res> {
  factory _$$OtpVerificationImplCopyWith(_$OtpVerificationImpl value,
          $Res Function(_$OtpVerificationImpl) then) =
      __$$OtpVerificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String otp});
}

/// @nodoc
class __$$OtpVerificationImplCopyWithImpl<$Res>
    extends _$ForgetPasswordTwoEventCopyWithImpl<$Res, _$OtpVerificationImpl>
    implements _$$OtpVerificationImplCopyWith<$Res> {
  __$$OtpVerificationImplCopyWithImpl(
      _$OtpVerificationImpl _value, $Res Function(_$OtpVerificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
  }) {
    return _then(_$OtpVerificationImpl(
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtpVerificationImpl implements _OtpVerification {
  const _$OtpVerificationImpl({required this.otp});

  @override
  final String otp;

  @override
  String toString() {
    return 'ForgetPasswordTwoEvent.otpVerification(otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerificationImpl &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerificationImplCopyWith<_$OtpVerificationImpl> get copyWith =>
      __$$OtpVerificationImplCopyWithImpl<_$OtpVerificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String otp) otpVerification,
  }) {
    return otpVerification(otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String otp)? otpVerification,
  }) {
    return otpVerification?.call(otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String otp)? otpVerification,
    required TResult orElse(),
  }) {
    if (otpVerification != null) {
      return otpVerification(otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OtpVerification value) otpVerification,
  }) {
    return otpVerification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OtpVerification value)? otpVerification,
  }) {
    return otpVerification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OtpVerification value)? otpVerification,
    required TResult orElse(),
  }) {
    if (otpVerification != null) {
      return otpVerification(this);
    }
    return orElse();
  }
}

abstract class _OtpVerification implements ForgetPasswordTwoEvent {
  const factory _OtpVerification({required final String otp}) =
      _$OtpVerificationImpl;

  @override
  String get otp;
  @override
  @JsonKey(ignore: true)
  _$$OtpVerificationImplCopyWith<_$OtpVerificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgetPasswordTwoState {
  bool get isloding => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  OtpVerfiedModel? get otpVerfiedModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgetPasswordTwoStateCopyWith<ForgetPasswordTwoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPasswordTwoStateCopyWith<$Res> {
  factory $ForgetPasswordTwoStateCopyWith(ForgetPasswordTwoState value,
          $Res Function(ForgetPasswordTwoState) then) =
      _$ForgetPasswordTwoStateCopyWithImpl<$Res, ForgetPasswordTwoState>;
  @useResult
  $Res call(
      {bool isloding,
      bool isError,
      String message,
      bool status,
      OtpVerfiedModel? otpVerfiedModel});
}

/// @nodoc
class _$ForgetPasswordTwoStateCopyWithImpl<$Res,
        $Val extends ForgetPasswordTwoState>
    implements $ForgetPasswordTwoStateCopyWith<$Res> {
  _$ForgetPasswordTwoStateCopyWithImpl(this._value, this._then);

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
    Object? otpVerfiedModel = freezed,
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
      otpVerfiedModel: freezed == otpVerfiedModel
          ? _value.otpVerfiedModel
          : otpVerfiedModel // ignore: cast_nullable_to_non_nullable
              as OtpVerfiedModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ForgetPasswordTwoStateCopyWith<$Res> {
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
      OtpVerfiedModel? otpVerfiedModel});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ForgetPasswordTwoStateCopyWithImpl<$Res, _$InitialImpl>
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
    Object? otpVerfiedModel = freezed,
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
      otpVerfiedModel: freezed == otpVerfiedModel
          ? _value.otpVerfiedModel
          : otpVerfiedModel // ignore: cast_nullable_to_non_nullable
              as OtpVerfiedModel?,
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
      this.otpVerfiedModel});

  @override
  final bool isloding;
  @override
  final bool isError;
  @override
  final String message;
  @override
  final bool status;
  @override
  final OtpVerfiedModel? otpVerfiedModel;

  @override
  String toString() {
    return 'ForgetPasswordTwoState(isloding: $isloding, isError: $isError, message: $message, status: $status, otpVerfiedModel: $otpVerfiedModel)';
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
            (identical(other.otpVerfiedModel, otpVerfiedModel) ||
                other.otpVerfiedModel == otpVerfiedModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isloding, isError, message, status, otpVerfiedModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ForgetPasswordTwoState {
  const factory _Initial(
      {required final bool isloding,
      required final bool isError,
      required final String message,
      required final bool status,
      final OtpVerfiedModel? otpVerfiedModel}) = _$InitialImpl;

  @override
  bool get isloding;
  @override
  bool get isError;
  @override
  String get message;
  @override
  bool get status;
  @override
  OtpVerfiedModel? get otpVerfiedModel;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
