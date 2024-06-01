import 'package:json_annotation/json_annotation.dart';
part 'forgot_password_model.g.dart';

@JsonSerializable()
class ForgotPasswordModel {
 @JsonKey(name: "status")
    bool? status;
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "user_id")
    int? userId;
	ForgotPasswordModel({this.status, this.message, this.userId});

	factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
		return _$ForgotPasswordModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ForgotPasswordModelToJson(this);
}
