// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewDetails _$ReviewDetailsFromJson(Map<String, dynamic> json) =>
    ReviewDetails(
      reviewId: json['review_id'] as String?,
      appointmentId: json['appointment_id'] as String?,
      rating: json['rating'] as String?,
      ratingId: json['rating_id'] as String?,
      doctorRecommendation: json['doctor_recommendation'] as String?,
      userComments: json['user_comments'] as String?,
      feedbackStatus: json['feedback_status'] as int?,
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
