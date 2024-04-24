import 'package:json_annotation/json_annotation.dart';

import 'favorite_doctor.dart';

part 'docters_model.g.dart';

@JsonSerializable()
class DoctersModel {
  bool? status;
  @JsonKey(name: 'Favorite Doctors')
  List<FavoriteDoctor>? favoriteDoctors;
  String? message;

  DoctersModel({this.status, this.favoriteDoctors, this.message});

  factory DoctersModel.fromJson(Map<String, dynamic> json) {
    return _$DoctersModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DoctersModelToJson(this);
}
