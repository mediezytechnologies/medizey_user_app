// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRating _$UserRatingFromJson(Map<String, dynamic> json) => UserRating(
      ratingId: json['rating_id'] as int?,
      reviewId: json['review_id'] as int?,
      userComments: json['user_comments'] as String?,
      ratingStart: (json['rating_start'] as num?)?.toDouble(),
      ratingEnd: json['rating_end'] as int?,
    );

Map<String, dynamic> _$UserRatingToJson(UserRating instance) =>
    <String, dynamic>{
      'rating_id': instance.ratingId,
      'review_id': instance.reviewId,
      'user_comments': instance.userComments,
      'rating_start': instance.ratingStart,
      'rating_end': instance.ratingEnd,
    };
