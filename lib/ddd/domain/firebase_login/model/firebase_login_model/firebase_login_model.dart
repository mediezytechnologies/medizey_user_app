import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'firebase_login_model.g.dart';

@JsonSerializable()
class FirebaseLoginModel {
  bool? status;
  String? response;
  String? token;
  User? user;

  FirebaseLoginModel({this.status, this.response, this.token, this.user});

  factory FirebaseLoginModel.fromJson(Map<String, dynamic> json) {
    return _$FirebaseLoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FirebaseLoginModelToJson(this);
}
