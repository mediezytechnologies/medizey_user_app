// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RatingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double ratingValue) ratingChanged,
    required TResult Function(String ratingTest) ratingTextChanged,
    required TResult Function(int reasonIndex) ratingReasonChanged,
    required TResult Function(int likedIndex) ratingLikeChanged,
    required TResult Function(int radioIndex) ratingRadioChanged,
    required TResult Function(String feedback) ratingGetFeedBacks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
    TResult? Function(int reasonIndex)? ratingReasonChanged,
    TResult? Function(int likedIndex)? ratingLikeChanged,
    TResult? Function(int radioIndex)? ratingRadioChanged,
    TResult? Function(String feedback)? ratingGetFeedBacks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    TResult Function(int reasonIndex)? ratingReasonChanged,
    TResult Function(int likedIndex)? ratingLikeChanged,
    TResult Function(int radioIndex)? ratingRadioChanged,
    TResult Function(String feedback)? ratingGetFeedBacks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RatingChanged value) ratingChanged,
    required TResult Function(_RatingTextChanged value) ratingTextChanged,
    required TResult Function(_RatingReasonChanged value) ratingReasonChanged,
    required TResult Function(_RatingLikeChanged value) ratingLikeChanged,
    required TResult Function(_RatingRadioChanged value) ratingRadioChanged,
    required TResult Function(_RatingGetFeedBacks value) ratingGetFeedBacks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
    TResult? Function(_RatingReasonChanged value)? ratingReasonChanged,
    TResult? Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult? Function(_RatingRadioChanged value)? ratingRadioChanged,
    TResult? Function(_RatingGetFeedBacks value)? ratingGetFeedBacks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    TResult Function(_RatingReasonChanged value)? ratingReasonChanged,
    TResult Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult Function(_RatingRadioChanged value)? ratingRadioChanged,
    TResult Function(_RatingGetFeedBacks value)? ratingGetFeedBacks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingEventCopyWith<$Res> {
  factory $RatingEventCopyWith(
          RatingEvent value, $Res Function(RatingEvent) then) =
      _$RatingEventCopyWithImpl<$Res, RatingEvent>;
}

/// @nodoc
class _$RatingEventCopyWithImpl<$Res, $Val extends RatingEvent>
    implements $RatingEventCopyWith<$Res> {
  _$RatingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
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
    extends _$RatingEventCopyWithImpl<$Res, _$RatingChangedImpl>
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
    return 'RatingEvent.ratingChanged(ratingValue: $ratingValue)';
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
    required TResult Function(double ratingValue) ratingChanged,
    required TResult Function(String ratingTest) ratingTextChanged,
    required TResult Function(int reasonIndex) ratingReasonChanged,
    required TResult Function(int likedIndex) ratingLikeChanged,
    required TResult Function(int radioIndex) ratingRadioChanged,
    required TResult Function(String feedback) ratingGetFeedBacks,
  }) {
    return ratingChanged(ratingValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
    TResult? Function(int reasonIndex)? ratingReasonChanged,
    TResult? Function(int likedIndex)? ratingLikeChanged,
    TResult? Function(int radioIndex)? ratingRadioChanged,
    TResult? Function(String feedback)? ratingGetFeedBacks,
  }) {
    return ratingChanged?.call(ratingValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    TResult Function(int reasonIndex)? ratingReasonChanged,
    TResult Function(int likedIndex)? ratingLikeChanged,
    TResult Function(int radioIndex)? ratingRadioChanged,
    TResult Function(String feedback)? ratingGetFeedBacks,
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
    required TResult Function(_RatingChanged value) ratingChanged,
    required TResult Function(_RatingTextChanged value) ratingTextChanged,
    required TResult Function(_RatingReasonChanged value) ratingReasonChanged,
    required TResult Function(_RatingLikeChanged value) ratingLikeChanged,
    required TResult Function(_RatingRadioChanged value) ratingRadioChanged,
    required TResult Function(_RatingGetFeedBacks value) ratingGetFeedBacks,
  }) {
    return ratingChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
    TResult? Function(_RatingReasonChanged value)? ratingReasonChanged,
    TResult? Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult? Function(_RatingRadioChanged value)? ratingRadioChanged,
    TResult? Function(_RatingGetFeedBacks value)? ratingGetFeedBacks,
  }) {
    return ratingChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    TResult Function(_RatingReasonChanged value)? ratingReasonChanged,
    TResult Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult Function(_RatingRadioChanged value)? ratingRadioChanged,
    TResult Function(_RatingGetFeedBacks value)? ratingGetFeedBacks,
    required TResult orElse(),
  }) {
    if (ratingChanged != null) {
      return ratingChanged(this);
    }
    return orElse();
  }
}

