// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allergies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Allergies _$AllergiesFromJson(Map<String, dynamic> json) => Allergies(
      patientId: json['patient_id'] as int?,
      allergyId: json['allergy_id'] as int?,
      allergyDetails: json['allergy_details'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$AllergiesToJson(Allergies instance) => <String, dynamic>{
      'patient_id': instance.patientId,
      'allergy_id': instance.allergyId,
      'allergy_details': instance.allergyDetails,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
    };
