import 'package:json_annotation/json_annotation.dart';

part 'medicines.g.dart';

@JsonSerializable()
class Medicines {
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'patient_id')
  int? patientId;
  String? medicineName;
  String? illness;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  int? id;

  Medicines({
    this.userId,
    this.patientId,
    this.medicineName,
    this.illness,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Medicines.fromJson(Map<String, dynamic> json) {
    return _$MedicinesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicinesToJson(this);
}
