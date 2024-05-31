// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) forgetPassword,
    required TResult Function(String otp) otpVerification,
    required TResult Function(String newPassword) successPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? forgetPassword,
    TResult? Function(String otp)? otpVerification,
    TResult? Function(String newPassword)? successPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? forgetPassword,
    TResult Function(String otp)? otpVerification,
    TResult Function(String newPassword)? successPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ForgetPassword value) forgetPassword,
    required TResult Function(_OtpVerification value) otpVerification,
    required TResult Function(_SuccessPassword value) successPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ForgetPassword value)? forgetPassword,
    TResult? Function(_OtpVerification value)? otpVerification,
    TResult? Function(_SuccessPassword value)? successPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ForgetPassword value)? forgetPassword,
    TResult Function(_OtpVerification value)? otpVerification,
    TResult Function(_SuccessPassword value)? successPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordEventCopyWith<$Res> {
  factory $ForgotPasswordEventCopyWith(
          ForgotPasswordEvent value, $Res Function(ForgotPasswordEvent) then) =
      _$ForgotPasswordEventCopyWithImpl<$Res, ForgotPasswordEvent>;
}

/// @nodoc
class _$ForgotPasswordEventCopyWithImpl<$Res, $Val extends ForgotPasswordEvent>
    implements $ForgotPasswordEventCopyWith<$Res> {
  _$ForgotPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ForgetPasswordImplCopyWith<$Res> {
  factory _$$ForgetPasswordImplCopyWith(_$ForgetPasswordImpl value,
          $Res Function(_$ForgetPasswordImpl) then) =
      __$$ForgetPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgetPasswordImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$ForgetPasswordImpl>
    implements _$$ForgetPasswordImplCopyWith<$Res> {
  __$$ForgetPasswordImplCopyWithImpl(
      _$ForgetPasswordImpl _value, $Res Function(_$ForgetPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ForgetPasswordImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgetPasswordImpl implements _ForgetPassword {
  const _$ForgetPasswordImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordEvent.forgetPassword(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgetPasswordImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgetPasswordImplCopyWith<_$ForgetPasswordImpl> get copyWith =>
      __$$ForgetPasswordImplCopyWithImpl<_$ForgetPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) forgetPassword,
    required TResult Function(String otp) otpVerification,
    required TResult Function(String newPassword) successPassword,
  }) {
    return forgetPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? forgetPassword,
    TResult? Function(String otp)? otpVerification,
    TResult? Function(String newPassword)? successPassword,
  }) {
    return forgetPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? forgetPassword,
    TResult Function(String otp)? otpVerification,
    TResult Function(String newPassword)? successPassword,
    required TResult orElse(),
  }) {
    if (forgetPassword != null) {
      return forgetPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ForgetPassword value) forgetPassword,
    required TResult Function(_OtpVerification value) otpVerification,
    required TResult Function(_SuccessPassword value) successPassword,
  }) {
    return forgetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ForgetPassword value)? forgetPassword,
    TResult? Function(_OtpVerification value)? otpVerification,
    TResult? Function(_SuccessPassword value)? successPassword,
  }) {
    return forgetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ForgetPassword value)? forgetPassword,
    TResult Function(_OtpVerification value)? otpVerification,
    TResult Function(_SuccessPassword value)? successPassword,
    required TResult orElse(),
  }) {
    if (forgetPassword != null) {
      return forgetPassword(this);
    }
    return orElse();
  }
}

abstract class _ForgetPassword implements ForgotPasswordEvent {
  const factory _ForgetPassword({required final String email}) =
      _$ForgetPasswordImpl;

  String get email;
  @JsonKey(ignore: true)
  _$$ForgetPasswordImplCopyWith<_$ForgetPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtpVerificationImplCopyWith<$Res> {
  factory _$$OtpVerificationImplCopyWith(_$OtpVerificationImpl value,
          $Res Function(_$OtpVerificationImpl) then) =
      __$$OtpVerificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String otp});
}

