import 'package:json_annotation/json_annotation.dart';

import 'search_doctor.dart';

part 'search_doctor_model.g.dart';

@JsonSerializable()
class SearchDoctorModel {
	String? status;
	@JsonKey(name: 'Search Doctors') 
	List<SearchDoctor>? searchDoctors;
	String? code;
	String? message;

	SearchDoctorModel({
		this.status, 
		this.searchDoctors, 
		this.code, 
		this.message, 
	});

	factory SearchDoctorModel.fromJson(Map<String, dynamic> json) {
		return _$SearchDoctorModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SearchDoctorModelToJson(this);
}
