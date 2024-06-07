import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_symptom_model.g.dart';

@JsonSerializable()
class GetSymptomModel {
	bool? status;
	String? message;
	List<Datum>? data;

	GetSymptomModel({this.status, this.message, this.data});

	factory GetSymptomModel.fromJson(Map<String, dynamic> json) {
		return _$GetSymptomModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GetSymptomModelToJson(this);
}
