// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_fav_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFavModel _$GetFavModelFromJson(Map<String, dynamic> json) => GetFavModel(
      status: json['status'] as bool?,
      favoriteDoctors: (json['Favorite Doctors'] as List<dynamic>?)
          ?.map((e) => FavoriteDoctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetFavModelToJson(GetFavModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'Favorite Doctors': instance.favoriteDoctors,
      'message': instance.message,
    };