abstract class _RatingChanged implements RatingEvent {
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
    extends _$RatingEventCopyWithImpl<$Res, _$RatingTextChangedImpl>
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
    return 'RatingEvent.ratingTextChanged(ratingTest: $ratingTest)';
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
    required TResult Function(double ratingValue) ratingChanged,
    required TResult Function(String ratingTest) ratingTextChanged,
    required TResult Function(int reasonIndex) ratingReasonChanged,
    required TResult Function(int likedIndex) ratingLikeChanged,
    required TResult Function(int radioIndex) ratingRadioChanged,
    required TResult Function(String feedback) ratingGetFeedBacks,
  }) {
    return ratingTextChanged(ratingTest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
    TResult? Function(int reasonIndex)? ratingReasonChanged,
    TResult? Function(int likedIndex)? ratingLikeChanged,
    TResult? Function(int radioIndex)? ratingRadioChanged,
    TResult? Function(String feedback)? ratingGetFeedBacks,
  }) {
    return ratingTextChanged?.call(ratingTest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    TResult Function(int reasonIndex)? ratingReasonChanged,
    TResult Function(int likedIndex)? ratingLikeChanged,
    TResult Function(int radioIndex)? ratingRadioChanged,
    TResult Function(String feedback)? ratingGetFeedBacks,
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
    required TResult Function(_RatingChanged value) ratingChanged,
    required TResult Function(_RatingTextChanged value) ratingTextChanged,
    required TResult Function(_RatingReasonChanged value) ratingReasonChanged,
    required TResult Function(_RatingLikeChanged value) ratingLikeChanged,
    required TResult Function(_RatingRadioChanged value) ratingRadioChanged,
    required TResult Function(_RatingGetFeedBacks value) ratingGetFeedBacks,
  }) {
    return ratingTextChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
    TResult? Function(_RatingReasonChanged value)? ratingReasonChanged,
    TResult? Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult? Function(_RatingRadioChanged value)? ratingRadioChanged,
    TResult? Function(_RatingGetFeedBacks value)? ratingGetFeedBacks,
  }) {
    return ratingTextChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    TResult Function(_RatingReasonChanged value)? ratingReasonChanged,
    TResult Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult Function(_RatingRadioChanged value)? ratingRadioChanged,
    TResult Function(_RatingGetFeedBacks value)? ratingGetFeedBacks,
    required TResult orElse(),
  }) {
    if (ratingTextChanged != null) {
      return ratingTextChanged(this);
    }
    return orElse();
  }
}

abstract class _RatingTextChanged implements RatingEvent {
  const factory _RatingTextChanged(final String ratingTest) =
      _$RatingTextChangedImpl;

  String get ratingTest;
  @JsonKey(ignore: true)
  _$$RatingTextChangedImplCopyWith<_$RatingTextChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RatingReasonChangedImplCopyWith<$Res> {
  factory _$$RatingReasonChangedImplCopyWith(_$RatingReasonChangedImpl value,
          $Res Function(_$RatingReasonChangedImpl) then) =
      __$$RatingReasonChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int reasonIndex});
}

