// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRatingModel _$AddRatingModelFromJson(Map<String, dynamic> json) =>
    AddRatingModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      reviewDetails: json['review_details'] == null
          ? null
          : ReviewDetails.fromJson(
              json['review_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddRatingModelToJson(AddRatingModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'review_details': instance.reviewDetails,
    };
