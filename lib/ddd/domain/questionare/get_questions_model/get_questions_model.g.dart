// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQuestionsModel _$GetQuestionsModelFromJson(Map<String, dynamic> json) =>
    GetQuestionsModel(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => QuestionData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetQuestionsModelToJson(GetQuestionsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
