import 'package:json_annotation/json_annotation.dart';

import 'patient_data.dart';

part 'add_member_model.g.dart';

@JsonSerializable()
class AddMemberModel {
  bool? status;
  @JsonKey(name: 'patient_id')
  int? patientId;
  @JsonKey(name: 'patient_data')
  PatientData? patientData;
  String? message;

  AddMemberModel({
    this.status,
    this.patientId,
    this.patientData,
    this.message,
  });

  factory AddMemberModel.fromJson(Map<String, dynamic> json) {
    return _$AddMemberModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddMemberModelToJson(this);
}
