import 'package:json_annotation/json_annotation.dart';

part 'success_password_model.g.dart';

@JsonSerializable()
class SuccessPasswordModel {
	bool? status;
	String? message;

	SuccessPasswordModel({this.status, this.message});

	factory SuccessPasswordModel.fromJson(Map<String, dynamic> json) {
		return _$SuccessPasswordModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SuccessPasswordModelToJson(this);
}
