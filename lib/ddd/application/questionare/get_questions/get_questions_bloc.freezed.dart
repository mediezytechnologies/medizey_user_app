// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_questions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetQuestionsEvent {
  String get symptomId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String symptomId) getQuestions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String symptomId)? getQuestions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String symptomId)? getQuestions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetQuestions value) getQuestions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetQuestions value)? getQuestions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetQuestions value)? getQuestions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetQuestionsEventCopyWith<GetQuestionsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetQuestionsEventCopyWith<$Res> {
  factory $GetQuestionsEventCopyWith(
          GetQuestionsEvent value, $Res Function(GetQuestionsEvent) then) =
      _$GetQuestionsEventCopyWithImpl<$Res, GetQuestionsEvent>;
  @useResult
  $Res call({String symptomId});
}

/// @nodoc
class _$GetQuestionsEventCopyWithImpl<$Res, $Val extends GetQuestionsEvent>
    implements $GetQuestionsEventCopyWith<$Res> {
  _$GetQuestionsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symptomId = null,
  }) {
    return _then(_value.copyWith(
      symptomId: null == symptomId
          ? _value.symptomId
          : symptomId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetQuestionsImplCopyWith<$Res>
    implements $GetQuestionsEventCopyWith<$Res> {
  factory _$$GetQuestionsImplCopyWith(
          _$GetQuestionsImpl value, $Res Function(_$GetQuestionsImpl) then) =
      __$$GetQuestionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String symptomId});
}

/// @nodoc
class __$$GetQuestionsImplCopyWithImpl<$Res>
    extends _$GetQuestionsEventCopyWithImpl<$Res, _$GetQuestionsImpl>
    implements _$$GetQuestionsImplCopyWith<$Res> {
  __$$GetQuestionsImplCopyWithImpl(
      _$GetQuestionsImpl _value, $Res Function(_$GetQuestionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symptomId = null,
  }) {
    return _then(_$GetQuestionsImpl(
      null == symptomId
          ? _value.symptomId
          : symptomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetQuestionsImpl implements _GetQuestions {
  const _$GetQuestionsImpl(this.symptomId);

  @override
  final String symptomId;

  @override
  String toString() {
    return 'GetQuestionsEvent.getQuestions(symptomId: $symptomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetQuestionsImpl &&
            (identical(other.symptomId, symptomId) ||
                other.symptomId == symptomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, symptomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetQuestionsImplCopyWith<_$GetQuestionsImpl> get copyWith =>
      __$$GetQuestionsImplCopyWithImpl<_$GetQuestionsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String symptomId) getQuestions,
  }) {
    return getQuestions(symptomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String symptomId)? getQuestions,
  }) {
    return getQuestions?.call(symptomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String symptomId)? getQuestions,
    required TResult orElse(),
  }) {
    if (getQuestions != null) {
      return getQuestions(symptomId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetQuestions value) getQuestions,
  }) {
    return getQuestions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetQuestions value)? getQuestions,
  }) {
    return getQuestions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetQuestions value)? getQuestions,
    required TResult orElse(),
  }) {
    if (getQuestions != null) {
      return getQuestions(this);
    }
    return orElse();
  }
}

abstract class _GetQuestions implements GetQuestionsEvent {
  const factory _GetQuestions(final String symptomId) = _$GetQuestionsImpl;

  @override
  String get symptomId;
  @override
  @JsonKey(ignore: true)
  _$$GetQuestionsImplCopyWith<_$GetQuestionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetQuestionsState {
  bool get isloding => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  List<QuestionData> get model => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetQuestionsStateCopyWith<GetQuestionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetQuestionsStateCopyWith<$Res> {
  factory $GetQuestionsStateCopyWith(
          GetQuestionsState value, $Res Function(GetQuestionsState) then) =
      _$GetQuestionsStateCopyWithImpl<$Res, GetQuestionsState>;
  @useResult
  $Res call(
      {bool isloding,
      bool isError,
      String message,
      bool status,
      List<QuestionData> model});
}

/// @nodoc
class _$GetQuestionsStateCopyWithImpl<$Res, $Val extends GetQuestionsState>
    implements $GetQuestionsStateCopyWith<$Res> {
  _$GetQuestionsStateCopyWithImpl(this._value, this._then);

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
    Object? model = null,
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
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as List<QuestionData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $GetQuestionsStateCopyWith<$Res> {
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
      List<QuestionData> model});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetQuestionsStateCopyWithImpl<$Res, _$InitialImpl>
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
    Object? model = null,
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
      model: null == model
          ? _value._model
          : model // ignore: cast_nullable_to_non_nullable
              as List<QuestionData>,
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
      required final List<QuestionData> model})
      : _model = model;

  @override
  final bool isloding;
  @override
  final bool isError;
  @override
  final String message;
  @override
  final bool status;
  final List<QuestionData> _model;
  @override
  List<QuestionData> get model {
    if (_model is EqualUnmodifiableListView) return _model;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_model);
  }

  @override
  String toString() {
    return 'GetQuestionsState(isloding: $isloding, isError: $isError, message: $message, status: $status, model: $model)';
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
            const DeepCollectionEquality().equals(other._model, _model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isloding, isError, message,
      status, const DeepCollectionEquality().hash(_model));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements GetQuestionsState {
  const factory _Initial(
      {required final bool isloding,
      required final bool isError,
      required final String message,
      required final bool status,
      required final List<QuestionData> model}) = _$InitialImpl;

  @override
  bool get isloding;
  @override
  bool get isError;
  @override
  String get message;
  @override
  bool get status;
  @override
  List<QuestionData> get model;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
