// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      symptomId: (json['symptom_id'] as num?)?.toInt(),
      symptomName: json['symptom_name'] as String?,
      symptomImage: json['symptom_image'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'symptom_id': instance.symptomId,
      'symptom_name': instance.symptomName,
      'symptom_image': instance.symptomImage,
    };
