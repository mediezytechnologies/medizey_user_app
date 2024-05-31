import 'package:json_annotation/json_annotation.dart';

import 'review_details.dart';

part 'add_rating_model.g.dart';

@JsonSerializable()
class AddRatingModel {
	bool? status;
	String? message;
	@JsonKey(name: 'review_details') 
	ReviewDetails? reviewDetails;

	AddRatingModel({this.status, this.message, this.reviewDetails});

	factory AddRatingModel.fromJson(Map<String, dynamic> json) {
		return _$AddRatingModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AddRatingModelToJson(this);
}
