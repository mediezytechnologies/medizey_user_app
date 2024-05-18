import 'package:json_annotation/json_annotation.dart';
import '../../../../Model/Clinics/clinic_model.dart';
part 'all_doctor.g.dart';

@JsonSerializable()
class AllDoctor {
	int? id;
	@JsonKey(name: 'UserId') 
	int? userId;
	String? firstname;
	String? secondname;
	@JsonKey(name: 'Specialization') 
	String? specialization;
	@JsonKey(name: 'DocterImage') 
	String? docterImage;
	@JsonKey(name: 'Location') 
	String? location;
	@JsonKey(name: 'MainHospital') 
	String? mainHospital;
	@JsonKey(name: 'nearest_doctor_clinic') 
	String? nearestDoctorClinic;
	List<Clinics>? clinics;
	int? favoriteStatus;

	AllDoctor({
		this.id, 
		this.userId, 
		this.firstname, 
		this.secondname, 
		this.specialization, 
		this.docterImage, 
		this.location, 
		this.mainHospital, 
		this.nearestDoctorClinic, 
		this.clinics, 
		this.favoriteStatus, 
	});

	factory AllDoctor.fromJson(Map<String, dynamic> json) {
		return _$AllDoctorFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AllDoctorToJson(this);
}
