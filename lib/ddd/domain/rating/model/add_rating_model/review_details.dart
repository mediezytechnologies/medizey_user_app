import 'package:json_annotation/json_annotation.dart';

part 'review_details.g.dart';

@JsonSerializable()
class ReviewDetails {
  @JsonKey(name: 'review_id')
  int? reviewId;
  @JsonKey(name: 'appointment_id')
  int? appointmentId;
  double? rating;
  @JsonKey(name: 'rating_id')
  int? ratingId;
  @JsonKey(name: 'doctor_recommendation')
  int? doctorRecommendation;
  @JsonKey(name: 'user_comments')
  int? userComments;
  @JsonKey(name: 'feedback_status')
  int? feedbackStatus;

  ReviewDetails({
    this.reviewId,
    this.appointmentId,
    this.rating,
    this.ratingId,
    this.doctorRecommendation,
    this.userComments,
    this.feedbackStatus,
  });

  factory ReviewDetails.fromJson(Map<String, dynamic> json) {
    return _$ReviewDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReviewDetailsToJson(this);
}
