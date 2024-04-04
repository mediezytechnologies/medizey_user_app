// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Domain _$DomainFromJson(Map<String, dynamic> json) => Domain(
      status: json['status'] as bool?,
      patientId: json['patient_id'] as int?,
      patientData: json['patient_data'] == null
          ? null
          : PatientData.fromJson(json['patient_data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DomainToJson(Domain instance) => <String, dynamic>{
      'status': instance.status,
      'patient_id': instance.patientId,
      'patient_data': instance.patientData,
      'message': instance.message,
    };
