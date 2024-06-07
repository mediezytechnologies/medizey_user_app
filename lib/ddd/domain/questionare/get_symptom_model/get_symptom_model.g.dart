// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_symptom_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSymptomModel _$GetSymptomModelFromJson(Map<String, dynamic> json) =>
    GetSymptomModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSymptomModelToJson(GetSymptomModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
