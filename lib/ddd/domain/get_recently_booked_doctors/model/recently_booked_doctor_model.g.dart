// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_booked_doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentlyBookedDoctorModel _$RecentlyBookedDoctorModelFromJson(
        Map<String, dynamic> json) =>
    RecentlyBookedDoctorModel(
      status: json['status'] as bool?,
      recentlyBookedDoctor: (json['recently_booked_doctor'] as List<dynamic>?)
          ?.map((e) => RecentlyBookedDoctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RecentlyBookedDoctorModelToJson(
        RecentlyBookedDoctorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'recently_booked_doctor': instance.recentlyBookedDoctor,
      'message': instance.message,
    };
