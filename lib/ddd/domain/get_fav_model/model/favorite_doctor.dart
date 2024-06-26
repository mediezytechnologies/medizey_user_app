import 'package:json_annotation/json_annotation.dart';
<<<<<<<< HEAD:lib/ddd/domain/docters_model/model/all_doctor.dart
import 'package:mediezy_user/Model/Clinics/clinic_model.dart';

import 'clinic.dart';
part 'all_doctor.g.dart';
========
import '../../../../Model/Clinics/clinic_model.dart';
part 'favorite_doctor.g.dart';
>>>>>>>> ios_android:lib/ddd/domain/get_fav_model/model/favorite_doctor.dart

@JsonSerializable()
class FavoriteDoctor {
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

  FavoriteDoctor({
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

  factory FavoriteDoctor.fromJson(Map<String, dynamic> json) {
    return _$FavoriteDoctorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavoriteDoctorToJson(this);
}
