// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchDoctor _$SearchDoctorFromJson(Map<String, dynamic> json) => SearchDoctor(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['UserId'] as num?)?.toInt(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      specialization: json['Specialization'] as String?,
      docterImage: json['DocterImage'] as String?,
      location: json['Location'] as String?,
      mainHospital: json['MainHospital'] as String?,
      distanceFromUser: json['distance_from_user'] as String?,
      clinics: (json['clinics'] as List<dynamic>?)
          ?.map((e) => Clinics.fromJson(e as Map<String, dynamic>))
          .toList(),
      favoriteStatus: (json['favoriteStatus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchDoctorToJson(SearchDoctor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'UserId': instance.userId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'Specialization': instance.specialization,
      'DocterImage': instance.docterImage,
      'Location': instance.location,
      'MainHospital': instance.mainHospital,
      'distance_from_user': instance.distanceFromUser,
      'clinics': instance.clinics,
      'favoriteStatus': instance.favoriteStatus,
    };
