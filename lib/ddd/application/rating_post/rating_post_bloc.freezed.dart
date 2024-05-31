// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_post_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RatingPostEvent {
  int get appointmentId => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int? get reviewId => throw _privateConstructorUsedError;
  int? get doctorRecommentation => throw _privateConstructorUsedError;
  int? get userComments => throw _privateConstructorUsedError;
  int? get ratingId => throw _privateConstructorUsedError;
  String? get otherComment => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int appointmentId,
            double rating,
            int? reviewId,
            int? doctorRecommentation,
            int? userComments,
            int? ratingId,
            String? otherComment)
        ratingAddFeedBacks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int appointmentId,
            double rating,
            int? reviewId,
            int? doctorRecommentation,
            int? userComments,
            int? ratingId,
            String? otherComment)?
        ratingAddFeedBacks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int appointmentId,
            double rating,
            int? reviewId,
            int? doctorRecommentation,
            int? userComments,
            int? ratingId,
            String? otherComment)?
        ratingAddFeedBacks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RatingAddFeedBacks value) ratingAddFeedBacks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RatingAddFeedBacks value)? ratingAddFeedBacks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RatingAddFeedBacks value)? ratingAddFeedBacks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RatingPostEventCopyWith<RatingPostEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingPostEventCopyWith<$Res> {
  factory $RatingPostEventCopyWith(
          RatingPostEvent value, $Res Function(RatingPostEvent) then) =
      _$RatingPostEventCopyWithImpl<$Res, RatingPostEvent>;
  @useResult
  $Res call(
      {int appointmentId,
      double rating,
      int? reviewId,
      int? doctorRecommentation,
      int? userComments,
      int? ratingId,
      String? otherComment});
}

/// @nodoc
class _$RatingPostEventCopyWithImpl<$Res, $Val extends RatingPostEvent>
    implements $RatingPostEventCopyWith<$Res> {
  _$RatingPostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? rating = null,
    Object? reviewId = freezed,
    Object? doctorRecommentation = freezed,
    Object? userComments = freezed,
    Object? ratingId = freezed,
    Object? otherComment = freezed,
  }) {
    return _then(_value.copyWith(
      appointmentId: null == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewId: freezed == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int?,
      doctorRecommentation: freezed == doctorRecommentation
          ? _value.doctorRecommentation
          : doctorRecommentation // ignore: cast_nullable_to_non_nullable
              as int?,
      userComments: freezed == userComments
          ? _value.userComments
          : userComments // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingId: freezed == ratingId
          ? _value.ratingId
          : ratingId // ignore: cast_nullable_to_non_nullable
              as int?,
      otherComment: freezed == otherComment
          ? _value.otherComment
          : otherComment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingAddFeedBacksImplCopyWith<$Res>
    implements $RatingPostEventCopyWith<$Res> {
  factory _$$RatingAddFeedBacksImplCopyWith(_$RatingAddFeedBacksImpl value,
          $Res Function(_$RatingAddFeedBacksImpl) then) =
      __$$RatingAddFeedBacksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int appointmentId,
      double rating,
      int? reviewId,
      int? doctorRecommentation,
      int? userComments,
      int? ratingId,
      String? otherComment});
}

/// @nodoc
class __$$RatingAddFeedBacksImplCopyWithImpl<$Res>
    extends _$RatingPostEventCopyWithImpl<$Res, _$RatingAddFeedBacksImpl>
    implements _$$RatingAddFeedBacksImplCopyWith<$Res> {
  __$$RatingAddFeedBacksImplCopyWithImpl(_$RatingAddFeedBacksImpl _value,
      $Res Function(_$RatingAddFeedBacksImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? rating = null,
    Object? reviewId = freezed,
    Object? doctorRecommentation = freezed,
    Object? userComments = freezed,
    Object? ratingId = freezed,
    Object? otherComment = freezed,
  }) {
    return _then(_$RatingAddFeedBacksImpl(
      null == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as int,
      null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      freezed == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == doctorRecommentation
          ? _value.doctorRecommentation
          : doctorRecommentation // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == userComments
          ? _value.userComments
          : userComments // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == ratingId
          ? _value.ratingId
          : ratingId // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == otherComment
          ? _value.otherComment
          : otherComment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RatingAddFeedBacksImpl implements _RatingAddFeedBacks {
  const _$RatingAddFeedBacksImpl(
      this.appointmentId,
      this.rating,
      this.reviewId,
      this.doctorRecommentation,
      this.userComments,
      this.ratingId,
      this.otherComment);

  @override
  final int appointmentId;
  @override
  final double rating;
  @override
  final int? reviewId;
  @override
  final int? doctorRecommentation;
  @override
  final int? userComments;
  @override
  final int? ratingId;
  @override
  final String? otherComment;

  @override
  String toString() {
    return 'RatingPostEvent.ratingAddFeedBacks(appointmentId: $appointmentId, rating: $rating, reviewId: $reviewId, doctorRecommentation: $doctorRecommentation, userComments: $userComments, ratingId: $ratingId, otherComment: $otherComment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingAddFeedBacksImpl &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.doctorRecommentation, doctorRecommentation) ||
                other.doctorRecommentation == doctorRecommentation) &&
            (identical(other.userComments, userComments) ||
                other.userComments == userComments) &&
            (identical(other.ratingId, ratingId) ||
                other.ratingId == ratingId) &&
            (identical(other.otherComment, otherComment) ||
                other.otherComment == otherComment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appointmentId, rating, reviewId,
      doctorRecommentation, userComments, ratingId, otherComment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingAddFeedBacksImplCopyWith<_$RatingAddFeedBacksImpl> get copyWith =>
      __$$RatingAddFeedBacksImplCopyWithImpl<_$RatingAddFeedBacksImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int appointmentId,
            double rating,
            int? reviewId,
            int? doctorRecommentation,
            int? userComments,
            int? ratingId,
            String? otherComment)
        ratingAddFeedBacks,
  }) {
    return ratingAddFeedBacks(appointmentId, rating, reviewId,
        doctorRecommentation, userComments, ratingId, otherComment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int appointmentId,
            double rating,
            int? reviewId,
            int? doctorRecommentation,
            int? userComments,
            int? ratingId,
            String? otherComment)?
        ratingAddFeedBacks,
  }) {
    return ratingAddFeedBacks?.call(appointmentId, rating, reviewId,
        doctorRecommentation, userComments, ratingId, otherComment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int appointmentId,
            double rating,
            int? reviewId,
            int? doctorRecommentation,
            int? userComments,
            int? ratingId,
            String? otherComment)?
        ratingAddFeedBacks,
    required TResult orElse(),
  }) {
    if (ratingAddFeedBacks != null) {
      return ratingAddFeedBacks(appointmentId, rating, reviewId,
          doctorRecommentation, userComments, ratingId, otherComment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RatingAddFeedBacks value) ratingAddFeedBacks,
  }) {
    return ratingAddFeedBacks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RatingAddFeedBacks value)? ratingAddFeedBacks,
  }) {
    return ratingAddFeedBacks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RatingAddFeedBacks value)? ratingAddFeedBacks,
    required TResult orElse(),
  }) {
    if (ratingAddFeedBacks != null) {
      return ratingAddFeedBacks(this);
    }
    return orElse();
  }
}

