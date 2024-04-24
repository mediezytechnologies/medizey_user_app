import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
part 'user_location_model.g.dart';

@JsonSerializable()
class UserLocationModel {
  bool? status;
  Data? data;
  String? message;

  UserLocationModel({this.status, this.data, this.message});

  factory UserLocationModel.fromJson(Map<String, dynamic> json) {
    return _$UserLocationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserLocationModelToJson(this);
}
