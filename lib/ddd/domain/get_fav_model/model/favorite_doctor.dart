import 'package:json_annotation/json_annotation.dart';

import 'clinic.dart';
part 'favorite_doctor.g.dart';

@JsonSerializable()
class FavoriteDoctor {
  int? id;
  @JsonKey(name: 'UserId')
  int? userId;
  String? firstname;
  String? secondname;
  @JsonKey(name: 'distance_from_user')
  String? distanceFromUser;
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

  FavoriteDoctor({
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

  factory FavoriteDoctor.fromJson(Map<String, dynamic> json) {
    return _$FavoriteDoctorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavoriteDoctorToJson(this);
}