/// @nodoc
class __$$RatingReasonChangedImplCopyWithImpl<$Res>
    extends _$RatingEventCopyWithImpl<$Res, _$RatingReasonChangedImpl>
    implements _$$RatingReasonChangedImplCopyWith<$Res> {
  __$$RatingReasonChangedImplCopyWithImpl(_$RatingReasonChangedImpl _value,
      $Res Function(_$RatingReasonChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reasonIndex = null,
  }) {
    return _then(_$RatingReasonChangedImpl(
      null == reasonIndex
          ? _value.reasonIndex
          : reasonIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RatingReasonChangedImpl implements _RatingReasonChanged {
  const _$RatingReasonChangedImpl(this.reasonIndex);

  @override
  final int reasonIndex;

  @override
  String toString() {
    return 'RatingEvent.ratingReasonChanged(reasonIndex: $reasonIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingReasonChangedImpl &&
            (identical(other.reasonIndex, reasonIndex) ||
                other.reasonIndex == reasonIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reasonIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingReasonChangedImplCopyWith<_$RatingReasonChangedImpl> get copyWith =>
      __$$RatingReasonChangedImplCopyWithImpl<_$RatingReasonChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double ratingValue) ratingChanged,
    required TResult Function(String ratingTest) ratingTextChanged,
    required TResult Function(int reasonIndex) ratingReasonChanged,
    required TResult Function(int likedIndex) ratingLikeChanged,
    required TResult Function(int radioIndex) ratingRadioChanged,
    required TResult Function(String feedback) ratingGetFeedBacks,
  }) {
    return ratingReasonChanged(reasonIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
    TResult? Function(int reasonIndex)? ratingReasonChanged,
    TResult? Function(int likedIndex)? ratingLikeChanged,
    TResult? Function(int radioIndex)? ratingRadioChanged,
    TResult? Function(String feedback)? ratingGetFeedBacks,
  }) {
    return ratingReasonChanged?.call(reasonIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    TResult Function(int reasonIndex)? ratingReasonChanged,
    TResult Function(int likedIndex)? ratingLikeChanged,
    TResult Function(int radioIndex)? ratingRadioChanged,
    TResult Function(String feedback)? ratingGetFeedBacks,
    required TResult orElse(),
  }) {
    if (ratingReasonChanged != null) {
      return ratingReasonChanged(reasonIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RatingChanged value) ratingChanged,
    required TResult Function(_RatingTextChanged value) ratingTextChanged,
    required TResult Function(_RatingReasonChanged value) ratingReasonChanged,
    required TResult Function(_RatingLikeChanged value) ratingLikeChanged,
    required TResult Function(_RatingRadioChanged value) ratingRadioChanged,
    required TResult Function(_RatingGetFeedBacks value) ratingGetFeedBacks,
  }) {
    return ratingReasonChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
    TResult? Function(_RatingReasonChanged value)? ratingReasonChanged,
    TResult? Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult? Function(_RatingRadioChanged value)? ratingRadioChanged,
    TResult? Function(_RatingGetFeedBacks value)? ratingGetFeedBacks,
  }) {
    return ratingReasonChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    TResult Function(_RatingReasonChanged value)? ratingReasonChanged,
    TResult Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult Function(_RatingRadioChanged value)? ratingRadioChanged,
    TResult Function(_RatingGetFeedBacks value)? ratingGetFeedBacks,
    required TResult orElse(),
  }) {
    if (ratingReasonChanged != null) {
      return ratingReasonChanged(this);
    }
    return orElse();
  }
}

abstract class _RatingReasonChanged implements RatingEvent {
  const factory _RatingReasonChanged(final int reasonIndex) =
      _$RatingReasonChangedImpl;

  int get reasonIndex;
  @JsonKey(ignore: true)
  _$$RatingReasonChangedImplCopyWith<_$RatingReasonChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RatingLikeChangedImplCopyWith<$Res> {
  factory _$$RatingLikeChangedImplCopyWith(_$RatingLikeChangedImpl value,
          $Res Function(_$RatingLikeChangedImpl) then) =
      __$$RatingLikeChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int likedIndex});
}

