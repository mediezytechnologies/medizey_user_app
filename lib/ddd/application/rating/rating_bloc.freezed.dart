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
    required TResult Function(int resonIndex) ratingResonChanged,
    required TResult Function(int likedIndex) ratingLikeChanged,
    required TResult Function(int radioIndex) ratingRadioChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
    TResult? Function(int resonIndex)? ratingResonChanged,
    TResult? Function(int likedIndex)? ratingLikeChanged,
    TResult? Function(int radioIndex)? ratingRadioChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    TResult Function(int resonIndex)? ratingResonChanged,
    TResult Function(int likedIndex)? ratingLikeChanged,
    TResult Function(int radioIndex)? ratingRadioChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RatingChanged value) ratingChanged,
    required TResult Function(_RatingTextChanged value) ratingTextChanged,
    required TResult Function(_RatingResonChanged value) ratingResonChanged,
    required TResult Function(_RatingLikeChanged value) ratingLikeChanged,
    required TResult Function(_RatingRadioChanged value) ratingRadioChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
    TResult? Function(_RatingResonChanged value)? ratingResonChanged,
    TResult? Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult? Function(_RatingRadioChanged value)? ratingRadioChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    TResult Function(_RatingResonChanged value)? ratingResonChanged,
    TResult Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult Function(_RatingRadioChanged value)? ratingRadioChanged,
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
    required TResult Function(int resonIndex) ratingResonChanged,
    required TResult Function(int likedIndex) ratingLikeChanged,
    required TResult Function(int radioIndex) ratingRadioChanged,
  }) {
    return ratingChanged(ratingValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
    TResult? Function(int resonIndex)? ratingResonChanged,
    TResult? Function(int likedIndex)? ratingLikeChanged,
    TResult? Function(int radioIndex)? ratingRadioChanged,
  }) {
    return ratingChanged?.call(ratingValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    TResult Function(int resonIndex)? ratingResonChanged,
    TResult Function(int likedIndex)? ratingLikeChanged,
    TResult Function(int radioIndex)? ratingRadioChanged,
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
    required TResult Function(_RatingResonChanged value) ratingResonChanged,
    required TResult Function(_RatingLikeChanged value) ratingLikeChanged,
    required TResult Function(_RatingRadioChanged value) ratingRadioChanged,
  }) {
    return ratingChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
    TResult? Function(_RatingResonChanged value)? ratingResonChanged,
    TResult? Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult? Function(_RatingRadioChanged value)? ratingRadioChanged,
  }) {
    return ratingChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    TResult Function(_RatingResonChanged value)? ratingResonChanged,
    TResult Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult Function(_RatingRadioChanged value)? ratingRadioChanged,
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
    required TResult Function(int resonIndex) ratingResonChanged,
    required TResult Function(int likedIndex) ratingLikeChanged,
    required TResult Function(int radioIndex) ratingRadioChanged,
  }) {
    return ratingTextChanged(ratingTest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
    TResult? Function(int resonIndex)? ratingResonChanged,
    TResult? Function(int likedIndex)? ratingLikeChanged,
    TResult? Function(int radioIndex)? ratingRadioChanged,
  }) {
    return ratingTextChanged?.call(ratingTest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    TResult Function(int resonIndex)? ratingResonChanged,
    TResult Function(int likedIndex)? ratingLikeChanged,
    TResult Function(int radioIndex)? ratingRadioChanged,
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
    required TResult Function(_RatingResonChanged value) ratingResonChanged,
    required TResult Function(_RatingLikeChanged value) ratingLikeChanged,
    required TResult Function(_RatingRadioChanged value) ratingRadioChanged,
  }) {
    return ratingTextChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
    TResult? Function(_RatingResonChanged value)? ratingResonChanged,
    TResult? Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult? Function(_RatingRadioChanged value)? ratingRadioChanged,
  }) {
    return ratingTextChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    TResult Function(_RatingResonChanged value)? ratingResonChanged,
    TResult Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult Function(_RatingRadioChanged value)? ratingRadioChanged,
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
abstract class _$$RatingResonChangedImplCopyWith<$Res> {
  factory _$$RatingResonChangedImplCopyWith(_$RatingResonChangedImpl value,
          $Res Function(_$RatingResonChangedImpl) then) =
      __$$RatingResonChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int resonIndex});
}

