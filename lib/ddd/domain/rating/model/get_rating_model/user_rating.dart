import 'package:json_annotation/json_annotation.dart';

part 'user_rating.g.dart';

@JsonSerializable()
class UserRating {
	@JsonKey(name: 'rating_id') 
	int? ratingId;
	@JsonKey(name: 'review_id') 
	int? reviewId;
	@JsonKey(name: 'user_comments') 
	String? userComments;
	@JsonKey(name: 'rating_start') 
	double? ratingStart;
	@JsonKey(name: 'rating_end') 
	int? ratingEnd;

	UserRating({
		this.ratingId, 
		this.reviewId, 
		this.userComments, 
		this.ratingStart, 
		this.ratingEnd, 
	});

	factory UserRating.fromJson(Map<String, dynamic> json) {
		return _$UserRatingFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UserRatingToJson(this);
}
