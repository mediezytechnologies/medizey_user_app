// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_member_image_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditMemberImageEvent {
  String get imagePath => throw _privateConstructorUsedError;
  String get patientId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imagePath, String patientId) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath, String patientId)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath, String patientId)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditMemberImageEventCopyWith<EditMemberImageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditMemberImageEventCopyWith<$Res> {
  factory $EditMemberImageEventCopyWith(EditMemberImageEvent value,
          $Res Function(EditMemberImageEvent) then) =
      _$EditMemberImageEventCopyWithImpl<$Res, EditMemberImageEvent>;
  @useResult
  $Res call({String imagePath, String patientId});
}

/// @nodoc
class _$EditMemberImageEventCopyWithImpl<$Res,
        $Val extends EditMemberImageEvent>
    implements $EditMemberImageEventCopyWith<$Res> {
  _$EditMemberImageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? patientId = null,
  }) {
    return _then(_value.copyWith(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res>
    implements $EditMemberImageEventCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imagePath, String patientId});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$EditMemberImageEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? patientId = null,
  }) {
    return _then(_$StartedImpl(
      null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl(this.imagePath, this.patientId);

  @override
  final String imagePath;
  @override
  final String patientId;

  @override
  String toString() {
    return 'EditMemberImageEvent.started(imagePath: $imagePath, patientId: $patientId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagePath, patientId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imagePath, String patientId) started,
  }) {
    return started(imagePath, patientId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath, String patientId)? started,
  }) {
    return started?.call(imagePath, patientId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath, String patientId)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(imagePath, patientId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements EditMemberImageEvent {
  const factory _Started(final String imagePath, final String patientId) =
      _$StartedImpl;

  @override
  String get imagePath;
  @override
  String get patientId;
  @override
  @JsonKey(ignore: true)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EditMemberImageState {
  bool get isloding => throw _privateConstructorUsedError;
  AddMemberImags? get model => throw _privateConstructorUsedError;
  Option<Either<MainFailure, AddMemberImags>>
      get registerFaileurOrSuccessOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditMemberImageStateCopyWith<EditMemberImageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditMemberImageStateCopyWith<$Res> {
  factory $EditMemberImageStateCopyWith(EditMemberImageState value,
          $Res Function(EditMemberImageState) then) =
      _$EditMemberImageStateCopyWithImpl<$Res, EditMemberImageState>;
  @useResult
  $Res call(
      {bool isloding,
      AddMemberImags? model,
      Option<Either<MainFailure, AddMemberImags>>
          registerFaileurOrSuccessOption});
}

/// @nodoc
class _$EditMemberImageStateCopyWithImpl<$Res,
        $Val extends EditMemberImageState>
    implements $EditMemberImageStateCopyWith<$Res> {
  _$EditMemberImageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloding = null,
    Object? model = freezed,
    Object? registerFaileurOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isloding: null == isloding
          ? _value.isloding
          : isloding // ignore: cast_nullable_to_non_nullable
              as bool,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as AddMemberImags?,
      registerFaileurOrSuccessOption: null == registerFaileurOrSuccessOption
          ? _value.registerFaileurOrSuccessOption
          : registerFaileurOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, AddMemberImags>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $EditMemberImageStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isloding,
      AddMemberImags? model,
      Option<Either<MainFailure, AddMemberImags>>
          registerFaileurOrSuccessOption});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$EditMemberImageStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloding = null,
    Object? model = freezed,
    Object? registerFaileurOrSuccessOption = null,
  }) {
    return _then(_$InitialImpl(
      isloding: null == isloding
          ? _value.isloding
          : isloding // ignore: cast_nullable_to_non_nullable
              as bool,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as AddMemberImags?,
      registerFaileurOrSuccessOption: null == registerFaileurOrSuccessOption
          ? _value.registerFaileurOrSuccessOption
          : registerFaileurOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, AddMemberImags>>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isloding,
      this.model,
      required this.registerFaileurOrSuccessOption});

  @override
  final bool isloding;
  @override
  final AddMemberImags? model;
  @override
  final Option<Either<MainFailure, AddMemberImags>>
      registerFaileurOrSuccessOption;

  @override
  String toString() {
    return 'EditMemberImageState(isloding: $isloding, model: $model, registerFaileurOrSuccessOption: $registerFaileurOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isloding, isloding) ||
                other.isloding == isloding) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.registerFaileurOrSuccessOption,
                    registerFaileurOrSuccessOption) ||
                other.registerFaileurOrSuccessOption ==
                    registerFaileurOrSuccessOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isloding, model, registerFaileurOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements EditMemberImageState {
  const factory _Initial(
      {required final bool isloding,
      final AddMemberImags? model,
      required final Option<Either<MainFailure, AddMemberImags>>
          registerFaileurOrSuccessOption}) = _$InitialImpl;

  @override
  bool get isloding;
  @override
  AddMemberImags? get model;
  @override
  Option<Either<MainFailure, AddMemberImags>>
      get registerFaileurOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
