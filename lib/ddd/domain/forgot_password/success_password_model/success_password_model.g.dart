// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessPasswordModel _$SuccessPasswordModelFromJson(
        Map<String, dynamic> json) =>
    SuccessPasswordModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SuccessPasswordModelToJson(
        SuccessPasswordModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