/// @nodoc
class __$$RatingLikeChangedImplCopyWithImpl<$Res>
    extends _$RatingEventCopyWithImpl<$Res, _$RatingLikeChangedImpl>
    implements _$$RatingLikeChangedImplCopyWith<$Res> {
  __$$RatingLikeChangedImplCopyWithImpl(_$RatingLikeChangedImpl _value,
      $Res Function(_$RatingLikeChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likedIndex = null,
  }) {
    return _then(_$RatingLikeChangedImpl(
      null == likedIndex
          ? _value.likedIndex
          : likedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RatingLikeChangedImpl implements _RatingLikeChanged {
  const _$RatingLikeChangedImpl(this.likedIndex);

  @override
  final int likedIndex;

  @override
  String toString() {
    return 'RatingEvent.ratingLikeChanged(likedIndex: $likedIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingLikeChangedImpl &&
            (identical(other.likedIndex, likedIndex) ||
                other.likedIndex == likedIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, likedIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingLikeChangedImplCopyWith<_$RatingLikeChangedImpl> get copyWith =>
      __$$RatingLikeChangedImplCopyWithImpl<_$RatingLikeChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double ratingValue) ratingChanged,
    required TResult Function(String ratingTest) ratingTextChanged,
    required TResult Function(int reasonIndex) ratingReasonChanged,
    required TResult Function(int likedIndex) ratingLikeChanged,
    required TResult Function(int radioIndex) ratingRadioChanged,
    required TResult Function(String feedback) ratingGetFeedBacks,
  }) {
    return ratingLikeChanged(likedIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
    TResult? Function(int reasonIndex)? ratingReasonChanged,
    TResult? Function(int likedIndex)? ratingLikeChanged,
    TResult? Function(int radioIndex)? ratingRadioChanged,
    TResult? Function(String feedback)? ratingGetFeedBacks,
  }) {
    return ratingLikeChanged?.call(likedIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    TResult Function(int reasonIndex)? ratingReasonChanged,
    TResult Function(int likedIndex)? ratingLikeChanged,
    TResult Function(int radioIndex)? ratingRadioChanged,
    TResult Function(String feedback)? ratingGetFeedBacks,
    required TResult orElse(),
  }) {
    if (ratingLikeChanged != null) {
      return ratingLikeChanged(likedIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RatingChanged value) ratingChanged,
    required TResult Function(_RatingTextChanged value) ratingTextChanged,
    required TResult Function(_RatingReasonChanged value) ratingReasonChanged,
    required TResult Function(_RatingLikeChanged value) ratingLikeChanged,
    required TResult Function(_RatingRadioChanged value) ratingRadioChanged,
    required TResult Function(_RatingGetFeedBacks value) ratingGetFeedBacks,
  }) {
    return ratingLikeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
    TResult? Function(_RatingReasonChanged value)? ratingReasonChanged,
    TResult? Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult? Function(_RatingRadioChanged value)? ratingRadioChanged,
    TResult? Function(_RatingGetFeedBacks value)? ratingGetFeedBacks,
  }) {
    return ratingLikeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    TResult Function(_RatingReasonChanged value)? ratingReasonChanged,
    TResult Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult Function(_RatingRadioChanged value)? ratingRadioChanged,
    TResult Function(_RatingGetFeedBacks value)? ratingGetFeedBacks,
    required TResult orElse(),
  }) {
    if (ratingLikeChanged != null) {
      return ratingLikeChanged(this);
    }
    return orElse();
  }
}

abstract class _RatingLikeChanged implements RatingEvent {
  const factory _RatingLikeChanged(final int likedIndex) =
      _$RatingLikeChangedImpl;

  int get likedIndex;
  @JsonKey(ignore: true)
  _$$RatingLikeChangedImplCopyWith<_$RatingLikeChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RatingRadioChangedImplCopyWith<$Res> {
  factory _$$RatingRadioChangedImplCopyWith(_$RatingRadioChangedImpl value,
          $Res Function(_$RatingRadioChangedImpl) then) =
      __$$RatingRadioChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int radioIndex});
}

