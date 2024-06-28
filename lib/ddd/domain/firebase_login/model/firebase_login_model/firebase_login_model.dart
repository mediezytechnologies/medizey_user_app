class FirebaseLoginModel {
  bool? status;
  User? user;
  String? token;
  String? role;
  String? message;

  FirebaseLoginModel({this.status, this.user, this.token, this.role, this.message});

  FirebaseLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    token = json['token'];
    role = json['role'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    data['role'] = role;
    data['message'] = message;
    return data;
  }
}
class User {
  int? id;
  String? firstname;
  String? mobileNo;
  String? email;
  String? userRole; // Changed from int? to String?
  dynamic image;

  User({
    this.id,
    this.firstname,
    this.mobileNo,
    this.email,
    this.userRole,
    this.image
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    userRole = json['user_role']?.toString(); // Convert to String
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['mobileNo'] = this.mobileNo;
    data['email'] = this.email;
    data['user_role'] = this.userRole;
    data['image'] = this.image;
    return data;
  }
}