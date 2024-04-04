import 'package:json_annotation/json_annotation.dart';

import 'patient_data.dart';

part 'domain.g.dart';

@JsonSerializable()
class Domain {
	bool? status;
	@JsonKey(name: 'patient_id') 
	int? patientId;
	@JsonKey(name: 'patient_data') 
	PatientData? patientData;
	String? message;

	Domain({this.status, this.patientId, this.patientData, this.message});

	factory Domain.fromJson(Map<String, dynamic> json) {
		return _$DomainFromJson(json);
	}

	Map<String, dynamic> toJson() => _$DomainToJson(this);
}