/// @nodoc
class __$$RatingResonChangedImplCopyWithImpl<$Res>
    extends _$RatingEventCopyWithImpl<$Res, _$RatingResonChangedImpl>
    implements _$$RatingResonChangedImplCopyWith<$Res> {
  __$$RatingResonChangedImplCopyWithImpl(_$RatingResonChangedImpl _value,
      $Res Function(_$RatingResonChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resonIndex = null,
  }) {
    return _then(_$RatingResonChangedImpl(
      null == resonIndex
          ? _value.resonIndex
          : resonIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RatingResonChangedImpl implements _RatingResonChanged {
  const _$RatingResonChangedImpl(this.resonIndex);

  @override
  final int resonIndex;

  @override
  String toString() {
    return 'RatingEvent.ratingResonChanged(resonIndex: $resonIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingResonChangedImpl &&
            (identical(other.resonIndex, resonIndex) ||
                other.resonIndex == resonIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resonIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingResonChangedImplCopyWith<_$RatingResonChangedImpl> get copyWith =>
      __$$RatingResonChangedImplCopyWithImpl<_$RatingResonChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double ratingValue) ratingChanged,
    required TResult Function(String ratingTest) ratingTextChanged,
    required TResult Function(int resonIndex) ratingResonChanged,
    required TResult Function(int likedIndex) ratingLikeChanged,
    required TResult Function(int radioIndex) ratingRadioChanged,
  }) {
    return ratingResonChanged(resonIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
    TResult? Function(int resonIndex)? ratingResonChanged,
    TResult? Function(int likedIndex)? ratingLikeChanged,
    TResult? Function(int radioIndex)? ratingRadioChanged,
  }) {
    return ratingResonChanged?.call(resonIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    TResult Function(int resonIndex)? ratingResonChanged,
    TResult Function(int likedIndex)? ratingLikeChanged,
    TResult Function(int radioIndex)? ratingRadioChanged,
    required TResult orElse(),
  }) {
    if (ratingResonChanged != null) {
      return ratingResonChanged(resonIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RatingChanged value) ratingChanged,
    required TResult Function(_RatingTextChanged value) ratingTextChanged,
    required TResult Function(_RatingResonChanged value) ratingResonChanged,
    required TResult Function(_RatingLikeChanged value) ratingLikeChanged,
    required TResult Function(_RatingRadioChanged value) ratingRadioChanged,
  }) {
    return ratingResonChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
    TResult? Function(_RatingResonChanged value)? ratingResonChanged,
    TResult? Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult? Function(_RatingRadioChanged value)? ratingRadioChanged,
  }) {
    return ratingResonChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    TResult Function(_RatingResonChanged value)? ratingResonChanged,
    TResult Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult Function(_RatingRadioChanged value)? ratingRadioChanged,
    required TResult orElse(),
  }) {
    if (ratingResonChanged != null) {
      return ratingResonChanged(this);
    }
    return orElse();
  }
}

abstract class _RatingResonChanged implements RatingEvent {
  const factory _RatingResonChanged(final int resonIndex) =
      _$RatingResonChangedImpl;

  int get resonIndex;
  @JsonKey(ignore: true)
  _$$RatingResonChangedImplCopyWith<_$RatingResonChangedImpl> get copyWith =>
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
    required TResult Function(int resonIndex) ratingResonChanged,
    required TResult Function(int likedIndex) ratingLikeChanged,
    required TResult Function(int radioIndex) ratingRadioChanged,
  }) {
    return ratingLikeChanged(likedIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
    TResult? Function(int resonIndex)? ratingResonChanged,
    TResult? Function(int likedIndex)? ratingLikeChanged,
    TResult? Function(int radioIndex)? ratingRadioChanged,
  }) {
    return ratingLikeChanged?.call(likedIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    TResult Function(int resonIndex)? ratingResonChanged,
    TResult Function(int likedIndex)? ratingLikeChanged,
    TResult Function(int radioIndex)? ratingRadioChanged,
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
    required TResult Function(_RatingResonChanged value) ratingResonChanged,
    required TResult Function(_RatingLikeChanged value) ratingLikeChanged,
    required TResult Function(_RatingRadioChanged value) ratingRadioChanged,
  }) {
    return ratingLikeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
    TResult? Function(_RatingResonChanged value)? ratingResonChanged,
    TResult? Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult? Function(_RatingRadioChanged value)? ratingRadioChanged,
  }) {
    return ratingLikeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    TResult Function(_RatingResonChanged value)? ratingResonChanged,
    TResult Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult Function(_RatingRadioChanged value)? ratingRadioChanged,
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
    required TResult Function(int resonIndex) ratingResonChanged,
    required TResult Function(int likedIndex) ratingLikeChanged,
    required TResult Function(int radioIndex) ratingRadioChanged,
  }) {
    return ratingRadioChanged(radioIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double ratingValue)? ratingChanged,
    TResult? Function(String ratingTest)? ratingTextChanged,
    TResult? Function(int resonIndex)? ratingResonChanged,
    TResult? Function(int likedIndex)? ratingLikeChanged,
    TResult? Function(int radioIndex)? ratingRadioChanged,
  }) {
    return ratingRadioChanged?.call(radioIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double ratingValue)? ratingChanged,
    TResult Function(String ratingTest)? ratingTextChanged,
    TResult Function(int resonIndex)? ratingResonChanged,
    TResult Function(int likedIndex)? ratingLikeChanged,
    TResult Function(int radioIndex)? ratingRadioChanged,
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
    required TResult Function(_RatingResonChanged value) ratingResonChanged,
    required TResult Function(_RatingLikeChanged value) ratingLikeChanged,
    required TResult Function(_RatingRadioChanged value) ratingRadioChanged,
  }) {
    return ratingRadioChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RatingChanged value)? ratingChanged,
    TResult? Function(_RatingTextChanged value)? ratingTextChanged,
    TResult? Function(_RatingResonChanged value)? ratingResonChanged,
    TResult? Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult? Function(_RatingRadioChanged value)? ratingRadioChanged,
  }) {
    return ratingRadioChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RatingChanged value)? ratingChanged,
    TResult Function(_RatingTextChanged value)? ratingTextChanged,
    TResult Function(_RatingResonChanged value)? ratingResonChanged,
    TResult Function(_RatingLikeChanged value)? ratingLikeChanged,
    TResult Function(_RatingRadioChanged value)? ratingRadioChanged,
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
mixin _$RatingState {
  double get ratingValue => throw _privateConstructorUsedError;
  String get ratingTest => throw _privateConstructorUsedError;
  int get resonIndex => throw _privateConstructorUsedError;
  int get likedIndex => throw _privateConstructorUsedError;
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
      {double ratingValue,
      String ratingTest,
      int resonIndex,
      int likedIndex,
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
    Object? ratingValue = null,
    Object? ratingTest = null,
    Object? resonIndex = null,
    Object? likedIndex = null,
    Object? radioIndex = null,
  }) {
    return _then(_value.copyWith(
      ratingValue: null == ratingValue
          ? _value.ratingValue
          : ratingValue // ignore: cast_nullable_to_non_nullable
              as double,
      ratingTest: null == ratingTest
          ? _value.ratingTest
          : ratingTest // ignore: cast_nullable_to_non_nullable
              as String,
      resonIndex: null == resonIndex
          ? _value.resonIndex
          : resonIndex // ignore: cast_nullable_to_non_nullable
              as int,
      likedIndex: null == likedIndex
          ? _value.likedIndex
          : likedIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
      {double ratingValue,
      String ratingTest,
      int resonIndex,
      int likedIndex,
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
    Object? ratingValue = null,
    Object? ratingTest = null,
    Object? resonIndex = null,
    Object? likedIndex = null,
    Object? radioIndex = null,
  }) {
    return _then(_$InitialImpl(
      ratingValue: null == ratingValue
          ? _value.ratingValue
          : ratingValue // ignore: cast_nullable_to_non_nullable
              as double,
      ratingTest: null == ratingTest
          ? _value.ratingTest
          : ratingTest // ignore: cast_nullable_to_non_nullable
              as String,
      resonIndex: null == resonIndex
          ? _value.resonIndex
          : resonIndex // ignore: cast_nullable_to_non_nullable
              as int,
      likedIndex: null == likedIndex
          ? _value.likedIndex
          : likedIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
      {required this.ratingValue,
      required this.ratingTest,
      required this.resonIndex,
      required this.likedIndex,
      required this.radioIndex});

  @override
  final double ratingValue;
  @override
  final String ratingTest;
  @override
  final int resonIndex;
  @override
  final int likedIndex;
  @override
  final int radioIndex;

  @override
  String toString() {
    return 'RatingState(ratingValue: $ratingValue, ratingTest: $ratingTest, resonIndex: $resonIndex, likedIndex: $likedIndex, radioIndex: $radioIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.ratingValue, ratingValue) ||
                other.ratingValue == ratingValue) &&
            (identical(other.ratingTest, ratingTest) ||
                other.ratingTest == ratingTest) &&
            (identical(other.resonIndex, resonIndex) ||
                other.resonIndex == resonIndex) &&
            (identical(other.likedIndex, likedIndex) ||
                other.likedIndex == likedIndex) &&
            (identical(other.radioIndex, radioIndex) ||
                other.radioIndex == radioIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, ratingValue, ratingTest, resonIndex, likedIndex, radioIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements RatingState {
  const factory _Initial(
      {required final double ratingValue,
      required final String ratingTest,
      required final int resonIndex,
      required final int likedIndex,
      required final int radioIndex}) = _$InitialImpl;

  @override
  double get ratingValue;
  @override
  String get ratingTest;
  @override
  int get resonIndex;
  @override
  int get likedIndex;
  @override
  int get radioIndex;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
