import 'package:json_annotation/json_annotation.dart';

import 'favorite_doctor.dart';

part 'get_favourite_doctor_model.g.dart';

@JsonSerializable()
class GetFavouriteDoctorModel {
  bool? status;
  @JsonKey(name: 'Favorite Doctors')
  List<FavoriteDoctor>? favoriteDoctors;
  String? message;

  GetFavouriteDoctorModel({
    this.status,
    this.favoriteDoctors,
    this.message,
  });

  factory GetFavouriteDoctorModel.fromJson(Map<String, dynamic> json) {
    return _$GetFavouriteDoctorModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetFavouriteDoctorModelToJson(this);
}
