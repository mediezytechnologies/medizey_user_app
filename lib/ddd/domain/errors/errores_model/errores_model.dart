import 'package:json_annotation/json_annotation.dart';

part 'errores_model.g.dart';

@JsonSerializable()
class ErroresModel {
	bool? status;
	String? message;

	ErroresModel({this.status, this.message});

	factory ErroresModel.fromJson(Map<String, dynamic> json) {
		return _$ErroresModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ErroresModelToJson(this);
}
