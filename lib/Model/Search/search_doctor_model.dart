import 'package:mediezy_user/Model/Clinics/clinic_model.dart';

class SearchDoctorModel {
  String? status;
  List<SearchDoctors>? searchDoctors;
  String? code;
  String? message;

  SearchDoctorModel({this.status, this.searchDoctors, this.code, this.message});

  SearchDoctorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Search Doctors'] != null) {
      searchDoctors = <SearchDoctors>[];
      json['Search Doctors'].forEach((v) {
        searchDoctors!.add(SearchDoctors.fromJson(v));
      });
    }
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (searchDoctors != null) {
      data['Search Doctors'] =
          searchDoctors!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class SearchDoctors {
  int? id;
  int? userId;
  String? firstname;
  String? lastname;
  String? specialization;
  String? docterImage;
  String? location;
  String? mainHospital;
  String? distanceFromUser;
  List<Clinics>? clinics;
  int? favoriteStatus;

  SearchDoctors(
      {this.id,
      this.userId,
      this.firstname,
      this.lastname,
      this.specialization,
      this.docterImage,
      this.location,
      this.mainHospital,
      this.distanceFromUser,
      this.clinics,
      this.favoriteStatus});

  SearchDoctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['UserId'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    specialization = json['Specialization'];
    docterImage = json['DocterImage'];
    location = json['Location'];
    mainHospital = json['MainHospital'];
    distanceFromUser = json['distance_from_user'];
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
    data['lastname'] = lastname;
    data['Specialization'] = specialization;
    data['DocterImage'] = docterImage;
    data['Location'] = location;
    data['MainHospital'] = mainHospital;
    data['distance_from_user'] = distanceFromUser;
    if (clinics != null) {
      data['clinics'] = clinics!.map((v) => v.toJson()).toList();
    }
    data['favoriteStatus'] = favoriteStatus;
    return data;
  }
}


