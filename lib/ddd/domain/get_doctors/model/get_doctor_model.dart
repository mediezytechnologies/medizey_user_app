import 'package:json_annotation/json_annotation.dart';

import 'all_doctor.dart';

part 'get_doctor_model.g.dart';

@JsonSerializable()
class GetDoctorModel {
	bool? success;
	@JsonKey(name: 'All Doctors') 
	List<AllDoctor>? allDoctors;
	String? code;
	String? message;

	GetDoctorModel({this.success, this.allDoctors, this.code, this.message});

	factory GetDoctorModel.fromJson(Map<String, dynamic> json) {
		return _$GetDoctorModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GetDoctorModelToJson(this);
}
