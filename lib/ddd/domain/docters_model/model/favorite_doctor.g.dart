// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteDoctor _$FavoriteDoctorFromJson(Map<String, dynamic> json) =>
    FavoriteDoctor(
      id: json['id'] as int?,
      userId: json['UserId'] as int?,
      firstname: json['firstname'] as String?,
      secondname: json['secondname'] as String?,
      distanceFromUser: json['distance_from_user'],
      specialization: json['Specialization'] as String?,
      docterImage: json['DocterImage'] as String?,
      location: json['Location'] as String?,
      mainHospital: json['MainHospital'] as String?,
      clinics: (json['clinics'] as List<dynamic>?)
          ?.map((e) => Clinic.fromJson(e as Map<String, dynamic>))
          .toList(),
      favoriteStatus: json['favoriteStatus'] as int?,
    );

Map<String, dynamic> _$FavoriteDoctorToJson(FavoriteDoctor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'UserId': instance.userId,
      'firstname': instance.firstname,
      'secondname': instance.secondname,
      'distance_from_user': instance.distanceFromUser,
      'Specialization': instance.specialization,
      'DocterImage': instance.docterImage,
      'Location': instance.location,
      'MainHospital': instance.mainHospital,
      'clinics': instance.clinics,
      'favoriteStatus': instance.favoriteStatus,
    };
