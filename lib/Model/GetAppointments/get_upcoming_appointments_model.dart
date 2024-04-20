import 'package:mediezy_user/Model/Clinics/clinic_model.dart';

class GetUpComingAppointmentsModel {
  bool? status;
  String? message;
  List<UpcomingAppointments>? upcomingAppointments;

  GetUpComingAppointmentsModel(
      {this.status, this.message, this.upcomingAppointments});

  GetUpComingAppointmentsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['upcoming appointments'] != null) {
      upcomingAppointments = <UpcomingAppointments>[];
      json['upcoming appointments'].forEach((v) {
        upcomingAppointments!.add(new UpcomingAppointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.upcomingAppointments != null) {
      data['upcoming appointments'] =
          this.upcomingAppointments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UpcomingAppointments {
  int? tokenId;
  int? doctorId;
  int? patientId;
  int? tokenNumber;
  String? tokenStartTime;
  String? tokenScheduledDate;
  int? doctorLateTime;
  int? doctorEarlyTime;
  int? doctorBreakTime;
  String? tokenBookedTime;
  int? isCheckedin;
  int? isCheckedout;
  String? checkinTime;
  String? checkoutTime;
  int? extraTimeTaken;
  int? lessTimeTaken;
  int? isReserved;
  int? isReached;
  int? rescheduleType;
  String? checkinChange;
  String? checkoutChange;
  String? estimateOfNextToken;
  String? scheduleStartTime;
  int? leaveStatus;
  String? tokenBookedDate;
  int? liveToken;
  String? patientName;
  String? doctorName;
  String? doctorImage;
  String? clinicName;
  String? estimateArrivalTime;
  String? mediezyDoctorId;
  MainSymptoms? mainSymptoms;
  int? nextAvailableTokenNumber;
  int? nextAvailableTokenDate;
  List<Clinics>? clinics;
  OtherSymptom? otherSymptom;
  bool? patientAbsent;

  UpcomingAppointments(
      {this.tokenId,
      this.doctorId,
      this.patientId,
      this.tokenNumber,
      this.tokenStartTime,
      this.tokenScheduledDate,
      this.doctorLateTime,
      this.doctorEarlyTime,
      this.doctorBreakTime,
      this.tokenBookedTime,
      this.isCheckedin,
      this.isCheckedout,
      this.checkinTime,
      this.checkoutTime,
      this.extraTimeTaken,
      this.lessTimeTaken,
      this.isReserved,
      this.isReached,
      this.rescheduleType,
      this.checkinChange,
      this.checkoutChange,
      this.estimateOfNextToken,
      this.scheduleStartTime,
      this.leaveStatus,
      this.tokenBookedDate,
      this.liveToken,
      this.patientName,
      this.doctorName,
      this.doctorImage,
      this.clinicName,
      this.estimateArrivalTime,
      this.mediezyDoctorId,
      this.mainSymptoms,
      this.nextAvailableTokenNumber,
      this.nextAvailableTokenDate,
      this.clinics,
      this.otherSymptom,
      this.patientAbsent});

  UpcomingAppointments.fromJson(Map<String, dynamic> json) {
    tokenId = json['token_id'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    tokenNumber = json['token_number'];
    tokenStartTime = json['token_start_time'];
    tokenScheduledDate = json['token_scheduled_date'];
    doctorLateTime = json['doctor_late_time'];
    doctorEarlyTime = json['doctor_early_time'];
    doctorBreakTime = json['doctor_break_time'];
    tokenBookedTime = json['token_booked_time'];
    isCheckedin = json['is_checkedin'];
    isCheckedout = json['is_checkedout'];
    checkinTime = json['checkin_time'];
    checkoutTime = json['checkout_time'];
    extraTimeTaken = json['extra_time_taken'];
    lessTimeTaken = json['less_time_taken'];
    isReserved = json['is_reserved'];
    isReached = json['is_reached'];
    rescheduleType = json['reschedule_type'];
    checkinChange = json['checkin_change'];
    checkoutChange = json['checkout_change'];
    estimateOfNextToken = json['estimate_of_next_token'];
    scheduleStartTime = json['schedule_start_time'];
    leaveStatus = json['leave_status'];
    tokenBookedDate = json['token_booked_date'];
    liveToken = json['live_token'];
    patientName = json['patient_name'];
    doctorName = json['doctor_name'];
    doctorImage = json['doctor_image'];
    clinicName = json['clinic_name'];
    estimateArrivalTime = json['estimate_arrival_time'];
    mediezyDoctorId = json['mediezy_doctor_id'];
    mainSymptoms = json['main_symptoms'] != null
        ? new MainSymptoms.fromJson(json['main_symptoms'])
        : null;
    nextAvailableTokenNumber = json['next_available_token_number'];
    nextAvailableTokenDate = json['next_available_token_date'];
    if (json['clinics'] != null) {
      clinics = <Clinics>[];
      json['clinics'].forEach((v) {
        clinics!.add(new Clinics.fromJson(v));
      });
    }
    otherSymptom = json['other_symptom'] != null
        ? new OtherSymptom.fromJson(json['other_symptom'])
        : null;
    patientAbsent = json['patient_absent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_id'] = this.tokenId;
    data['doctor_id'] = this.doctorId;
    data['patient_id'] = this.patientId;
    data['token_number'] = this.tokenNumber;
    data['token_start_time'] = this.tokenStartTime;
    data['token_scheduled_date'] = this.tokenScheduledDate;
    data['doctor_late_time'] = this.doctorLateTime;
    data['doctor_early_time'] = this.doctorEarlyTime;
    data['doctor_break_time'] = this.doctorBreakTime;
    data['token_booked_time'] = this.tokenBookedTime;
    data['is_checkedin'] = this.isCheckedin;
    data['is_checkedout'] = this.isCheckedout;
    data['checkin_time'] = this.checkinTime;
    data['checkout_time'] = this.checkoutTime;
    data['extra_time_taken'] = this.extraTimeTaken;
    data['less_time_taken'] = this.lessTimeTaken;
    data['is_reserved'] = this.isReserved;
    data['is_reached'] = this.isReached;
    data['reschedule_type'] = this.rescheduleType;
    data['checkin_change'] = this.checkinChange;
    data['checkout_change'] = this.checkoutChange;
    data['estimate_of_next_token'] = this.estimateOfNextToken;
    data['schedule_start_time'] = this.scheduleStartTime;
    data['leave_status'] = this.leaveStatus;
    data['token_booked_date'] = this.tokenBookedDate;
    data['live_token'] = this.liveToken;
    data['patient_name'] = this.patientName;
    data['doctor_name'] = this.doctorName;
    data['doctor_image'] = this.doctorImage;
    data['clinic_name'] = this.clinicName;
    data['estimate_arrival_time'] = this.estimateArrivalTime;
    data['mediezy_doctor_id'] = this.mediezyDoctorId;
    if (this.mainSymptoms != null) {
      data['main_symptoms'] = this.mainSymptoms!.toJson();
    }
    data['next_available_token_number'] = this.nextAvailableTokenNumber;
    data['next_available_token_date'] = this.nextAvailableTokenDate;
    if (this.clinics != null) {
      data['clinics'] = this.clinics!.map((v) => v.toJson()).toList();
    }
    if (this.otherSymptom != null) {
      data['other_symptom'] = this.otherSymptom!.toJson();
    }
    data['patient_absent'] = this.patientAbsent;
    return data;
  }
}

class MainSymptoms {
  String? mainsymptoms;

  MainSymptoms({this.mainsymptoms});

  MainSymptoms.fromJson(Map<String, dynamic> json) {
    mainsymptoms = json['Mainsymptoms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Mainsymptoms'] = this.mainsymptoms;
    return data;
  }
}



class OtherSymptom {
  String? symtoms;

  OtherSymptom({this.symtoms});

  OtherSymptom.fromJson(Map<String, dynamic> json) {
    symtoms = json['symtoms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symtoms'] = this.symtoms;
    return data;
  }
}
