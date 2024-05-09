// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_item_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RatingItemEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double ratingValue, String? ratingTest) started,
    required TResult Function(double ratingValue) ratingChanged,
    required TResult Function(String ratingTest) ratingTextChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue, String? ratingTest)? started,
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue, String? ratingTest)? started,
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RatingChanged value) ratingChanged,
    required TResult Function(_RatingTextChanged value) ratingTextChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingItemEventCopyWith<$Res> {
  factory $RatingItemEventCopyWith(
          RatingItemEvent value, $Res Function(RatingItemEvent) then) =
      _$RatingItemEventCopyWithImpl<$Res, RatingItemEvent>;
}

/// @nodoc
class _$RatingItemEventCopyWithImpl<$Res, $Val extends RatingItemEvent>
    implements $RatingItemEventCopyWith<$Res> {
  _$RatingItemEventCopyWithImpl(this._value, this._then);

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
  $Res call({double ratingValue, String? ratingTest});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$RatingItemEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratingValue = null,
    Object? ratingTest = freezed,
  }) {
    return _then(_$StartedImpl(
      ratingValue: null == ratingValue
          ? _value.ratingValue
          : ratingValue // ignore: cast_nullable_to_non_nullable
              as double,
      ratingTest: freezed == ratingTest
          ? _value.ratingTest
          : ratingTest // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl({required this.ratingValue, this.ratingTest});

  @override
  final double ratingValue;
  @override
  final String? ratingTest;

  @override
  String toString() {
    return 'RatingItemEvent.started(ratingValue: $ratingValue, ratingTest: $ratingTest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.ratingValue, ratingValue) ||
                other.ratingValue == ratingValue) &&
            (identical(other.ratingTest, ratingTest) ||
                other.ratingTest == ratingTest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ratingValue, ratingTest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double ratingValue, String? ratingTest) started,
    required TResult Function(double ratingValue) ratingChanged,
    required TResult Function(String ratingTest) ratingTextChanged,
  }) {
    return started(ratingValue, ratingTest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue, String? ratingTest)? started,
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
  }) {
    return started?.call(ratingValue, ratingTest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue, String? ratingTest)? started,
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(ratingValue, ratingTest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RatingChanged value) ratingChanged,
    required TResult Function(_RatingTextChanged value) ratingTextChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements RatingItemEvent {
  const factory _Started(
      {required final double ratingValue,
      final String? ratingTest}) = _$StartedImpl;

  double get ratingValue;
  String? get ratingTest;
  @JsonKey(ignore: true)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RatingChangedImplCopyWith<$Res> {
  factory _$$RatingChangedImplCopyWith(
          _$RatingChangedImpl value, $Res Function(_$RatingChangedImpl) then) =
      __$$RatingChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double ratingValue});
}

/// @nodoc
class __$$RatingChangedImplCopyWithImpl<$Res>
    extends _$RatingItemEventCopyWithImpl<$Res, _$RatingChangedImpl>
    implements _$$RatingChangedImplCopyWith<$Res> {
  __$$RatingChangedImplCopyWithImpl(
      _$RatingChangedImpl _value, $Res Function(_$RatingChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratingValue = null,
  }) {
    return _then(_$RatingChangedImpl(
      null == ratingValue
          ? _value.ratingValue
          : ratingValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$RatingChangedImpl implements _RatingChanged {
  const _$RatingChangedImpl(this.ratingValue);

  @override
  final double ratingValue;

  @override
  String toString() {
    return 'RatingItemEvent.ratingChanged(ratingValue: $ratingValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingChangedImpl &&
            (identical(other.ratingValue, ratingValue) ||
                other.ratingValue == ratingValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ratingValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingChangedImplCopyWith<_$RatingChangedImpl> get copyWith =>
      __$$RatingChangedImplCopyWithImpl<_$RatingChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double ratingValue, String? ratingTest) started,
    required TResult Function(double ratingValue) ratingChanged,
    required TResult Function(String ratingTest) ratingTextChanged,
  }) {
    return ratingChanged(ratingValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue, String? ratingTest)? started,
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
  }) {
    return ratingChanged?.call(ratingValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue, String? ratingTest)? started,
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    required TResult orElse(),
  }) {
    if (ratingChanged != null) {
      return ratingChanged(ratingValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RatingChanged value) ratingChanged,
    required TResult Function(_RatingTextChanged value) ratingTextChanged,
  }) {
    return ratingChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
  }) {
    return ratingChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    required TResult orElse(),
  }) {
    if (ratingChanged != null) {
      return ratingChanged(this);
    }
    return orElse();
  }
}

abstract class _RatingChanged implements RatingItemEvent {
  const factory _RatingChanged(final double ratingValue) = _$RatingChangedImpl;