/// @nodoc
class __$$OtpVerificationImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$OtpVerificationImpl>
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
    return 'ForgotPasswordEvent.otpVerification(otp: $otp)';
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
    required TResult Function(String email) forgetPassword,
    required TResult Function(String otp) otpVerification,
    required TResult Function(String newPassword) successPassword,
  }) {
    return otpVerification(otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? forgetPassword,
    TResult? Function(String otp)? otpVerification,
    TResult? Function(String newPassword)? successPassword,
  }) {
    return otpVerification?.call(otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? forgetPassword,
    TResult Function(String otp)? otpVerification,
    TResult Function(String newPassword)? successPassword,
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
    required TResult Function(_ForgetPassword value) forgetPassword,
    required TResult Function(_OtpVerification value) otpVerification,
    required TResult Function(_SuccessPassword value) successPassword,
  }) {
    return otpVerification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ForgetPassword value)? forgetPassword,
    TResult? Function(_OtpVerification value)? otpVerification,
    TResult? Function(_SuccessPassword value)? successPassword,
  }) {
    return otpVerification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ForgetPassword value)? forgetPassword,
    TResult Function(_OtpVerification value)? otpVerification,
    TResult Function(_SuccessPassword value)? successPassword,
    required TResult orElse(),
  }) {
    if (otpVerification != null) {
      return otpVerification(this);
    }
    return orElse();
  }
}

abstract class _OtpVerification implements ForgotPasswordEvent {
  const factory _OtpVerification({required final String otp}) =
      _$OtpVerificationImpl;

  String get otp;
  @JsonKey(ignore: true)
  _$$OtpVerificationImplCopyWith<_$OtpVerificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessPasswordImplCopyWith<$Res> {
  factory _$$SuccessPasswordImplCopyWith(_$SuccessPasswordImpl value,
          $Res Function(_$SuccessPasswordImpl) then) =
      __$$SuccessPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String newPassword});
}

/// @nodoc
class __$$SuccessPasswordImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$SuccessPasswordImpl>
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
    return 'ForgotPasswordEvent.successPassword(newPassword: $newPassword)';
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
    required TResult Function(String email) forgetPassword,
    required TResult Function(String otp) otpVerification,
    required TResult Function(String newPassword) successPassword,
  }) {
    return successPassword(newPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? forgetPassword,
    TResult? Function(String otp)? otpVerification,
    TResult? Function(String newPassword)? successPassword,
  }) {
    return successPassword?.call(newPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? forgetPassword,
    TResult Function(String otp)? otpVerification,
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
    required TResult Function(_ForgetPassword value) forgetPassword,
    required TResult Function(_OtpVerification value) otpVerification,
    required TResult Function(_SuccessPassword value) successPassword,
  }) {
    return successPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ForgetPassword value)? forgetPassword,
    TResult? Function(_OtpVerification value)? otpVerification,
    TResult? Function(_SuccessPassword value)? successPassword,
  }) {
    return successPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ForgetPassword value)? forgetPassword,
    TResult Function(_OtpVerification value)? otpVerification,
    TResult Function(_SuccessPassword value)? successPassword,
    required TResult orElse(),
  }) {
    if (successPassword != null) {
      return successPassword(this);
    }
    return orElse();
  }
}

abstract class _SuccessPassword implements ForgotPasswordEvent {
  const factory _SuccessPassword({required final String newPassword}) =
      _$SuccessPasswordImpl;

