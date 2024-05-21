// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewDetails _$ReviewDetailsFromJson(Map<String, dynamic> json) =>
    ReviewDetails(
      reviewId: (json['review_id'] as num?)?.toInt(),
      appointmentId: (json['appointment_id'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      ratingId: (json['rating_id'] as num?)?.toInt(),
      doctorRecommendation: (json['doctor_recommendation'] as num?)?.toInt(),
      userComments: (json['user_comments'] as num?)?.toInt(),
      feedbackStatus: (json['feedback_status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReviewDetailsToJson(ReviewDetails instance) =>
    <String, dynamic>{
      'review_id': instance.reviewId,
      'appointment_id': instance.appointmentId,
      'rating': instance.rating,
      'rating_id': instance.ratingId,
      'doctor_recommendation': instance.doctorRecommendation,
      'user_comments': instance.userComments,
      'feedback_status': instance.feedbackStatus,
    };
