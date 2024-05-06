import 'package:json_annotation/json_annotation.dart';

import 'favorite_doctor.dart';

part 'get_fav_model.g.dart';

@JsonSerializable()
class GetFavModel {
  bool? status;
  @JsonKey(name: 'Favorite Doctors')
  List<FavoriteDoctor>? favoriteDoctors;
  String? message;

  GetFavModel({this.status, this.favoriteDoctors, this.message});

  factory GetFavModel.fromJson(Map<String, dynamic> json) {
    return _$GetFavModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetFavModelToJson(this);
}
