// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_doctor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchDoctorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchQuery, bool isLoadingNeed) started,
    required TResult Function(int favId) changeFav,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchQuery, bool isLoadingNeed)? started,
    TResult? Function(int favId)? changeFav,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchQuery, bool isLoadingNeed)? started,
    TResult Function(int favId)? changeFav,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeFav value) changeFav,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeFav value)? changeFav,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeFav value)? changeFav,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchDoctorEventCopyWith<$Res> {
  factory $SearchDoctorEventCopyWith(
          SearchDoctorEvent value, $Res Function(SearchDoctorEvent) then) =
      _$SearchDoctorEventCopyWithImpl<$Res, SearchDoctorEvent>;
}

/// @nodoc
class _$SearchDoctorEventCopyWithImpl<$Res, $Val extends SearchDoctorEvent>
    implements $SearchDoctorEventCopyWith<$Res> {
  _$SearchDoctorEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call({String searchQuery, bool isLoadingNeed});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$SearchDoctorEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? isLoadingNeed = null,
  }) {
    return _then(_$StartedImpl(
      null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      null == isLoadingNeed
          ? _value.isLoadingNeed
          : isLoadingNeed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl(this.searchQuery, this.isLoadingNeed);

  @override
  final String searchQuery;
  @override
  final bool isLoadingNeed;

  @override
  String toString() {
    return 'SearchDoctorEvent.started(searchQuery: $searchQuery, isLoadingNeed: $isLoadingNeed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isLoadingNeed, isLoadingNeed) ||
                other.isLoadingNeed == isLoadingNeed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchQuery, isLoadingNeed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchQuery, bool isLoadingNeed) started,
    required TResult Function(int favId) changeFav,
  }) {
    return started(searchQuery, isLoadingNeed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchQuery, bool isLoadingNeed)? started,
    TResult? Function(int favId)? changeFav,
  }) {
    return started?.call(searchQuery, isLoadingNeed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchQuery, bool isLoadingNeed)? started,
    TResult Function(int favId)? changeFav,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(searchQuery, isLoadingNeed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeFav value) changeFav,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeFav value)? changeFav,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeFav value)? changeFav,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SearchDoctorEvent {
  const factory _Started(final String searchQuery, final bool isLoadingNeed) =
      _$StartedImpl;

  String get searchQuery;
  bool get isLoadingNeed;
  @JsonKey(ignore: true)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$SearchDoctorEventCopyWithImpl<$Res, _$ChangeFavImpl>
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
    return 'SearchDoctorEvent.changeFav(favId: $favId)';
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
    required TResult Function(String searchQuery, bool isLoadingNeed) started,
    required TResult Function(int favId) changeFav,
  }) {
    return changeFav(favId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchQuery, bool isLoadingNeed)? started,
    TResult? Function(int favId)? changeFav,
  }) {
    return changeFav?.call(favId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchQuery, bool isLoadingNeed)? started,
    TResult Function(int favId)? changeFav,
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
  }) {
    return changeFav(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeFav value)? changeFav,
  }) {
    return changeFav?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeFav value)? changeFav,
    required TResult orElse(),
  }) {
    if (changeFav != null) {
      return changeFav(this);
    }
    return orElse();
  }
}

abstract class _ChangeFav implements SearchDoctorEvent {
  const factory _ChangeFav(final int favId) = _$ChangeFavImpl;

  int get favId;
  @JsonKey(ignore: true)
  _$$ChangeFavImplCopyWith<_$ChangeFavImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchDoctorState {
  bool get isloding => throw _privateConstructorUsedError;
  List<SearchDoctor> get model => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  int get favId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchDoctorStateCopyWith<SearchDoctorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchDoctorStateCopyWith<$Res> {
  factory $SearchDoctorStateCopyWith(
          SearchDoctorState value, $Res Function(SearchDoctorState) then) =
      _$SearchDoctorStateCopyWithImpl<$Res, SearchDoctorState>;
  @useResult
  $Res call(
      {bool isloding,
      List<SearchDoctor> model,
      bool isError,
      String message,
      bool status,
      int favId});
}

/// @nodoc
class _$SearchDoctorStateCopyWithImpl<$Res, $Val extends SearchDoctorState>
    implements $SearchDoctorStateCopyWith<$Res> {
  _$SearchDoctorStateCopyWithImpl(this._value, this._then);

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
              as List<SearchDoctor>,
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
    implements $SearchDoctorStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isloding,
      List<SearchDoctor> model,
      bool isError,
      String message,
      bool status,
      int favId});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SearchDoctorStateCopyWithImpl<$Res, _$InitialImpl>
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
              as List<SearchDoctor>,
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
      required final List<SearchDoctor> model,
      required this.isError,
      required this.message,
      required this.status,
      required this.favId})
      : _model = model;

  @override
  final bool isloding;
  final List<SearchDoctor> _model;
  @override
  List<SearchDoctor> get model {
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
    return 'SearchDoctorState(isloding: $isloding, model: $model, isError: $isError, message: $message, status: $status, favId: $favId)';
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

abstract class _Initial implements SearchDoctorState {
  const factory _Initial(
      {required final bool isloding,
      required final List<SearchDoctor> model,
      required final bool isError,
      required final String message,
      required final bool status,
      required final int favId}) = _$InitialImpl;

  @override
  bool get isloding;
  @override
  List<SearchDoctor> get model;
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
