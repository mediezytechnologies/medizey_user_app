import 'package:json_annotation/json_annotation.dart';
part 'patient_data.g.dart';

@JsonSerializable()
class PatientData {
	String? firstname;
	String? mobileNo;
	String? gender;
	String? dateofbirth;
	@JsonKey(name: 'UserId') 
	int? userId;
	@JsonKey(name: 'mediezy_patient_id') 
	String? mediezyPatientId;
	String? regularMedicine;
	@JsonKey(name: 'surgery_name') 
	String? surgeryName;
	@JsonKey(name: 'surgery_details') 
	dynamic surgeryDetails;
	@JsonKey(name: 'treatment_taken') 
	String? treatmentTaken;
	@JsonKey(name: 'treatment_taken_details') 
	dynamic treatmentTakenDetails;
	@JsonKey(name: 'user_type') 
	int? userType;
	@JsonKey(name: 'updated_at') 
	DateTime? updatedAt;
	@JsonKey(name: 'created_at') 
	DateTime? createdAt;
	int? id;

	PatientData({
		this.firstname, 
		this.mobileNo, 
		this.gender, 
		this.dateofbirth, 
		this.userId, 
		this.mediezyPatientId, 
		this.regularMedicine, 
		this.surgeryName, 
		this.surgeryDetails, 
		this.treatmentTaken, 
		this.treatmentTakenDetails, 
		this.userType, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory PatientData.fromJson(Map<String, dynamic> json) {
		return _$PatientDataFromJson(json);
	}

	Map<String, dynamic> toJson() => _$PatientDataToJson(this);
}
