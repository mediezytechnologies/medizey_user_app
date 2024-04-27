import 'package:json_annotation/json_annotation.dart';

import 'clinic.dart';
part 'all_doctor.g.dart';

@JsonSerializable()
class AllDoctor {
  int? id;
  @JsonKey(name: 'UserId')
  int? userId;
  String? firstname;
  String? secondname;
  @JsonKey(name: 'distance_from_user')
  dynamic distanceFromUser;
  @JsonKey(name: 'Specialization')
  String? specialization;
  @JsonKey(name: 'DocterImage')
  String? docterImage;
  @JsonKey(name: 'Location')
  String? location;
  @JsonKey(name: 'MainHospital')
  String? mainHospital;
  List<Clinic>? clinics;
  int? favoriteStatus;

  AllDoctor({
    this.id,
    this.userId,
    this.firstname,
    this.secondname,
    this.distanceFromUser,
    this.specialization,
    this.docterImage,
    this.location,
    this.mainHospital,
    this.clinics,
    this.favoriteStatus,
  });

  factory AllDoctor.fromJson(Map<String, dynamic> json) {
    return _$AllDoctorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllDoctorToJson(this);
}
