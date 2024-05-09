import 'package:json_annotation/json_annotation.dart';
import '../../../../Model/Clinics/clinic_model.dart';
part 'recently_booked_doctor.g.dart';

@JsonSerializable()
class RecentlyBookedDoctor {
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
	List<Clinics>? clinics;
	int? favoriteStatus;

	RecentlyBookedDoctor({
		this.id, 
		this.userId, 
		this.firstname, 
		this.secondname, 
		this.specialization, 
		this.docterImage, 
		this.location, 
		this.mainHospital, 
		this.clinics, 
		this.favoriteStatus, 
	});

	factory RecentlyBookedDoctor.fromJson(Map<String, dynamic> json) {
		return _$RecentlyBookedDoctorFromJson(json);
	}

	Map<String, dynamic> toJson() => _$RecentlyBookedDoctorToJson(this);
}
