// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBannerModel _$GetBannerModelFromJson(Map<String, dynamic> json) =>
    GetBannerModel(
      status: json['status'] as bool?,
      bannerImages: (json['banner_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GetBannerModelToJson(GetBannerModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'banner_images': instance.bannerImages,
    };
