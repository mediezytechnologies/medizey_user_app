class BookAppointmentModel {
  bool? success;
  TokenBooking? tokenBooking;
  String? code;
  String? message;

  BookAppointmentModel(
      {this.success, this.tokenBooking, this.code, this.message});

  BookAppointmentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    tokenBooking = json['TokenBooking'] != null
        ? TokenBooking.fromJson(json['TokenBooking'])
        : null;
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (tokenBooking != null) {
      data['TokenBooking'] = tokenBooking!.toJson();
    }
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class TokenBooking {
  int? tokenId;
  int? doctorId;
  String? patientId;
  int? clinicId;
  int? scheduleId;
  int? tokenNumber;
  String? tokenStartTime;
  String? tokenEndTime;
  String? tokenScheduledDate;
  String? actualTokenDuration;
  String? assignedTokenDuration;
  String? scheduleType;
  int? doctorLateTime;
  int? doctorEarlyTime;
  int? doctorBreakTime;
  String? tokenUpTo;
  String? createdAt;
  String? updatedAt;
  int? tokenBookingStatus;
  int? isCheckedin;
  int? isCheckedout;
  String? checkinTime;
  String? checkoutTime;
  int? tokenBookingId;
  String? bookedUserId;
  String? doctorUserId;
  int? extraTimeTaken;
  int? lessTimeTaken;
  int? checkinDifference;

  TokenBooking(
      {this.tokenId,
      this.doctorId,
      this.patientId,
      this.clinicId,
      this.scheduleId,
      this.tokenNumber,
      this.tokenStartTime,
      this.tokenEndTime,
      this.tokenScheduledDate,
      this.actualTokenDuration,
      this.assignedTokenDuration,
      this.scheduleType,
      this.doctorLateTime,
      this.doctorEarlyTime,
      this.doctorBreakTime,
      this.tokenUpTo,
      this.createdAt,
      this.updatedAt,
      this.tokenBookingStatus,
      this.isCheckedin,
      this.isCheckedout,
      this.checkinTime,
      this.checkoutTime,
      this.tokenBookingId,
      this.bookedUserId,
      this.doctorUserId,
      this.extraTimeTaken,
      this.lessTimeTaken,
      this.checkinDifference});

  TokenBooking.fromJson(Map<String, dynamic> json) {
    tokenId = json['token_id'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    clinicId = json['clinic_id'];
    scheduleId = json['schedule_id'];
    tokenNumber = json['token_number'];
    tokenStartTime = json['token_start_time'];
    tokenEndTime = json['token_end_time'];
    tokenScheduledDate = json['token_scheduled_date'];
    actualTokenDuration = json['actual_token_duration'];
    assignedTokenDuration = json['assigned_token_duration'];
    scheduleType = json['schedule_type'];
    doctorLateTime = json['doctor_late_time'];
    doctorEarlyTime = json['doctor_early_time'];
    doctorBreakTime = json['doctor_break_time'];
    tokenUpTo = json['token_up_to'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tokenBookingStatus = json['token_booking_status'];
    isCheckedin = json['is_checkedin'];
    isCheckedout = json['is_checkedout'];
    checkinTime = json['checkin_time'];
    checkoutTime = json['checkout_time'];
    tokenBookingId = json['token_booking_id'];
    bookedUserId = json['booked_user_id'];
    doctorUserId = json['doctor_user_id'];
    extraTimeTaken = json['extra_time_taken'];
    lessTimeTaken = json['less_time_taken'];
    checkinDifference = json['checkin_difference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token_id'] = tokenId;
    data['doctor_id'] = doctorId;
    data['patient_id'] = patientId;
    data['clinic_id'] = clinicId;
    data['schedule_id'] = scheduleId;
    data['token_number'] = tokenNumber;
    data['token_start_time'] = tokenStartTime;
    data['token_end_time'] = tokenEndTime;
    data['token_scheduled_date'] = tokenScheduledDate;
    data['actual_token_duration'] = actualTokenDuration;
    data['assigned_token_duration'] = assignedTokenDuration;
    data['schedule_type'] = scheduleType;
    data['doctor_late_time'] = doctorLateTime;
    data['doctor_early_time'] = doctorEarlyTime;
    data['doctor_break_time'] = doctorBreakTime;
    data['token_up_to'] = tokenUpTo;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['token_booking_status'] = tokenBookingStatus;
    data['is_checkedin'] = isCheckedin;
    data['is_checkedout'] = isCheckedout;
    data['checkin_time'] = checkinTime;
    data['checkout_time'] = checkoutTime;
    data['token_booking_id'] = tokenBookingId;
    data['booked_user_id'] = bookedUserId;
    data['doctor_user_id'] = doctorUserId;
    data['extra_time_taken'] = extraTimeTaken;
    data['less_time_taken'] = lessTimeTaken;
    data['checkin_difference'] = checkinDifference;
    return data;
  }
}
