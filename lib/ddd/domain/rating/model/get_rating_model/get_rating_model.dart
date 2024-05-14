import 'package:json_annotation/json_annotation.dart';

import 'user_rating.dart';

part 'get_rating_model.g.dart';

@JsonSerializable()
class GetRatingModel {
	@JsonKey(name: 'User_Rating') 
	List<UserRating>? userRating;
	String? message;

	GetRatingModel({this.userRating, this.message});

	factory GetRatingModel.fromJson(Map<String, dynamic> json) {
		return _$GetRatingModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GetRatingModelToJson(this);
}
