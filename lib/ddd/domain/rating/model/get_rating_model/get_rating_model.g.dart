// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRatingModel _$GetRatingModelFromJson(Map<String, dynamic> json) =>
    GetRatingModel(
      heading: json['heading'] as String?,
      userRating: (json['User_Rating'] as List<dynamic>?)
          ?.map((e) => UserRating.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetRatingModelToJson(GetRatingModel instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'User_Rating': instance.userRating,
      'message': instance.message,
    };
