import 'package:mediezy_user/Model/Clinics/clinic_model.dart';

class GetRecentlyBookedDoctorModel {
  bool? status;
  List<RecentlyBookedDoctor>? recentlyBookedDoctor;
  String? message;

  GetRecentlyBookedDoctorModel(
      {this.status, this.recentlyBookedDoctor, this.message});

  GetRecentlyBookedDoctorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['recently_booked_doctor'] != null) {
      recentlyBookedDoctor = <RecentlyBookedDoctor>[];
      json['recently_booked_doctor'].forEach((v) {
        recentlyBookedDoctor!.add(RecentlyBookedDoctor.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (recentlyBookedDoctor != null) {
      data['recently_booked_doctor'] =
          recentlyBookedDoctor!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class RecentlyBookedDoctor {
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

  RecentlyBookedDoctor(
      {this.id,
      this.userId,
      this.firstname,
      this.secondname,
      this.distanceFromUser,
      this.specialization,
      this.docterImage,
      this.location,
      this.mainHospital,
      this.clinics});

  RecentlyBookedDoctor.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

