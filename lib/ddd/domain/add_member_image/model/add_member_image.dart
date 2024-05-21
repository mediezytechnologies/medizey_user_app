// To parse this JSON data, do
//
//     final addMemberImags = addMemberImagsFromJson(jsonString);

import 'dart:convert';

AddMemberImags addMemberImagsFromJson(String str) =>
    AddMemberImags.fromJson(json.decode(str));

String addMemberImagsToJson(AddMemberImags data) => json.encode(data.toJson());

class AddMemberImags {
  bool? status;
  String? message;
  ImageUplod? imageUplod;

  AddMemberImags({
    this.status,
    this.message,
    this.imageUplod,
  });

  factory AddMemberImags.fromJson(Map<String, dynamic> json) => AddMemberImags(
        status: json["status"],
        message: json["message"],
        imageUplod: json["image_uplod"] == null
            ? null
            : ImageUplod.fromJson(json["image_uplod"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "image_uplod": imageUplod?.toJson(),
      };
}

class ImageUplod {
  int? patientId;
  String? userImage;

  ImageUplod({
    this.patientId,
    this.userImage,
  });

  factory ImageUplod.fromJson(Map<String, dynamic> json) => ImageUplod(
        patientId: json["patient_id"],
        userImage: json["user_image"],
      );

  Map<String, dynamic> toJson() => {
        "patient_id": patientId,
        "user_image": userImage,
      };
}
