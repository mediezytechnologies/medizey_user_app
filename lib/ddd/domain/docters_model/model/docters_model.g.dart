// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'docters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctersModel _$DoctersModelFromJson(Map<String, dynamic> json) => DoctersModel(
      status: json['status'] as bool?,
      favoriteDoctors: (json['Favorite Doctors'] as List<dynamic>?)
          ?.map((e) => FavoriteDoctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DoctersModelToJson(DoctersModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'Favorite Doctors': instance.favoriteDoctors,
      'message': instance.message,
    };
