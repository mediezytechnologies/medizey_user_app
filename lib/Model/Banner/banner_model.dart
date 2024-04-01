class BannerModel {
  bool? status;
  List<String>? bannerImages;

  BannerModel({this.status, this.bannerImages});

  BannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    bannerImages = json['banner_images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['banner_images'] = bannerImages;
    return data;
  }
}
