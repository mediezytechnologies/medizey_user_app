import 'package:json_annotation/json_annotation.dart';

part 'review_details.g.dart';

@JsonSerializable()
class ReviewDetails {
	@JsonKey(name: 'review_id') 
	String? reviewId;
	@JsonKey(name: 'appointment_id') 
	String? appointmentId;
	String? rating;
	@JsonKey(name: 'rating_id') 
	String? ratingId;
	@JsonKey(name: 'doctor_recommendation') 
	String? doctorRecommendation;
	@JsonKey(name: 'user_comments') 
	String? userComments;
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
