// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitAnswerModel _$SubmitAnswerModelFromJson(Map<String, dynamic> json) =>
    SubmitAnswerModel(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SubmitAnswerModelToJson(SubmitAnswerModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