abstract class _RatingAddFeedBacks implements RatingPostEvent {
  const factory _RatingAddFeedBacks(
      final int appointmentId,
      final double rating,
      final int? reviewId,
      final int? doctorRecommentation,
      final int? userComments,
      final int? ratingId,
      final String? otherComment) = _$RatingAddFeedBacksImpl;

  @override
  int get appointmentId;
  @override
  double get rating;
  @override
  int? get reviewId;
  @override
  int? get doctorRecommentation;
  @override
  int? get userComments;
  @override
  int? get ratingId;
  @override
  String? get otherComment;
  @override
  @JsonKey(ignore: true)
  _$$RatingAddFeedBacksImplCopyWith<_$RatingAddFeedBacksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RatingPostState {
  bool get isloding => throw _privateConstructorUsedError;
  AddRatingModel? get addRatingModel => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RatingPostStateCopyWith<RatingPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingPostStateCopyWith<$Res> {
  factory $RatingPostStateCopyWith(
          RatingPostState value, $Res Function(RatingPostState) then) =
      _$RatingPostStateCopyWithImpl<$Res, RatingPostState>;
  @useResult
  $Res call(
      {bool isloding,
      AddRatingModel? addRatingModel,
      bool isError,
      String message,
      bool status});
}

/// @nodoc
class _$RatingPostStateCopyWithImpl<$Res, $Val extends RatingPostState>
    implements $RatingPostStateCopyWith<$Res> {
  _$RatingPostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloding = null,
    Object? addRatingModel = freezed,
    Object? isError = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      isloding: null == isloding
          ? _value.isloding
          : isloding // ignore: cast_nullable_to_non_nullable
              as bool,
      addRatingModel: freezed == addRatingModel
          ? _value.addRatingModel
          : addRatingModel // ignore: cast_nullable_to_non_nullable
              as AddRatingModel?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $RatingPostStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isloding,
      AddRatingModel? addRatingModel,
      bool isError,
      String message,
      bool status});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RatingPostStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloding = null,
    Object? addRatingModel = freezed,
    Object? isError = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$InitialImpl(
      isloding: null == isloding
          ? _value.isloding
          : isloding // ignore: cast_nullable_to_non_nullable
              as bool,
      addRatingModel: freezed == addRatingModel
          ? _value.addRatingModel
          : addRatingModel // ignore: cast_nullable_to_non_nullable
              as AddRatingModel?,
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
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isloding,
      this.addRatingModel,
      required this.isError,
      required this.message,
      required this.status});

  @override
  final bool isloding;
  @override
  final AddRatingModel? addRatingModel;
  @override
  final bool isError;
  @override
  final String message;
  @override
  final bool status;

  @override
  String toString() {
    return 'RatingPostState(isloding: $isloding, addRatingModel: $addRatingModel, isError: $isError, message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isloding, isloding) ||
                other.isloding == isloding) &&
            (identical(other.addRatingModel, addRatingModel) ||
                other.addRatingModel == addRatingModel) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isloding, addRatingModel, isError, message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements RatingPostState {
  const factory _Initial(
      {required final bool isloding,
      final AddRatingModel? addRatingModel,
      required final bool isError,
      required final String message,
      required final bool status}) = _$InitialImpl;

  @override
  bool get isloding;
  @override
  AddRatingModel? get addRatingModel;
  @override
  bool get isError;
  @override
  String get message;
  @override
  bool get status;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
