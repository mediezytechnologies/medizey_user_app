import 'package:json_annotation/json_annotation.dart';

import 'patient_data.dart';
part 'add_m_ember.g.dart';

@JsonSerializable()
class AddMEmber {
	bool? status;
	@JsonKey(name: 'patient_id') 
	int? patientId;
	@JsonKey(name: 'patient_data') 
	PatientData? patientData;
	String? message;

	AddMEmber({this.status, this.patientId, this.patientData, this.message});

	factory AddMEmber.fromJson(Map<String, dynamic> json) {
		return _$AddMEmberFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AddMEmberToJson(this);
}
