import 'package:json_annotation/json_annotation.dart';

part 'allergies.g.dart';

@JsonSerializable()
class Allergies {
  @JsonKey(name: 'patient_id')
  int? patientId;
  @JsonKey(name: 'allergy_id')
  int? allergyId;
  @JsonKey(name: 'allergy_details')
  String? allergyDetails;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  int? id;

  Allergies({
    this.patientId,
    this.allergyId,
    this.allergyDetails,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Allergies.fromJson(Map<String, dynamic> json) {
    return _$AllergiesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllergiesToJson(this);
}
