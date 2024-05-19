import 'package:json_annotation/json_annotation.dart';

import 'recently_booked_doctor.dart';

part 'recently_booked_doctor_model.g.dart';

@JsonSerializable()
class RecentlyBookedDoctorModel {
  bool? status;
  @JsonKey(name: 'recently_booked_doctor')
  List<RecentlyBookedDoctor>? recentlyBookedDoctor;
  String? message;

  RecentlyBookedDoctorModel({
    this.status,
    this.recentlyBookedDoctor,
    this.message,
  });

  factory RecentlyBookedDoctorModel.fromJson(Map<String, dynamic> json) {
    return _$RecentlyBookedDoctorModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecentlyBookedDoctorModelToJson(this);
}
