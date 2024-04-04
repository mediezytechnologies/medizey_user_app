import 'package:json_annotation/json_annotation.dart';

import 'patient_data.dart';

part 'add_member_mdels.g.dart';

@JsonSerializable()
class AddMemberMdels {
  bool? status;
  @JsonKey(name: 'patient_id')
  int? patientId;
  @JsonKey(name: 'patient_data')
  PatientData? patientData;
  String? message;

  AddMemberMdels({
    this.status,
    this.patientId,
    this.patientData,
    this.message,
  });

  factory AddMemberMdels.fromJson(Map<String, dynamic> json) {
    return _$AddMemberMdelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddMemberMdelsToJson(this);
}
