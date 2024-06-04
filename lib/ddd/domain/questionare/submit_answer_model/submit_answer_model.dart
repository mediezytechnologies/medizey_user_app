import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'submit_answer_model.g.dart';

@JsonSerializable()
class SubmitAnswerModel {
	bool? status;
	Data? data;
	String? message;

	SubmitAnswerModel({this.status, this.data, this.message});

	factory SubmitAnswerModel.fromJson(Map<String, dynamic> json) {
		return _$SubmitAnswerModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SubmitAnswerModelToJson(this);
}
