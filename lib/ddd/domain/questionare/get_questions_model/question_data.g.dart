// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionData _$QuestionDataFromJson(Map<String, dynamic> json) => QuestionData(
      id: (json['id'] as num?)?.toInt(),
      symptomId: (json['symptom_id'] as num?)?.toInt(),
      symptomQuestion: json['symptom_question'] as String?,
      symptomQuestionImage: json['symptom_question_image'],
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$QuestionDataToJson(QuestionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symptom_id': instance.symptomId,
      'symptom_question': instance.symptomQuestion,
      'symptom_question_image': instance.symptomQuestionImage,
      'options': instance.options,
    };
