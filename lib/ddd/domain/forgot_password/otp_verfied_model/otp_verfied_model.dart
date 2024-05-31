import 'package:json_annotation/json_annotation.dart';

part 'otp_verfied_model.g.dart';

@JsonSerializable()
class OtpVerfiedModel {
	bool? status;
	String? message;

	OtpVerfiedModel({this.status, this.message});

	factory OtpVerfiedModel.fromJson(Map<String, dynamic> json) {
		return _$OtpVerfiedModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$OtpVerfiedModelToJson(this);
}
