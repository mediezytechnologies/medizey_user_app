// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientData _$PatientDataFromJson(Map<String, dynamic> json) => PatientData(
      firstname: json['firstname'] as String?,
      mobileNo: json['mobileNo'] as String?,
      gender: json['gender'] as String?,
      dateofbirth: json['dateofbirth'] as String?,
      userId: json['UserId'] as int?,
      mediezyPatientId: json['mediezy_patient_id'] as String?,
      regularMedicine: json['regularMedicine'] as String?,
      surgeryName: json['surgery_name'] as String?,
      surgeryDetails: json['surgery_details'],
      treatmentTaken: json['treatment_taken'] as String?,
      treatmentTakenDetails: json['treatment_taken_details'],
      userType: json['user_type'] as int?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$PatientDataToJson(PatientData instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'mobileNo': instance.mobileNo,
      'gender': instance.gender,
      'dateofbirth': instance.dateofbirth,
      'UserId': instance.userId,
      'mediezy_patient_id': instance.mediezyPatientId,
      'regularMedicine': instance.regularMedicine,
      'surgery_name': instance.surgeryName,
      'surgery_details': instance.surgeryDetails,
      'treatment_taken': instance.treatmentTaken,
      'treatment_taken_details': instance.treatmentTakenDetails,
      'user_type': instance.userType,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
    };
