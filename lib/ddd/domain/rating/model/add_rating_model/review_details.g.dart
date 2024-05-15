// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewDetails _$ReviewDetailsFromJson(Map<String, dynamic> json) =>
    ReviewDetails(
      reviewId: json['review_id'] as int?,
      appointmentId: json['appointment_id'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingId: json['rating_id'] as int?,
      doctorRecommendation: json['doctor_recommendation'] as int?,
      userComments: json['user_comments'] as int?,
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