/// @nodoc
class __$$RatingRadioChangedImplCopyWithImpl<$Res>
    extends _$RatingEventCopyWithImpl<$Res, _$RatingRadioChangedImpl>
    implements _$$RatingRadioChangedImplCopyWith<$Res> {
  __$$RatingRadioChangedImplCopyWithImpl(_$RatingRadioChangedImpl _value,
      $Res Function(_$RatingRadioChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? radioIndex = null,
  }) {
    return _then(_$RatingRadioChangedImpl(
      null == radioIndex
          ? _value.radioIndex
          : radioIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RatingRadioChangedImpl implements _RatingRadioChanged {
  const _$RatingRadioChangedImpl(this.radioIndex);

  @override
  final int radioIndex;

  @override
  String toString() {
    return 'RatingEvent.ratingRadioChanged(radioIndex: $radioIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingRadioChangedImpl &&
            (identical(other.radioIndex, radioIndex) ||
                other.radioIndex == radioIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, radioIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingRadioChangedImplCopyWith<_$RatingRadioChangedImpl> get copyWith =>
      __$$RatingRadioChangedImplCopyWithImpl<_$RatingRadioChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double ratingValue) ratingChanged,
    required TResult Function(String ratingTest) ratingTextChanged,
    required TResult Function(int reasonIndex) ratingReasonChanged,
    required TResult Function(int likedIndex) ratingLikeChanged,
    required TResult Function(int radioIndex) ratingRadioChanged,
    required TResult Function(String feedback) ratingGetFeedBacks,
  }) {
    return ratingRadioChanged(radioIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
    TResult? Function(int reasonIndex)? ratingReasonChanged,
    TResult? Function(int likedIndex)? ratingLikeChanged,
    TResult? Function(int radioIndex)? ratingRadioChanged,
    TResult? Function(String feedback)? ratingGetFeedBacks,
  }) {
    return ratingRadioChanged?.call(radioIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    TResult Function(int reasonIndex)? ratingReasonChanged,
    TResult Function(int likedIndex)? ratingLikeChanged,
    TResult Function(int radioIndex)? ratingRadioChanged,
    TResult Function(String feedback)? ratingGetFeedBacks,
    required TResult orElse(),
  }) {
    if (ratingRadioChanged != null) {
      return ratingRadioChanged(radioIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RatingChanged value) ratingChanged,
    required TResult Function(_RatingTextChanged value) ratingTextChanged,
    required TResult Function(_RatingReasonChanged value) ratingReasonChanged,
    required TResult Function(_RatingLikeChanged value) ratingLikeChanged,
    required TResult Function(_RatingRadioChanged value) ratingRadioChanged,
    required TResult Function(_RatingGetFeedBacks value) ratingGetFeedBacks,
  }) {
    return ratingRadioChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
    TResult? Function(_RatingReasonChanged value)? ratingReasonChanged,
    TResult? Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult? Function(_RatingRadioChanged value)? ratingRadioChanged,
    TResult? Function(_RatingGetFeedBacks value)? ratingGetFeedBacks,
  }) {
    return ratingRadioChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    TResult Function(_RatingReasonChanged value)? ratingReasonChanged,
    TResult Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult Function(_RatingRadioChanged value)? ratingRadioChanged,
    TResult Function(_RatingGetFeedBacks value)? ratingGetFeedBacks,
    required TResult orElse(),
  }) {
    if (ratingRadioChanged != null) {
      return ratingRadioChanged(this);
    }
    return orElse();
  }
}

abstract class _RatingRadioChanged implements RatingEvent {
  const factory _RatingRadioChanged(final int radioIndex) =
      _$RatingRadioChangedImpl;

  int get radioIndex;
  @JsonKey(ignore: true)
  _$$RatingRadioChangedImplCopyWith<_$RatingRadioChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RatingGetFeedBacksImplCopyWith<$Res> {
  factory _$$RatingGetFeedBacksImplCopyWith(_$RatingGetFeedBacksImpl value,
          $Res Function(_$RatingGetFeedBacksImpl) then) =
      __$$RatingGetFeedBacksImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String feedback});
}

