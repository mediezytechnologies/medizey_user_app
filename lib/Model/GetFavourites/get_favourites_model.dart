import 'package:mediezy_user/Model/Clinics/clinic_model.dart';

class GetFavouritesModel {
  bool? status;
  List<FavoriteDoctors>? favoriteDoctors;
  String? message;

  GetFavouritesModel({this.status, this.favoriteDoctors, this.message});

  GetFavouritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Favorite Doctors'] != null) {
      favoriteDoctors = <FavoriteDoctors>[];
      json['Favorite Doctors'].forEach((v) {
        favoriteDoctors!.add(FavoriteDoctors.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (favoriteDoctors != null) {
      data['Favorite Doctors'] =
          favoriteDoctors!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class FavoriteDoctors {
  int? id;
  int? userId;
  String? firstname;
  String? secondname;
  String? distanceFromUser;
  String? specialization;
  String? docterImage;
  String? location;
  String? mainHospital;
  List<Clinics>? clinics;
  int? favoriteStatus;

  FavoriteDoctors(
      {this.id,
      this.userId,
      this.firstname,
      this.secondname,
      this.distanceFromUser,
      this.specialization,
      this.docterImage,
      this.location,
      this.mainHospital,
      this.clinics,
      this.favoriteStatus});

  FavoriteDoctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['UserId'];
    firstname = json['firstname'];
    secondname = json['secondname'];
    distanceFromUser = json['distance_from_user'];
    specialization = json['Specialization'];
    docterImage = json['DocterImage'];
    location = json['Location'];
    mainHospital = json['MainHospital'];
    if (json['clinics'] != null) {
      clinics = <Clinics>[];
      json['clinics'].forEach((v) {
        clinics!.add(Clinics.fromJson(v));
      });
    }
    favoriteStatus = json['favoriteStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['UserId'] = userId;
    data['firstname'] = firstname;
    data['secondname'] = secondname;
    data['distance_from_user'] = distanceFromUser;
    data['Specialization'] = specialization;
    data['DocterImage'] = docterImage;
    data['Location'] = location;
    data['MainHospital'] = mainHospital;
    if (clinics != null) {
      data['clinics'] = clinics!.map((v) => v.toJson()).toList();
    }
    data['favoriteStatus'] = favoriteStatus;
    return data;
  }
}


