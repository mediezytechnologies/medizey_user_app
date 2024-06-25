// 


// To parse this JSON data, do
//
//     final firebaseLoginModel = firebaseLoginModelFromJson(jsonString);
// To parse this JSON data, do
//
//     final firebaseLoginModel = firebaseLoginModelFromJson(jsonString);

import 'dart:convert';

FirebaseLoginModel firebaseLoginModelFromJson(String str) => FirebaseLoginModel.fromJson(json.decode(str));

String firebaseLoginModelToJson(FirebaseLoginModel data) => json.encode(data.toJson());

class FirebaseLoginModel {
    bool status;
    User user;
    String token;
    String role;
    String message;

    FirebaseLoginModel({
        required this.status,
        required this.user,
        required this.token,
        required this.role,
        required this.message,
    });

    factory FirebaseLoginModel.fromJson(Map<String, dynamic> json) => FirebaseLoginModel(
        status: json["status"],
        user: User.fromJson(json["user"]),
        token: json["token"],
        role: json["role"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "user": user.toJson(),
        "token": token,
        "role": role,
        "message": message,
    };
}

class User {
    int id;
    String firstname;
    String mobileNo;
    String email;
    int userRole;
    dynamic image;

    User({
        required this.id,
        required this.firstname,
        required this.mobileNo,
        required this.email,
        required this.userRole,
        required this.image,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstname: json["firstname"],
        mobileNo: json["mobileNo"],
        email: json["email"],
        userRole: json["user_role"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "mobileNo": mobileNo,
        "email": email,
        "user_role": userRole,
        "image": image,
    };
}
