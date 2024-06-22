import 'package:json_annotation/json_annotation.dart';

part 'get_banner_model.g.dart';

@JsonSerializable()
class GetBannerModel {
	bool? status;
	@JsonKey(name: 'banner_images') 
	List<String>? bannerImages;

	GetBannerModel({this.status, this.bannerImages});

	factory GetBannerModel.fromJson(Map<String, dynamic> json) {
		return _$GetBannerModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GetBannerModelToJson(this);
}