/// @nodoc
class __$$RatingGetFeedBacksImplCopyWithImpl<$Res>
    extends _$RatingEventCopyWithImpl<$Res, _$RatingGetFeedBacksImpl>
    implements _$$RatingGetFeedBacksImplCopyWith<$Res> {
  __$$RatingGetFeedBacksImplCopyWithImpl(_$RatingGetFeedBacksImpl _value,
      $Res Function(_$RatingGetFeedBacksImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedback = null,
  }) {
    return _then(_$RatingGetFeedBacksImpl(
      null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RatingGetFeedBacksImpl implements _RatingGetFeedBacks {
  const _$RatingGetFeedBacksImpl(this.feedback);

  @override
  final String feedback;

  @override
  String toString() {
    return 'RatingEvent.ratingGetFeedBacks(feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingGetFeedBacksImpl &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, feedback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingGetFeedBacksImplCopyWith<_$RatingGetFeedBacksImpl> get copyWith =>
      __$$RatingGetFeedBacksImplCopyWithImpl<_$RatingGetFeedBacksImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double ratingValue) ratingChanged,
    required TResult Function(String ratingTest) ratingTextChanged,
    required TResult Function(int reasonIndex) ratingReasonChanged,
    required TResult Function(int likedIndex) ratingLikeChanged,
    required TResult Function(int radioIndex) ratingRadioChanged,
    required TResult Function(String feedback) ratingGetFeedBacks,
  }) {
    return ratingGetFeedBacks(feedback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
    TResult? Function(int reasonIndex)? ratingReasonChanged,
    TResult? Function(int likedIndex)? ratingLikeChanged,
    TResult? Function(int radioIndex)? ratingRadioChanged,
    TResult? Function(String feedback)? ratingGetFeedBacks,
  }) {
    return ratingGetFeedBacks?.call(feedback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    TResult Function(int reasonIndex)? ratingReasonChanged,
    TResult Function(int likedIndex)? ratingLikeChanged,
    TResult Function(int radioIndex)? ratingRadioChanged,
    TResult Function(String feedback)? ratingGetFeedBacks,
    required TResult orElse(),
  }) {
    if (ratingGetFeedBacks != null) {
      return ratingGetFeedBacks(feedback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RatingChanged value) ratingChanged,
    required TResult Function(_RatingTextChanged value) ratingTextChanged,
    required TResult Function(_RatingReasonChanged value) ratingReasonChanged,
    required TResult Function(_RatingLikeChanged value) ratingLikeChanged,
    required TResult Function(_RatingRadioChanged value) ratingRadioChanged,
    required TResult Function(_RatingGetFeedBacks value) ratingGetFeedBacks,
  }) {
    return ratingGetFeedBacks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
    TResult? Function(_RatingReasonChanged value)? ratingReasonChanged,
    TResult? Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult? Function(_RatingRadioChanged value)? ratingRadioChanged,
    TResult? Function(_RatingGetFeedBacks value)? ratingGetFeedBacks,
  }) {
    return ratingGetFeedBacks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    TResult Function(_RatingReasonChanged value)? ratingReasonChanged,
    TResult Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult Function(_RatingRadioChanged value)? ratingRadioChanged,
    TResult Function(_RatingGetFeedBacks value)? ratingGetFeedBacks,
    required TResult orElse(),
  }) {
    if (ratingGetFeedBacks != null) {
      return ratingGetFeedBacks(this);
    }
    return orElse();
  }
}

abstract class _RatingGetFeedBacks implements RatingEvent {
  const factory _RatingGetFeedBacks(final String feedback) =
      _$RatingGetFeedBacksImpl;

