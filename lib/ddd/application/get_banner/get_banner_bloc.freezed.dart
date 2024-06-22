// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_banner_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetBannerEvent {
  String get bannerId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bannerId) fetchBanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bannerId)? fetchBanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bannerId)? fetchBanner,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBanner value) fetchBanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBanner value)? fetchBanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBanner value)? fetchBanner,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetBannerEventCopyWith<GetBannerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetBannerEventCopyWith<$Res> {
  factory $GetBannerEventCopyWith(
          GetBannerEvent value, $Res Function(GetBannerEvent) then) =
      _$GetBannerEventCopyWithImpl<$Res, GetBannerEvent>;
  @useResult
  $Res call({String bannerId});
}

/// @nodoc
class _$GetBannerEventCopyWithImpl<$Res, $Val extends GetBannerEvent>
    implements $GetBannerEventCopyWith<$Res> {
  _$GetBannerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerId = null,
  }) {
    return _then(_value.copyWith(
      bannerId: null == bannerId
          ? _value.bannerId
          : bannerId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchBannerImplCopyWith<$Res>
    implements $GetBannerEventCopyWith<$Res> {
  factory _$$FetchBannerImplCopyWith(
          _$FetchBannerImpl value, $Res Function(_$FetchBannerImpl) then) =
      __$$FetchBannerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String bannerId});
}

/// @nodoc
class __$$FetchBannerImplCopyWithImpl<$Res>
    extends _$GetBannerEventCopyWithImpl<$Res, _$FetchBannerImpl>
    implements _$$FetchBannerImplCopyWith<$Res> {
  __$$FetchBannerImplCopyWithImpl(
      _$FetchBannerImpl _value, $Res Function(_$FetchBannerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerId = null,
  }) {
    return _then(_$FetchBannerImpl(
      null == bannerId
          ? _value.bannerId
          : bannerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchBannerImpl implements _FetchBanner {
  const _$FetchBannerImpl(this.bannerId);

  @override
  final String bannerId;

  @override
  String toString() {
    return 'GetBannerEvent.fetchBanner(bannerId: $bannerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchBannerImpl &&
            (identical(other.bannerId, bannerId) ||
                other.bannerId == bannerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bannerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchBannerImplCopyWith<_$FetchBannerImpl> get copyWith =>
      __$$FetchBannerImplCopyWithImpl<_$FetchBannerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bannerId) fetchBanner,
  }) {
    return fetchBanner(bannerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bannerId)? fetchBanner,
  }) {
    return fetchBanner?.call(bannerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bannerId)? fetchBanner,
    required TResult orElse(),
  }) {
    if (fetchBanner != null) {
      return fetchBanner(bannerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBanner value) fetchBanner,
  }) {
    return fetchBanner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBanner value)? fetchBanner,
  }) {
    return fetchBanner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBanner value)? fetchBanner,
    required TResult orElse(),
  }) {
    if (fetchBanner != null) {
      return fetchBanner(this);
    }
    return orElse();
  }
}

abstract class _FetchBanner implements GetBannerEvent {
  const factory _FetchBanner(final String bannerId) = _$FetchBannerImpl;

  @override
  String get bannerId;
  @override
  @JsonKey(ignore: true)
  _$$FetchBannerImplCopyWith<_$FetchBannerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetBannerState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  bool get cached => throw _privateConstructorUsedError;
  GetBannerModel? get model => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetBannerStateCopyWith<GetBannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetBannerStateCopyWith<$Res> {
  factory $GetBannerStateCopyWith(
          GetBannerState value, $Res Function(GetBannerState) then) =
      _$GetBannerStateCopyWithImpl<$Res, GetBannerState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      String message,
      bool status,
      bool cached,
      GetBannerModel? model});
}

/// @nodoc
class _$GetBannerStateCopyWithImpl<$Res, $Val extends GetBannerState>
    implements $GetBannerStateCopyWith<$Res> {
  _$GetBannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? message = null,
    Object? status = null,
    Object? cached = null,
    Object? model = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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
      cached: null == cached
          ? _value.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as bool,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as GetBannerModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $GetBannerStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      String message,
      bool status,
      bool cached,
      GetBannerModel? model});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetBannerStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? message = null,
    Object? status = null,
    Object? cached = null,
    Object? model = freezed,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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
      cached: null == cached
          ? _value.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as bool,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as GetBannerModel?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.isError,
      required this.message,
      required this.status,
      required this.cached,
      this.model});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final String message;
  @override
  final bool status;
  @override
  final bool cached;
  @override
  final GetBannerModel? model;

  @override
  String toString() {
    return 'GetBannerState(isLoading: $isLoading, isError: $isError, message: $message, status: $status, cached: $cached, model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cached, cached) || other.cached == cached) &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, isError, message, status, cached, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements GetBannerState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool isError,
      required final String message,
      required final bool status,
      required final bool cached,
      final GetBannerModel? model}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  String get message;
  @override
  bool get status;
  @override
  bool get cached;
  @override
  GetBannerModel? get model;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