  String get newPassword;
  @JsonKey(ignore: true)
  _$$SuccessPasswordImplCopyWith<_$SuccessPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgotPasswordState {
  bool get forgetPasswordisloding => throw _privateConstructorUsedError;
  bool get forgetPasswordisError => throw _privateConstructorUsedError;
  String get forgetPasswordmessage => throw _privateConstructorUsedError;
  bool get forgetPasswordstatus => throw _privateConstructorUsedError;
  ForgotPasswordModel? get forgotPasswordModel =>
      throw _privateConstructorUsedError;
  bool get otpVerfiedisloding => throw _privateConstructorUsedError;
  bool get otpVerfiedisError => throw _privateConstructorUsedError;
  String get otpVerfiedmessage => throw _privateConstructorUsedError;
  bool get otpVerfiedstatus => throw _privateConstructorUsedError;
  OtpVerfiedModel? get otpVerfiedModel => throw _privateConstructorUsedError;
  bool get successPasswordisloding => throw _privateConstructorUsedError;
  bool get successPasswordisError => throw _privateConstructorUsedError;
  String get successPasswordmessage => throw _privateConstructorUsedError;
  bool get successPasswordstatus => throw _privateConstructorUsedError;
  SuccessPasswordModel? get successPasswordModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordStateCopyWith<ForgotPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPasswordState value, $Res Function(ForgotPasswordState) then) =
      _$ForgotPasswordStateCopyWithImpl<$Res, ForgotPasswordState>;
  @useResult
  $Res call(
      {bool forgetPasswordisloding,
      bool forgetPasswordisError,
      String forgetPasswordmessage,
      bool forgetPasswordstatus,
      ForgotPasswordModel? forgotPasswordModel,
      bool otpVerfiedisloding,
      bool otpVerfiedisError,
      String otpVerfiedmessage,
      bool otpVerfiedstatus,
      OtpVerfiedModel? otpVerfiedModel,
      bool successPasswordisloding,
      bool successPasswordisError,
      String successPasswordmessage,
      bool successPasswordstatus,
      SuccessPasswordModel? successPasswordModel});
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res, $Val extends ForgotPasswordState>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forgetPasswordisloding = null,
    Object? forgetPasswordisError = null,
    Object? forgetPasswordmessage = null,
    Object? forgetPasswordstatus = null,
    Object? forgotPasswordModel = freezed,
    Object? otpVerfiedisloding = null,
    Object? otpVerfiedisError = null,
    Object? otpVerfiedmessage = null,
    Object? otpVerfiedstatus = null,
    Object? otpVerfiedModel = freezed,
    Object? successPasswordisloding = null,
    Object? successPasswordisError = null,
    Object? successPasswordmessage = null,
    Object? successPasswordstatus = null,
    Object? successPasswordModel = freezed,
  }) {
    return _then(_value.copyWith(
      forgetPasswordisloding: null == forgetPasswordisloding
          ? _value.forgetPasswordisloding
          : forgetPasswordisloding // ignore: cast_nullable_to_non_nullable
              as bool,
      forgetPasswordisError: null == forgetPasswordisError
          ? _value.forgetPasswordisError
          : forgetPasswordisError // ignore: cast_nullable_to_non_nullable
              as bool,
      forgetPasswordmessage: null == forgetPasswordmessage
          ? _value.forgetPasswordmessage
          : forgetPasswordmessage // ignore: cast_nullable_to_non_nullable
              as String,
      forgetPasswordstatus: null == forgetPasswordstatus
          ? _value.forgetPasswordstatus
          : forgetPasswordstatus // ignore: cast_nullable_to_non_nullable
              as bool,
      forgotPasswordModel: freezed == forgotPasswordModel
          ? _value.forgotPasswordModel
          : forgotPasswordModel // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordModel?,
      otpVerfiedisloding: null == otpVerfiedisloding
          ? _value.otpVerfiedisloding
          : otpVerfiedisloding // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerfiedisError: null == otpVerfiedisError
          ? _value.otpVerfiedisError
          : otpVerfiedisError // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerfiedmessage: null == otpVerfiedmessage
          ? _value.otpVerfiedmessage
          : otpVerfiedmessage // ignore: cast_nullable_to_non_nullable
              as String,
      otpVerfiedstatus: null == otpVerfiedstatus
          ? _value.otpVerfiedstatus
          : otpVerfiedstatus // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerfiedModel: freezed == otpVerfiedModel
          ? _value.otpVerfiedModel
          : otpVerfiedModel // ignore: cast_nullable_to_non_nullable
              as OtpVerfiedModel?,
      successPasswordisloding: null == successPasswordisloding
          ? _value.successPasswordisloding
          : successPasswordisloding // ignore: cast_nullable_to_non_nullable
              as bool,
      successPasswordisError: null == successPasswordisError
          ? _value.successPasswordisError
          : successPasswordisError // ignore: cast_nullable_to_non_nullable
              as bool,
      successPasswordmessage: null == successPasswordmessage
          ? _value.successPasswordmessage
          : successPasswordmessage // ignore: cast_nullable_to_non_nullable
              as String,
      successPasswordstatus: null == successPasswordstatus
          ? _value.successPasswordstatus
          : successPasswordstatus // ignore: cast_nullable_to_non_nullable
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
    implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool forgetPasswordisloding,
      bool forgetPasswordisError,
      String forgetPasswordmessage,
      bool forgetPasswordstatus,
      ForgotPasswordModel? forgotPasswordModel,
      bool otpVerfiedisloding,
      bool otpVerfiedisError,
      String otpVerfiedmessage,
      bool otpVerfiedstatus,
      OtpVerfiedModel? otpVerfiedModel,
      bool successPasswordisloding,
      bool successPasswordisError,
      String successPasswordmessage,
      bool successPasswordstatus,
      SuccessPasswordModel? successPasswordModel});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forgetPasswordisloding = null,
    Object? forgetPasswordisError = null,
    Object? forgetPasswordmessage = null,
    Object? forgetPasswordstatus = null,
    Object? forgotPasswordModel = freezed,
    Object? otpVerfiedisloding = null,
    Object? otpVerfiedisError = null,
    Object? otpVerfiedmessage = null,
    Object? otpVerfiedstatus = null,
    Object? otpVerfiedModel = freezed,
    Object? successPasswordisloding = null,
    Object? successPasswordisError = null,
    Object? successPasswordmessage = null,
    Object? successPasswordstatus = null,
    Object? successPasswordModel = freezed,
  }) {
    return _then(_$InitialImpl(
      forgetPasswordisloding: null == forgetPasswordisloding
          ? _value.forgetPasswordisloding
          : forgetPasswordisloding // ignore: cast_nullable_to_non_nullable
              as bool,
      forgetPasswordisError: null == forgetPasswordisError
          ? _value.forgetPasswordisError
          : forgetPasswordisError // ignore: cast_nullable_to_non_nullable
              as bool,
      forgetPasswordmessage: null == forgetPasswordmessage
          ? _value.forgetPasswordmessage
          : forgetPasswordmessage // ignore: cast_nullable_to_non_nullable
              as String,
      forgetPasswordstatus: null == forgetPasswordstatus
          ? _value.forgetPasswordstatus
          : forgetPasswordstatus // ignore: cast_nullable_to_non_nullable
              as bool,
      forgotPasswordModel: freezed == forgotPasswordModel
          ? _value.forgotPasswordModel
          : forgotPasswordModel // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordModel?,
      otpVerfiedisloding: null == otpVerfiedisloding
          ? _value.otpVerfiedisloding
          : otpVerfiedisloding // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerfiedisError: null == otpVerfiedisError
          ? _value.otpVerfiedisError
          : otpVerfiedisError // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerfiedmessage: null == otpVerfiedmessage
          ? _value.otpVerfiedmessage
          : otpVerfiedmessage // ignore: cast_nullable_to_non_nullable
              as String,
      otpVerfiedstatus: null == otpVerfiedstatus
          ? _value.otpVerfiedstatus
          : otpVerfiedstatus // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerfiedModel: freezed == otpVerfiedModel
          ? _value.otpVerfiedModel
          : otpVerfiedModel // ignore: cast_nullable_to_non_nullable
              as OtpVerfiedModel?,
      successPasswordisloding: null == successPasswordisloding
          ? _value.successPasswordisloding
          : successPasswordisloding // ignore: cast_nullable_to_non_nullable
              as bool,
      successPasswordisError: null == successPasswordisError
          ? _value.successPasswordisError
          : successPasswordisError // ignore: cast_nullable_to_non_nullable
              as bool,
      successPasswordmessage: null == successPasswordmessage
          ? _value.successPasswordmessage
          : successPasswordmessage // ignore: cast_nullable_to_non_nullable
              as String,
      successPasswordstatus: null == successPasswordstatus
          ? _value.successPasswordstatus
          : successPasswordstatus // ignore: cast_nullable_to_non_nullable
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
      {required this.forgetPasswordisloding,
      required this.forgetPasswordisError,
      required this.forgetPasswordmessage,
      required this.forgetPasswordstatus,
      this.forgotPasswordModel,
      required this.otpVerfiedisloding,
      required this.otpVerfiedisError,
      required this.otpVerfiedmessage,
      required this.otpVerfiedstatus,
      this.otpVerfiedModel,
      required this.successPasswordisloding,
      required this.successPasswordisError,
      required this.successPasswordmessage,
      required this.successPasswordstatus,
      this.successPasswordModel});

  @override
  final bool forgetPasswordisloding;
  @override
  final bool forgetPasswordisError;
  @override
  final String forgetPasswordmessage;
  @override
  final bool forgetPasswordstatus;
  @override
  final ForgotPasswordModel? forgotPasswordModel;
  @override
  final bool otpVerfiedisloding;
  @override
  final bool otpVerfiedisError;
  @override
  final String otpVerfiedmessage;
  @override
  final bool otpVerfiedstatus;
  @override
  final OtpVerfiedModel? otpVerfiedModel;
  @override
  final bool successPasswordisloding;
  @override
  final bool successPasswordisError;
  @override
  final String successPasswordmessage;
  @override
  final bool successPasswordstatus;
  @override
  final SuccessPasswordModel? successPasswordModel;

  @override
  String toString() {
    return 'ForgotPasswordState(forgetPasswordisloding: $forgetPasswordisloding, forgetPasswordisError: $forgetPasswordisError, forgetPasswordmessage: $forgetPasswordmessage, forgetPasswordstatus: $forgetPasswordstatus, forgotPasswordModel: $forgotPasswordModel, otpVerfiedisloding: $otpVerfiedisloding, otpVerfiedisError: $otpVerfiedisError, otpVerfiedmessage: $otpVerfiedmessage, otpVerfiedstatus: $otpVerfiedstatus, otpVerfiedModel: $otpVerfiedModel, successPasswordisloding: $successPasswordisloding, successPasswordisError: $successPasswordisError, successPasswordmessage: $successPasswordmessage, successPasswordstatus: $successPasswordstatus, successPasswordModel: $successPasswordModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.forgetPasswordisloding, forgetPasswordisloding) ||
                other.forgetPasswordisloding == forgetPasswordisloding) &&
            (identical(other.forgetPasswordisError, forgetPasswordisError) ||
                other.forgetPasswordisError == forgetPasswordisError) &&
            (identical(other.forgetPasswordmessage, forgetPasswordmessage) ||
                other.forgetPasswordmessage == forgetPasswordmessage) &&
            (identical(other.forgetPasswordstatus, forgetPasswordstatus) ||
                other.forgetPasswordstatus == forgetPasswordstatus) &&
            (identical(other.forgotPasswordModel, forgotPasswordModel) ||
                other.forgotPasswordModel == forgotPasswordModel) &&
            (identical(other.otpVerfiedisloding, otpVerfiedisloding) ||
                other.otpVerfiedisloding == otpVerfiedisloding) &&
            (identical(other.otpVerfiedisError, otpVerfiedisError) ||
                other.otpVerfiedisError == otpVerfiedisError) &&
            (identical(other.otpVerfiedmessage, otpVerfiedmessage) ||
                other.otpVerfiedmessage == otpVerfiedmessage) &&
            (identical(other.otpVerfiedstatus, otpVerfiedstatus) ||
                other.otpVerfiedstatus == otpVerfiedstatus) &&
            (identical(other.otpVerfiedModel, otpVerfiedModel) ||
                other.otpVerfiedModel == otpVerfiedModel) &&
            (identical(
                    other.successPasswordisloding, successPasswordisloding) ||
                other.successPasswordisloding == successPasswordisloding) &&
            (identical(other.successPasswordisError, successPasswordisError) ||
                other.successPasswordisError == successPasswordisError) &&
            (identical(other.successPasswordmessage, successPasswordmessage) ||
                other.successPasswordmessage == successPasswordmessage) &&
            (identical(other.successPasswordstatus, successPasswordstatus) ||
                other.successPasswordstatus == successPasswordstatus) &&
            (identical(other.successPasswordModel, successPasswordModel) ||
                other.successPasswordModel == successPasswordModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      forgetPasswordisloding,
      forgetPasswordisError,
      forgetPasswordmessage,
      forgetPasswordstatus,
      forgotPasswordModel,
      otpVerfiedisloding,
      otpVerfiedisError,
      otpVerfiedmessage,
      otpVerfiedstatus,
      otpVerfiedModel,
      successPasswordisloding,
      successPasswordisError,
      successPasswordmessage,
      successPasswordstatus,
      successPasswordModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ForgotPasswordState {
  const factory _Initial(
      {required final bool forgetPasswordisloding,
      required final bool forgetPasswordisError,
      required final String forgetPasswordmessage,
      required final bool forgetPasswordstatus,
      final ForgotPasswordModel? forgotPasswordModel,
      required final bool otpVerfiedisloding,
      required final bool otpVerfiedisError,
      required final String otpVerfiedmessage,
      required final bool otpVerfiedstatus,
      final OtpVerfiedModel? otpVerfiedModel,
      required final bool successPasswordisloding,
      required final bool successPasswordisError,
      required final String successPasswordmessage,
      required final bool successPasswordstatus,
      final SuccessPasswordModel? successPasswordModel}) = _$InitialImpl;

  @override
  bool get forgetPasswordisloding;
  @override
  bool get forgetPasswordisError;
  @override
  String get forgetPasswordmessage;
  @override
  bool get forgetPasswordstatus;
  @override
  ForgotPasswordModel? get forgotPasswordModel;
  @override
  bool get otpVerfiedisloding;
  @override
  bool get otpVerfiedisError;
  @override
  String get otpVerfiedmessage;
  @override
  bool get otpVerfiedstatus;
  @override
  OtpVerfiedModel? get otpVerfiedModel;
  @override
  bool get successPasswordisloding;
  @override
  bool get successPasswordisError;
  @override
  String get successPasswordmessage;
  @override
  bool get successPasswordstatus;
  @override
  SuccessPasswordModel? get successPasswordModel;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
