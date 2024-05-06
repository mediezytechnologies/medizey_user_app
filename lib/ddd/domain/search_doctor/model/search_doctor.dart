import 'package:json_annotation/json_annotation.dart';
import 'package:mediezy_user/Model/Clinics/clinic_model.dart';
part 'search_doctor.g.dart';

@JsonSerializable()
class SearchDoctor {
	int? id;
	@JsonKey(name: 'UserId') 
	int? userId;
	String? firstname;
	String? lastname;
	@JsonKey(name: 'Specialization') 
	String? specialization;
	@JsonKey(name: 'DocterImage') 
	String? docterImage;
	@JsonKey(name: 'Location') 
	String? location;
	@JsonKey(name: 'MainHospital') 
	String? mainHospital;
	@JsonKey(name: 'distance_from_user') 
	String? distanceFromUser;
	List<Clinics>? clinics;
	int? favoriteStatus;

	SearchDoctor({
		this.id, 
		this.userId, 
		this.firstname, 
		this.lastname, 
		this.specialization, 
		this.docterImage, 
		this.location, 
		this.mainHospital, 
		this.distanceFromUser, 
		this.clinics, 
		this.favoriteStatus, 
	});

	factory SearchDoctor.fromJson(Map<String, dynamic> json) {
		return _$SearchDoctorFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SearchDoctorToJson(this);
}