  String get feedback;
  @JsonKey(ignore: true)
  _$$RatingGetFeedBacksImplCopyWith<_$RatingGetFeedBacksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RatingState {
  bool get isloading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  bool get addIsloading => throw _privateConstructorUsedError;
  bool get addIsError => throw _privateConstructorUsedError;
  String get addMessage => throw _privateConstructorUsedError;
  bool get addStatus => throw _privateConstructorUsedError;
  double get ratingValue => throw _privateConstructorUsedError;
  String get ratingTest => throw _privateConstructorUsedError;
  GetRatingModel? get userRating => throw _privateConstructorUsedError;
  int get reasonIndex => throw _privateConstructorUsedError;
  int get likedIndex => throw _privateConstructorUsedError;
  AddRatingModel? get addRatingModel => throw _privateConstructorUsedError;
  int get radioIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RatingStateCopyWith<RatingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingStateCopyWith<$Res> {
  factory $RatingStateCopyWith(
          RatingState value, $Res Function(RatingState) then) =
      _$RatingStateCopyWithImpl<$Res, RatingState>;
  @useResult
  $Res call(
      {bool isloading,
      bool isError,
      String message,
      bool status,
      bool addIsloading,
      bool addIsError,
      String addMessage,
      bool addStatus,
      double ratingValue,
      String ratingTest,
      GetRatingModel? userRating,
      int reasonIndex,
      int likedIndex,
      AddRatingModel? addRatingModel,
      int radioIndex});
}

/// @nodoc
class _$RatingStateCopyWithImpl<$Res, $Val extends RatingState>
    implements $RatingStateCopyWith<$Res> {
  _$RatingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloading = null,
    Object? isError = null,
    Object? message = null,
    Object? status = null,
    Object? addIsloading = null,
    Object? addIsError = null,
    Object? addMessage = null,
    Object? addStatus = null,
    Object? ratingValue = null,
    Object? ratingTest = null,
    Object? userRating = freezed,
    Object? reasonIndex = null,
    Object? likedIndex = null,
    Object? addRatingModel = freezed,
    Object? radioIndex = null,
  }) {
    return _then(_value.copyWith(
      isloading: null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
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
      addIsloading: null == addIsloading
          ? _value.addIsloading
          : addIsloading // ignore: cast_nullable_to_non_nullable
              as bool,
      addIsError: null == addIsError
          ? _value.addIsError
          : addIsError // ignore: cast_nullable_to_non_nullable
              as bool,
      addMessage: null == addMessage
          ? _value.addMessage
          : addMessage // ignore: cast_nullable_to_non_nullable
              as String,
      addStatus: null == addStatus
          ? _value.addStatus
          : addStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      ratingValue: null == ratingValue
          ? _value.ratingValue
          : ratingValue // ignore: cast_nullable_to_non_nullable
              as double,
      ratingTest: null == ratingTest
          ? _value.ratingTest
          : ratingTest // ignore: cast_nullable_to_non_nullable
              as String,
      userRating: freezed == userRating
          ? _value.userRating
          : userRating // ignore: cast_nullable_to_non_nullable
              as GetRatingModel?,
      reasonIndex: null == reasonIndex
          ? _value.reasonIndex
          : reasonIndex // ignore: cast_nullable_to_non_nullable
              as int,
      likedIndex: null == likedIndex
          ? _value.likedIndex
          : likedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      addRatingModel: freezed == addRatingModel
          ? _value.addRatingModel
          : addRatingModel // ignore: cast_nullable_to_non_nullable
              as AddRatingModel?,
      radioIndex: null == radioIndex
          ? _value.radioIndex
          : radioIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $RatingStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isloading,
      bool isError,
      String message,
      bool status,
      bool addIsloading,
      bool addIsError,
      String addMessage,
      bool addStatus,
      double ratingValue,
      String ratingTest,
      GetRatingModel? userRating,
      int reasonIndex,
      int likedIndex,
      AddRatingModel? addRatingModel,
      int radioIndex});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RatingStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloading = null,
    Object? isError = null,
    Object? message = null,
    Object? status = null,
    Object? addIsloading = null,
    Object? addIsError = null,
    Object? addMessage = null,
    Object? addStatus = null,
    Object? ratingValue = null,
    Object? ratingTest = null,
    Object? userRating = freezed,
    Object? reasonIndex = null,
    Object? likedIndex = null,
    Object? addRatingModel = freezed,
    Object? radioIndex = null,
  }) {
    return _then(_$InitialImpl(
      isloading: null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
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
      addIsloading: null == addIsloading
          ? _value.addIsloading
          : addIsloading // ignore: cast_nullable_to_non_nullable
              as bool,
      addIsError: null == addIsError
          ? _value.addIsError
          : addIsError // ignore: cast_nullable_to_non_nullable
              as bool,
      addMessage: null == addMessage
          ? _value.addMessage
          : addMessage // ignore: cast_nullable_to_non_nullable
              as String,
      addStatus: null == addStatus
          ? _value.addStatus
          : addStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      ratingValue: null == ratingValue
          ? _value.ratingValue
          : ratingValue // ignore: cast_nullable_to_non_nullable
              as double,
      ratingTest: null == ratingTest
          ? _value.ratingTest
          : ratingTest // ignore: cast_nullable_to_non_nullable
              as String,
      userRating: freezed == userRating
          ? _value.userRating
          : userRating // ignore: cast_nullable_to_non_nullable
              as GetRatingModel?,
      reasonIndex: null == reasonIndex
          ? _value.reasonIndex
          : reasonIndex // ignore: cast_nullable_to_non_nullable
              as int,
      likedIndex: null == likedIndex
          ? _value.likedIndex
          : likedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      addRatingModel: freezed == addRatingModel
          ? _value.addRatingModel
          : addRatingModel // ignore: cast_nullable_to_non_nullable
              as AddRatingModel?,
      radioIndex: null == radioIndex
          ? _value.radioIndex
          : radioIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isloading,
      required this.isError,
      required this.message,
      required this.status,
      required this.addIsloading,
      required this.addIsError,
      required this.addMessage,
      required this.addStatus,
      required this.ratingValue,
      required this.ratingTest,
      this.userRating,
      required this.reasonIndex,
      required this.likedIndex,
      this.addRatingModel,
      required this.radioIndex});

  @override
  final bool isloading;
  @override
  final bool isError;
  @override
  final String message;
  @override
  final bool status;
  @override
  final bool addIsloading;
  @override
  final bool addIsError;
  @override
  final String addMessage;
  @override
  final bool addStatus;
  @override
  final double ratingValue;
  @override
  final String ratingTest;
  @override
  final GetRatingModel? userRating;
  @override
  final int reasonIndex;
  @override
  final int likedIndex;
  @override
  final AddRatingModel? addRatingModel;
  @override
  final int radioIndex;

  @override
  String toString() {
    return 'RatingState(isloading: $isloading, isError: $isError, message: $message, status: $status, addIsloading: $addIsloading, addIsError: $addIsError, addMessage: $addMessage, addStatus: $addStatus, ratingValue: $ratingValue, ratingTest: $ratingTest, userRating: $userRating, reasonIndex: $reasonIndex, likedIndex: $likedIndex, addRatingModel: $addRatingModel, radioIndex: $radioIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isloading, isloading) ||
                other.isloading == isloading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.addIsloading, addIsloading) ||
                other.addIsloading == addIsloading) &&
            (identical(other.addIsError, addIsError) ||
                other.addIsError == addIsError) &&
            (identical(other.addMessage, addMessage) ||
                other.addMessage == addMessage) &&
            (identical(other.addStatus, addStatus) ||
                other.addStatus == addStatus) &&
            (identical(other.ratingValue, ratingValue) ||
                other.ratingValue == ratingValue) &&
            (identical(other.ratingTest, ratingTest) ||
                other.ratingTest == ratingTest) &&
            (identical(other.userRating, userRating) ||
                other.userRating == userRating) &&
            (identical(other.reasonIndex, reasonIndex) ||
                other.reasonIndex == reasonIndex) &&
            (identical(other.likedIndex, likedIndex) ||
                other.likedIndex == likedIndex) &&
            (identical(other.addRatingModel, addRatingModel) ||
                other.addRatingModel == addRatingModel) &&
            (identical(other.radioIndex, radioIndex) ||
                other.radioIndex == radioIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isloading,
      isError,
      message,
      status,
      addIsloading,
      addIsError,
      addMessage,
      addStatus,
      ratingValue,
      ratingTest,
      userRating,
      reasonIndex,
      likedIndex,
      addRatingModel,
      radioIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements RatingState {
  const factory _Initial(
      {required final bool isloading,
      required final bool isError,
      required final String message,
      required final bool status,
      required final bool addIsloading,
      required final bool addIsError,
      required final String addMessage,
      required final bool addStatus,
      required final double ratingValue,
      required final String ratingTest,
      final GetRatingModel? userRating,
      required final int reasonIndex,
      required final int likedIndex,
      final AddRatingModel? addRatingModel,
      required final int radioIndex}) = _$InitialImpl;

  @override
  bool get isloading;
  @override
  bool get isError;
  @override
  String get message;
  @override
  bool get status;
  @override
  bool get addIsloading;
  @override
  bool get addIsError;
  @override
  String get addMessage;
  @override
  bool get addStatus;
  @override
  double get ratingValue;
  @override
  String get ratingTest;
  @override
  GetRatingModel? get userRating;
  @override
  int get reasonIndex;
  @override
  int get likedIndex;
  @override
  AddRatingModel? get addRatingModel;
  @override
  int get radioIndex;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
