// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_first_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgetPasswordFirstEvent {
  String get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) forgetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? forgetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? forgetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ForgetPassword value) forgetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ForgetPassword value)? forgetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ForgetPassword value)? forgetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgetPasswordFirstEventCopyWith<ForgetPasswordFirstEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPasswordFirstEventCopyWith<$Res> {
  factory $ForgetPasswordFirstEventCopyWith(ForgetPasswordFirstEvent value,
          $Res Function(ForgetPasswordFirstEvent) then) =
      _$ForgetPasswordFirstEventCopyWithImpl<$Res, ForgetPasswordFirstEvent>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgetPasswordFirstEventCopyWithImpl<$Res,
        $Val extends ForgetPasswordFirstEvent>
    implements $ForgetPasswordFirstEventCopyWith<$Res> {
  _$ForgetPasswordFirstEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgetPasswordImplCopyWith<$Res>
    implements $ForgetPasswordFirstEventCopyWith<$Res> {
  factory _$$ForgetPasswordImplCopyWith(_$ForgetPasswordImpl value,
          $Res Function(_$ForgetPasswordImpl) then) =
      __$$ForgetPasswordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgetPasswordImplCopyWithImpl<$Res>
    extends _$ForgetPasswordFirstEventCopyWithImpl<$Res, _$ForgetPasswordImpl>
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
    return 'ForgetPasswordFirstEvent.forgetPassword(email: $email)';
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
  }) {
    return forgetPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? forgetPassword,
  }) {
    return forgetPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? forgetPassword,
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
  }) {
    return forgetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ForgetPassword value)? forgetPassword,
  }) {
    return forgetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ForgetPassword value)? forgetPassword,
    required TResult orElse(),
  }) {
    if (forgetPassword != null) {
      return forgetPassword(this);
    }
    return orElse();
  }
}

abstract class _ForgetPassword implements ForgetPasswordFirstEvent {
  const factory _ForgetPassword({required final String email}) =
      _$ForgetPasswordImpl;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$ForgetPasswordImplCopyWith<_$ForgetPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgetPasswordFirstState {
  bool get isloding => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  ForgotPasswordModel? get forgotPasswordModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgetPasswordFirstStateCopyWith<ForgetPasswordFirstState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPasswordFirstStateCopyWith<$Res> {
  factory $ForgetPasswordFirstStateCopyWith(ForgetPasswordFirstState value,
          $Res Function(ForgetPasswordFirstState) then) =
      _$ForgetPasswordFirstStateCopyWithImpl<$Res, ForgetPasswordFirstState>;
  @useResult
  $Res call(
      {bool isloding,
      bool isError,
      String message,
      bool status,
      ForgotPasswordModel? forgotPasswordModel});
}

/// @nodoc
class _$ForgetPasswordFirstStateCopyWithImpl<$Res,
        $Val extends ForgetPasswordFirstState>
    implements $ForgetPasswordFirstStateCopyWith<$Res> {
  _$ForgetPasswordFirstStateCopyWithImpl(this._value, this._then);

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
    Object? forgotPasswordModel = freezed,
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
      forgotPasswordModel: freezed == forgotPasswordModel
          ? _value.forgotPasswordModel
          : forgotPasswordModel // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ForgetPasswordFirstStateCopyWith<$Res> {
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
      ForgotPasswordModel? forgotPasswordModel});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ForgetPasswordFirstStateCopyWithImpl<$Res, _$InitialImpl>
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
    Object? forgotPasswordModel = freezed,
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
      forgotPasswordModel: freezed == forgotPasswordModel
          ? _value.forgotPasswordModel
          : forgotPasswordModel // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordModel?,
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
      this.forgotPasswordModel});

  @override
  final bool isloding;
  @override
  final bool isError;
  @override
  final String message;
  @override
  final bool status;
  @override
  final ForgotPasswordModel? forgotPasswordModel;

  @override
  String toString() {
    return 'ForgetPasswordFirstState(isloding: $isloding, isError: $isError, message: $message, status: $status, forgotPasswordModel: $forgotPasswordModel)';
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
            (identical(other.forgotPasswordModel, forgotPasswordModel) ||
                other.forgotPasswordModel == forgotPasswordModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isloding, isError, message, status, forgotPasswordModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ForgetPasswordFirstState {
  const factory _Initial(
      {required final bool isloding,
      required final bool isError,
      required final String message,
      required final bool status,
      final ForgotPasswordModel? forgotPasswordModel}) = _$InitialImpl;

  @override
  bool get isloding;
  @override
  bool get isError;
  @override
  String get message;
  @override
  bool get status;
  @override
  ForgotPasswordModel? get forgotPasswordModel;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
