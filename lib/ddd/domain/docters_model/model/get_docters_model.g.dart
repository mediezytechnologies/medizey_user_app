// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_docters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctersModel _$GetDoctersModelFromJson(Map<String, dynamic> json) =>
    GetDoctersModel(
      success: json['success'] as bool?,
      allDoctors: (json['All Doctors'] as List<dynamic>?)
          ?.map((e) => AllDoctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetDoctersModelToJson(GetDoctersModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'All Doctors': instance.allDoctors,
      'code': instance.code,
      'message': instance.message,
    };
