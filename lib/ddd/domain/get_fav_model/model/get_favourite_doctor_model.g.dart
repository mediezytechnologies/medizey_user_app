// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favourite_doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFavouriteDoctorModel _$GetFavouriteDoctorModelFromJson(
        Map<String, dynamic> json) =>
    GetFavouriteDoctorModel(
      status: json['status'] as bool?,
      favoriteDoctors: (json['Favorite Doctors'] as List<dynamic>?)
          ?.map((e) => FavoriteDoctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetFavouriteDoctorModelToJson(
        GetFavouriteDoctorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'Favorite Doctors': instance.favoriteDoctors,
      'message': instance.message,
    };
