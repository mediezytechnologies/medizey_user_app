// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_fav_doctor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetFavDoctorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int favId) changeFav,
    required TResult Function() getFavDocterForcedEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int favId)? changeFav,
    TResult? Function()? getFavDocterForcedEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int favId)? changeFav,
    TResult Function()? getFavDocterForcedEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeFav value) changeFav,
    required TResult Function(_GetFavDocterForcedEvent value)
        getFavDocterForcedEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeFav value)? changeFav,
    TResult? Function(_GetFavDocterForcedEvent value)? getFavDocterForcedEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeFav value)? changeFav,
    TResult Function(_GetFavDocterForcedEvent value)? getFavDocterForcedEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFavDoctorEventCopyWith<$Res> {
  factory $GetFavDoctorEventCopyWith(
          GetFavDoctorEvent value, $Res Function(GetFavDoctorEvent) then) =
      _$GetFavDoctorEventCopyWithImpl<$Res, GetFavDoctorEvent>;
}

/// @nodoc
class _$GetFavDoctorEventCopyWithImpl<$Res, $Val extends GetFavDoctorEvent>
    implements $GetFavDoctorEventCopyWith<$Res> {
  _$GetFavDoctorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$GetFavDoctorEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'GetFavDoctorEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int favId) changeFav,
    required TResult Function() getFavDocterForcedEvent,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int favId)? changeFav,
    TResult? Function()? getFavDocterForcedEvent,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int favId)? changeFav,
    TResult Function()? getFavDocterForcedEvent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeFav value) changeFav,
    required TResult Function(_GetFavDocterForcedEvent value)
        getFavDocterForcedEvent,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeFav value)? changeFav,
    TResult? Function(_GetFavDocterForcedEvent value)? getFavDocterForcedEvent,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeFav value)? changeFav,
    TResult Function(_GetFavDocterForcedEvent value)? getFavDocterForcedEvent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GetFavDoctorEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ChangeFavImplCopyWith<$Res> {
  factory _$$ChangeFavImplCopyWith(
          _$ChangeFavImpl value, $Res Function(_$ChangeFavImpl) then) =
      __$$ChangeFavImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int favId});
}

/// @nodoc
class __$$ChangeFavImplCopyWithImpl<$Res>
    extends _$GetFavDoctorEventCopyWithImpl<$Res, _$ChangeFavImpl>
    implements _$$ChangeFavImplCopyWith<$Res> {
  __$$ChangeFavImplCopyWithImpl(
      _$ChangeFavImpl _value, $Res Function(_$ChangeFavImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favId = null,
  }) {
    return _then(_$ChangeFavImpl(
      null == favId
          ? _value.favId
          : favId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeFavImpl implements _ChangeFav {
  const _$ChangeFavImpl(this.favId);

  @override
  final int favId;

  @override
  String toString() {
    return 'GetFavDoctorEvent.changeFav(favId: $favId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeFavImpl &&
            (identical(other.favId, favId) || other.favId == favId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, favId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeFavImplCopyWith<_$ChangeFavImpl> get copyWith =>
      __$$ChangeFavImplCopyWithImpl<_$ChangeFavImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int favId) changeFav,
    required TResult Function() getFavDocterForcedEvent,
  }) {
    return changeFav(favId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int favId)? changeFav,
    TResult? Function()? getFavDocterForcedEvent,
  }) {
    return changeFav?.call(favId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int favId)? changeFav,
    TResult Function()? getFavDocterForcedEvent,
    required TResult orElse(),
  }) {
    if (changeFav != null) {
      return changeFav(favId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeFav value) changeFav,
    required TResult Function(_GetFavDocterForcedEvent value)
        getFavDocterForcedEvent,
  }) {
    return changeFav(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeFav value)? changeFav,
    TResult? Function(_GetFavDocterForcedEvent value)? getFavDocterForcedEvent,
  }) {
    return changeFav?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeFav value)? changeFav,
    TResult Function(_GetFavDocterForcedEvent value)? getFavDocterForcedEvent,
    required TResult orElse(),
  }) {
    if (changeFav != null) {
      return changeFav(this);
    }
    return orElse();
  }
}

abstract class _ChangeFav implements GetFavDoctorEvent {
  const factory _ChangeFav(final int favId) = _$ChangeFavImpl;

