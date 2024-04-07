// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errores_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErroresModel _$ErroresModelFromJson(Map<String, dynamic> json) => ErroresModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErroresModelToJson(ErroresModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
