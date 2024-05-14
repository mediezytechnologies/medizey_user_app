// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRating _$UserRatingFromJson(Map<String, dynamic> json) => UserRating(
      ratingId: (json['rating_id'] as num?)?.toInt(),
      reviewId: (json['review_id'] as num?)?.toInt(),
      userComments: json['user_comments'] as String?,
      ratingStart: (json['rating_start'] as num?)?.toDouble(),
      ratingEnd: (json['rating_end'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserRatingToJson(UserRating instance) =>
    <String, dynamic>{
      'rating_id': instance.ratingId,
      'review_id': instance.reviewId,
      'user_comments': instance.userComments,
      'rating_start': instance.ratingStart,
      'rating_end': instance.ratingEnd,
    };
