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
        upcomingAppointments!.add(UpcomingAppointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (upcomingAppointments != null) {
      data['upcoming appointments'] =
          upcomingAppointments!.map((v) => v.toJson()).toList();
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
  String? estimateCheckinTime;
  String? newEstimateTime;
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
  String? nextAvailableTokenDate;
  List<Clinics>? clinics;
  OtherSymptom? otherSymptom;
  bool? patientAbsent;
  String? sheduleLateMessage;

  UpcomingAppointments({
    this.tokenId,
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
    this.estimateCheckinTime,
    this.newEstimateTime,
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
    this.patientAbsent,
    this.sheduleLateMessage,
  });

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
    estimateCheckinTime = json['estimate_checkin_time'];
    newEstimateTime = json['new_estimate_time'];
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
        ? MainSymptoms.fromJson(json['main_symptoms'])
        : null;
    nextAvailableTokenNumber = json['next_available_token_number'];
    nextAvailableTokenDate = json['next_available_token_date'];
    if (json['clinics'] != null) {
      clinics = <Clinics>[];
      json['clinics'].forEach((v) {
        clinics!.add(Clinics.fromJson(v));
      });
    }
    otherSymptom = json['other_symptom'] != null
        ? OtherSymptom.fromJson(json['other_symptom'])
        : null;
    patientAbsent = json['patient_absent'];
    sheduleLateMessage = json['schedule_late_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token_id'] = tokenId;
    data['doctor_id'] = doctorId;
    data['patient_id'] = patientId;
    data['token_number'] = tokenNumber;
    data['token_start_time'] = tokenStartTime;
    data['token_scheduled_date'] = tokenScheduledDate;
    data['doctor_late_time'] = doctorLateTime;
    data['doctor_early_time'] = doctorEarlyTime;
    data['doctor_break_time'] = doctorBreakTime;
    data['token_booked_time'] = tokenBookedTime;
    data['is_checkedin'] = isCheckedin;
    data['is_checkedout'] = isCheckedout;
    data['checkin_time'] = checkinTime;
    data['checkout_time'] = checkoutTime;
    data['extra_time_taken'] = extraTimeTaken;
    data['less_time_taken'] = lessTimeTaken;
    data['is_reserved'] = isReserved;
    data['is_reached'] = isReached;
    data['reschedule_type'] = rescheduleType;
    data['checkin_change'] = checkinChange;
    data['checkout_change'] = checkoutChange;
    data['estimate_of_next_token'] = estimateOfNextToken;
    data['estimate_checkin_time'] = estimateCheckinTime;
    data['new_estimate_time'] = newEstimateTime;
    data['schedule_start_time'] = scheduleStartTime;
    data['leave_status'] = leaveStatus;
    data['token_booked_date'] = tokenBookedDate;
    data['live_token'] = liveToken;
    data['patient_name'] = patientName;
    data['doctor_name'] = doctorName;
    data['doctor_image'] = doctorImage;
    data['clinic_name'] = clinicName;
    data['estimate_arrival_time'] = estimateArrivalTime;
    data['mediezy_doctor_id'] = mediezyDoctorId;
    if (mainSymptoms != null) {
      data['main_symptoms'] = mainSymptoms!.toJson();
    }
    data['next_available_token_number'] = nextAvailableTokenNumber;
    data['next_available_token_date'] = nextAvailableTokenDate;
    if (clinics != null) {
      data['clinics'] = clinics!.map((v) => v.toJson()).toList();
    }
    if (otherSymptom != null) {
      data['other_symptom'] = otherSymptom!.toJson();
    }
    data['patient_absent'] = patientAbsent;
    data['schedule_late_message'] = sheduleLateMessage;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Mainsymptoms'] = mainsymptoms;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symtoms'] = symtoms;
    return data;
  }
}