  double get ratingValue;
  @JsonKey(ignore: true)
  _$$RatingChangedImplCopyWith<_$RatingChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RatingTextChangedImplCopyWith<$Res> {
  factory _$$RatingTextChangedImplCopyWith(_$RatingTextChangedImpl value,
          $Res Function(_$RatingTextChangedImpl) then) =
      __$$RatingTextChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String ratingTest});
}

/// @nodoc
class __$$RatingTextChangedImplCopyWithImpl<$Res>
    extends _$RatingItemEventCopyWithImpl<$Res, _$RatingTextChangedImpl>
    implements _$$RatingTextChangedImplCopyWith<$Res> {
  __$$RatingTextChangedImplCopyWithImpl(_$RatingTextChangedImpl _value,
      $Res Function(_$RatingTextChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratingTest = null,
  }) {
    return _then(_$RatingTextChangedImpl(
      null == ratingTest
          ? _value.ratingTest
          : ratingTest // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RatingTextChangedImpl implements _RatingTextChanged {
  const _$RatingTextChangedImpl(this.ratingTest);

  @override
  final String ratingTest;

  @override
  String toString() {
    return 'RatingItemEvent.ratingTextChanged(ratingTest: $ratingTest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingTextChangedImpl &&
            (identical(other.ratingTest, ratingTest) ||
                other.ratingTest == ratingTest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ratingTest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingTextChangedImplCopyWith<_$RatingTextChangedImpl> get copyWith =>
      __$$RatingTextChangedImplCopyWithImpl<_$RatingTextChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double ratingValue, String? ratingTest) started,
    required TResult Function(double ratingValue) ratingChanged,
    required TResult Function(String ratingTest) ratingTextChanged,
  }) {
    return ratingTextChanged(ratingTest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue, String? ratingTest)? started,
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
  }) {
    return ratingTextChanged?.call(ratingTest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue, String? ratingTest)? started,
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    required TResult orElse(),
  }) {
    if (ratingTextChanged != null) {
      return ratingTextChanged(ratingTest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RatingChanged value) ratingChanged,
    required TResult Function(_RatingTextChanged value) ratingTextChanged,
  }) {
    return ratingTextChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
  }) {
    return ratingTextChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    required TResult orElse(),
  }) {
    if (ratingTextChanged != null) {
      return ratingTextChanged(this);
    }
    return orElse();
  }
}

abstract class _RatingTextChanged implements RatingItemEvent {
  const factory _RatingTextChanged(final String ratingTest) =
      _$RatingTextChangedImpl;

  String get ratingTest;
  @JsonKey(ignore: true)
  _$$RatingTextChangedImplCopyWith<_$RatingTextChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RatingItemState {
  double get ratingValue => throw _privateConstructorUsedError;
  String? get ratingTest => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RatingItemStateCopyWith<RatingItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingItemStateCopyWith<$Res> {
  factory $RatingItemStateCopyWith(
          RatingItemState value, $Res Function(RatingItemState) then) =
      _$RatingItemStateCopyWithImpl<$Res, RatingItemState>;
  @useResult
  $Res call({double ratingValue, String? ratingTest});
}

/// @nodoc
class _$RatingItemStateCopyWithImpl<$Res, $Val extends RatingItemState>
    implements $RatingItemStateCopyWith<$Res> {
  _$RatingItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratingValue = null,
    Object? ratingTest = freezed,
  }) {
    return _then(_value.copyWith(
      ratingValue: null == ratingValue
          ? _value.ratingValue
          : ratingValue // ignore: cast_nullable_to_non_nullable
              as double,
      ratingTest: freezed == ratingTest
          ? _value.ratingTest
          : ratingTest // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $RatingItemStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double ratingValue, String? ratingTest});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RatingItemStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratingValue = null,
    Object? ratingTest = freezed,
  }) {
    return _then(_$InitialImpl(
      ratingValue: null == ratingValue
          ? _value.ratingValue
          : ratingValue // ignore: cast_nullable_to_non_nullable
              as double,
      ratingTest: freezed == ratingTest
          ? _value.ratingTest
          : ratingTest // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({required this.ratingValue, this.ratingTest});

  @override
  final double ratingValue;
  @override
  final String? ratingTest;

  @override
  String toString() {
    return 'RatingItemState(ratingValue: $ratingValue, ratingTest: $ratingTest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.ratingValue, ratingValue) ||
                other.ratingValue == ratingValue) &&
            (identical(other.ratingTest, ratingTest) ||
                other.ratingTest == ratingTest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ratingValue, ratingTest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements RatingItemState {
  const factory _Initial(
      {required final double ratingValue,
      final String? ratingTest}) = _$InitialImpl;

  @override
  double get ratingValue;
  @override
  String? get ratingTest;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
