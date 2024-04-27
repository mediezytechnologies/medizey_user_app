// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clinic _$ClinicFromJson(Map<String, dynamic> json) => Clinic(
      clinicId: json['clinic_id'] as int?,
      clinicName: json['clinic_name'] as String?,
      clinicStartTime: json['clinic_start_time'],
      clinicEndTime: json['clinic_end_time'],
      clinicAddress: json['clinic_address'] as String?,
      clinicLocation: json['clinic_location'] as String?,
      clinicMainImage: json['clinic_main_image'] as String?,
      clinicDescription: json['clinic_description'] as String?,
      totalTokenCount: json['total_token_Count'] as int?,
      availableTokenCount: json['available_token_count'] as int?,
      nextAvailableTokenTime: json['next_available_token_time'] as String?,
    );

Map<String, dynamic> _$ClinicToJson(Clinic instance) => <String, dynamic>{
      'clinic_id': instance.clinicId,
      'clinic_name': instance.clinicName,
      'clinic_start_time': instance.clinicStartTime,
      'clinic_end_time': instance.clinicEndTime,
      'clinic_address': instance.clinicAddress,
      'clinic_location': instance.clinicLocation,
      'clinic_main_image': instance.clinicMainImage,
      'clinic_description': instance.clinicDescription,
      'total_token_Count': instance.totalTokenCount,
      'available_token_count': instance.availableTokenCount,
      'next_available_token_time': instance.nextAvailableTokenTime,
    };
