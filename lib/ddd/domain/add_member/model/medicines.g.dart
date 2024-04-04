// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicines _$MedicinesFromJson(Map<String, dynamic> json) => Medicines(
      userId: json['user_id'] as int?,
      patientId: json['patient_id'] as int?,
      medicineName: json['medicineName'] as String?,
      illness: json['illness'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$MedicinesToJson(Medicines instance) => <String, dynamic>{
      'user_id': instance.userId,
      'patient_id': instance.patientId,
      'medicineName': instance.medicineName,
      'illness': instance.illness,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
    };
