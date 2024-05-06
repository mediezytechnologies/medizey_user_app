// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchDoctorModel _$SearchDoctorModelFromJson(Map<String, dynamic> json) =>
    SearchDoctorModel(
      status: json['status'] as String?,
      searchDoctors: (json['Search Doctors'] as List<dynamic>?)
          ?.map((e) => SearchDoctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SearchDoctorModelToJson(SearchDoctorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'Search Doctors': instance.searchDoctors,
      'code': instance.code,
      'message': instance.message,
    };