  int get favId;
  @JsonKey(ignore: true)
  _$$ChangeFavImplCopyWith<_$ChangeFavImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetFavDocterForcedEventImplCopyWith<$Res> {
  factory _$$GetFavDocterForcedEventImplCopyWith(
          _$GetFavDocterForcedEventImpl value,
          $Res Function(_$GetFavDocterForcedEventImpl) then) =
      __$$GetFavDocterForcedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetFavDocterForcedEventImplCopyWithImpl<$Res>
    extends _$GetFavDoctorEventCopyWithImpl<$Res, _$GetFavDocterForcedEventImpl>
    implements _$$GetFavDocterForcedEventImplCopyWith<$Res> {
  __$$GetFavDocterForcedEventImplCopyWithImpl(
      _$GetFavDocterForcedEventImpl _value,
      $Res Function(_$GetFavDocterForcedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetFavDocterForcedEventImpl implements _GetFavDocterForcedEvent {
  const _$GetFavDocterForcedEventImpl();

  @override
  String toString() {
    return 'GetFavDoctorEvent.getFavDocterForcedEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFavDocterForcedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int favId) changeFav,
    required TResult Function() getFavDocterForcedEvent,
  }) {
    return getFavDocterForcedEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int favId)? changeFav,
    TResult? Function()? getFavDocterForcedEvent,
  }) {
    return getFavDocterForcedEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int favId)? changeFav,
    TResult Function()? getFavDocterForcedEvent,
    required TResult orElse(),
  }) {
    if (getFavDocterForcedEvent != null) {
      return getFavDocterForcedEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeFav value) changeFav,
    required TResult Function(_GetFavDocterForcedEvent value)
        getFavDocterForcedEvent,
  }) {
    return getFavDocterForcedEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeFav value)? changeFav,
    TResult? Function(_GetFavDocterForcedEvent value)? getFavDocterForcedEvent,
  }) {
    return getFavDocterForcedEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeFav value)? changeFav,
    TResult Function(_GetFavDocterForcedEvent value)? getFavDocterForcedEvent,
    required TResult orElse(),
  }) {
    if (getFavDocterForcedEvent != null) {
      return getFavDocterForcedEvent(this);
    }
    return orElse();
  }
}

abstract class _GetFavDocterForcedEvent implements GetFavDoctorEvent {
  const factory _GetFavDocterForcedEvent() = _$GetFavDocterForcedEventImpl;
}

/// @nodoc
mixin _$GetFavDoctorState {
  bool get isloding => throw _privateConstructorUsedError;
  List<FavoriteDoctor> get model => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  int get favId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetFavDoctorStateCopyWith<GetFavDoctorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFavDoctorStateCopyWith<$Res> {
  factory $GetFavDoctorStateCopyWith(
          GetFavDoctorState value, $Res Function(GetFavDoctorState) then) =
      _$GetFavDoctorStateCopyWithImpl<$Res, GetFavDoctorState>;
  @useResult
  $Res call(
      {bool isloding,
      List<FavoriteDoctor> model,
      bool isError,
      String message,
      bool status,
      int favId});
}

/// @nodoc
class _$GetFavDoctorStateCopyWithImpl<$Res, $Val extends GetFavDoctorState>
    implements $GetFavDoctorStateCopyWith<$Res> {
  _$GetFavDoctorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloding = null,
    Object? model = null,
    Object? isError = null,
    Object? message = null,
    Object? status = null,
    Object? favId = null,
  }) {
    return _then(_value.copyWith(
      isloding: null == isloding
          ? _value.isloding
          : isloding // ignore: cast_nullable_to_non_nullable
              as bool,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as List<FavoriteDoctor>,
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
      favId: null == favId
          ? _value.favId
          : favId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $GetFavDoctorStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isloding,
      List<FavoriteDoctor> model,
      bool isError,
      String message,
      bool status,
      int favId});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetFavDoctorStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloding = null,
    Object? model = null,
    Object? isError = null,
    Object? message = null,
    Object? status = null,
    Object? favId = null,
  }) {
    return _then(_$InitialImpl(
      isloding: null == isloding
          ? _value.isloding
          : isloding // ignore: cast_nullable_to_non_nullable
              as bool,
      model: null == model
          ? _value._model
          : model // ignore: cast_nullable_to_non_nullable
              as List<FavoriteDoctor>,
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
      favId: null == favId
          ? _value.favId
          : favId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isloding,
      required final List<FavoriteDoctor> model,
      required this.isError,
      required this.message,
      required this.status,
      required this.favId})
      : _model = model;

  @override
  final bool isloding;
  final List<FavoriteDoctor> _model;
  @override
  List<FavoriteDoctor> get model {
    if (_model is EqualUnmodifiableListView) return _model;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_model);
  }

  @override
  final bool isError;
  @override
  final String message;
  @override
  final bool status;
  @override
  final int favId;

  @override
  String toString() {
    return 'GetFavDoctorState(isloding: $isloding, model: $model, isError: $isError, message: $message, status: $status, favId: $favId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isloding, isloding) ||
                other.isloding == isloding) &&
            const DeepCollectionEquality().equals(other._model, _model) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.favId, favId) || other.favId == favId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isloding,
      const DeepCollectionEquality().hash(_model),
      isError,
      message,
      status,
      favId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements GetFavDoctorState {
  const factory _Initial(
      {required final bool isloding,
      required final List<FavoriteDoctor> model,
      required final bool isError,
      required final String message,
      required final bool status,
      required final int favId}) = _$InitialImpl;

  @override
  bool get isloding;
  @override
  List<FavoriteDoctor> get model;
  @override
  bool get isError;
  @override
  String get message;
  @override
  bool get status;
  @override
  int get favId;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
