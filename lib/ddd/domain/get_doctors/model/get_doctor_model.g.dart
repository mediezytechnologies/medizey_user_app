// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorModel _$GetDoctorModelFromJson(Map<String, dynamic> json) =>
    GetDoctorModel(
      success: json['success'] as bool?,
      allDoctors: (json['All Doctors'] as List<dynamic>?)
          ?.map((e) => AllDoctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetDoctorModelToJson(GetDoctorModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'All Doctors': instance.allDoctors,
      'code': instance.code,
      'message': instance.message,
    };
