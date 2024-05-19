import '../Clinics/clinic_model.dart';

class GetDoctorByIdModel {
  bool? success;
  List<DoctorDetails>? doctorDetails;
  String? code;
  String? message;

  GetDoctorByIdModel(
      {this.success, this.doctorDetails, this.code, this.message});

  GetDoctorByIdModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['Doctor Details'] != null) {
      doctorDetails = <DoctorDetails>[];
      json['Doctor Details'].forEach((v) {
        doctorDetails!.add(DoctorDetails.fromJson(v));
      });
    }
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (doctorDetails != null) {
      data['Doctor Details'] = doctorDetails!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class DoctorDetails {
  int? id;
  String? mediezyDoctorId;
  int? userId;
  String? firstname;
  String? secondname;
  String? specialization;
  String? docterImage;
  String? about;
  String? location;
  String? gender;
  String? emailID;
  String? mobileNumber;
  String? mainHospital;
  String? consulationFees;
  List<String>? specifications;
  List<String>? subspecifications;
  List<Clinics>? clinics;
  int? favoriteStatus;

  DoctorDetails(
      {this.id,
      this.mediezyDoctorId,
      this.userId,
      this.firstname,
      this.secondname,
      this.specialization,
      this.docterImage,
      this.about,
      this.location,
      this.gender,
      this.emailID,
      this.mobileNumber,
      this.mainHospital,
      this.consulationFees,
      this.specifications,
      this.subspecifications,
      this.clinics,
      this.favoriteStatus});

  DoctorDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediezyDoctorId = json['mediezy_doctor_id'];
    userId = json['UserId'];
    firstname = json['firstname'];
    secondname = json['secondname'];
    specialization = json['Specialization'];
    docterImage = json['DocterImage'];
    about = json['About'];
    location = json['Location'];
    gender = json['Gender'];
    emailID = json['emailID'];
    mobileNumber = json['Mobile Number'];
    mainHospital = json['MainHospital'];
    consulationFees = json['consulation_fees'];
    specifications = json['specifications'].cast<String>();
    subspecifications = json['subspecifications'].cast<String>();
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
    data['mediezy_doctor_id'] = mediezyDoctorId;
    data['UserId'] = userId;
    data['firstname'] = firstname;
    data['secondname'] = secondname;
    data['Specialization'] = specialization;
    data['DocterImage'] = docterImage;
    data['About'] = about;
    data['Location'] = location;
    data['Gender'] = gender;
    data['emailID'] = emailID;
    data['Mobile Number'] = mobileNumber;
    data['MainHospital'] = mainHospital;
    data['consulation_fees'] = consulationFees;
    data['specifications'] = specifications;
    data['subspecifications'] = subspecifications;
    if (clinics != null) {
      data['clinics'] = clinics!.map((v) => v.toJson()).toList();
    }
    data['favoriteStatus'] = favoriteStatus;
    return data;
  }
}
