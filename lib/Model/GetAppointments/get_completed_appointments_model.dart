// class GetCompletedAppointmentsModel {
//   bool? status;
//   List<AppointmentDetails>? appointmentDetails;

//   GetCompletedAppointmentsModel({this.status, this.appointmentDetails});

//   GetCompletedAppointmentsModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['appointment_details'] != null) {
//       appointmentDetails = <AppointmentDetails>[];
//       json['appointment_details'].forEach((v) {
//         appointmentDetails!.add(AppointmentDetails.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     if (appointmentDetails != null) {
//       data['appointment_details'] =
//           appointmentDetails!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class AppointmentDetails {
//   int? appointmentId;
//   int? tokenNumber;
//   String? date;
//   String? tokenStartTime;
//   String? symptomStartTime;
//   String? symptomFrequency;
//   String? checkInTime;
//   String? checkoutTime;
//   int? feedbackStatus;
//   String? prescriptionImage;
//   String? scheduleType;
//   String? notes;
//   int? reviewAfter;
//   String? patientName;
//   int? patientAge;
//   int? patientId;
//   int? patientUserId;
//   String? doctorImage;
//   String? doctorName;
//   String? clinicName;
//   String? labCentreName;
//   List<String>? labTest;
//   String? scanningCentreName;
//   List<String>? scanTest;
//   String? mediezyPatientId;
//   String? patientUserImage;
//   List<Vitals>? vitals;
//   List<DoctorMedicines>? doctorMedicines;
//   MainSymptoms? mainSymptoms;
//   List<OtherSymptoms>? otherSymptoms;

//   AppointmentDetails(
//       {this.appointmentId,
//       this.tokenNumber,
//       this.date,
//       this.tokenStartTime,
//       this.symptomStartTime,
//       this.symptomFrequency,
//       this.checkInTime,
//       this.checkoutTime,
//       this.feedbackStatus,
//       this.prescriptionImage,
//       this.scheduleType,
//       this.notes,
//       this.reviewAfter,
//       this.patientName,
//       this.patientAge,
//       this.patientId,
//       this.patientUserId,
//       this.doctorImage,
//       this.doctorName,
//       this.clinicName,
//       this.labCentreName,
//       this.labTest,
//       this.scanningCentreName,
//       this.scanTest,
//       this.mediezyPatientId,
//       this.patientUserImage,
//       this.vitals,
//       this.doctorMedicines,
//       this.mainSymptoms,
//       this.otherSymptoms});

//   AppointmentDetails.fromJson(Map<String, dynamic> json) {
//     appointmentId = json['appointment_id'];
//     tokenNumber = json['token_number'];
//     date = json['date'];
//     tokenStartTime = json['token_start_time'];
//     symptomStartTime = json['symptom_start_time'];
//     symptomFrequency = json['symptom_frequency'];
//     checkInTime = json['check_in_time'];
//     checkoutTime = json['checkout_time'];
//     feedbackStatus = json['feedback_status'];
//     prescriptionImage = json['prescription_image'];
//     scheduleType = json['schedule_type'];
//     notes = json['notes'];
//     reviewAfter = json['review_after'];
//     patientName = json['patient_name'];
//     patientAge = json['patient_age'];
//     patientId = json['patient_id'];
//     patientUserId = json['patient_user_id'];
//     doctorImage = json['doctor_image'];
//     doctorName = json['doctor_name'];
//     clinicName = json['clinic_name'];
//     labCentreName = json['lab_centre_name'];
//     labTest = json["lab_test"] == null ? [] : List<String>.from(json["lab_test"]!.map((x) => x));
//     scanningCentreName = json['scanning_centre_name'];
//     scanTest = json["scan_test"] == null ? [] : List<String>.from(json["scan_test"]!.map((x) => x));
//     mediezyPatientId = json['mediezy_patient_id'];
//     patientUserImage = json['patient_user_image'];
//     if (json['vitals'] != null) {
//       vitals = <Vitals>[];
//       json['vitals'].forEach((v) {
//         vitals!.add(Vitals.fromJson(v));
//       });
//     }
//     if (json['doctor_medicines'] != null) {
//       doctorMedicines = <DoctorMedicines>[];
//       json['doctor_medicines'].forEach((v) {
//         doctorMedicines!.add(DoctorMedicines.fromJson(v));
//       });
//     }
//     mainSymptoms = json['main_symptoms'] != null
//         ? MainSymptoms.fromJson(json['main_symptoms'])
//         : null;
//     if (json['other_symptoms'] != null) {
//       otherSymptoms = <OtherSymptoms>[];
//       json['other_symptoms'].forEach((v) {
//         otherSymptoms!.add(OtherSymptoms.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['appointment_id'] = appointmentId;
//     data['token_number'] = tokenNumber;
//     data['date'] = date;
//     data['token_start_time'] = tokenStartTime;
//     data['symptom_start_time'] = symptomStartTime;
//     data['symptom_frequency'] = symptomFrequency;
//     data['check_in_time'] = checkInTime;
//     data['checkout_time'] = checkoutTime;
//     data['feedback_status'] = feedbackStatus;
//     data['prescription_image'] = prescriptionImage;
//     data['schedule_type'] = scheduleType;
//     data['notes'] = notes;
//     data['review_after'] = reviewAfter;
//     data['patient_name'] = patientName;
//     data['patient_age'] = patientAge;
//     data['patient_id'] = patientId;
//     data['patient_user_id'] = patientUserId;
//     data['doctor_image'] = doctorImage;
//     data['doctor_name'] = doctorName;
//     data['clinic_name'] = clinicName;
//     data['lab_centre_name'] = labCentreName;
//     data['lab_test'] = labTest;
//     data['scanning_centre_name'] = scanningCentreName;
//     data['scan_test'] = scanTest;
//     data['mediezy_patient_id'] = mediezyPatientId;
//     data['patient_user_image'] = patientUserImage;
//     if (vitals != null) {
//       data['vitals'] = vitals!.map((v) => v.toJson()).toList();
//     }
//     if (doctorMedicines != null) {
//       data['doctor_medicines'] =
//           doctorMedicines!.map((v) => v.toJson()).toList();
//     }
//     if (mainSymptoms != null) {
//       data['main_symptoms'] = mainSymptoms!.toJson();
//     }
//     if (otherSymptoms != null) {
//       data['other_symptoms'] =
//           otherSymptoms!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Vitals {
//   String? height;
//   String? weight;
//   String? temperature;
//   String? spo2;
//   String? sys;
//   String? dia;
//   String? heartRate;
//   String? temperatureType;

//   Vitals(
//       {this.height,
//       this.weight,
//       this.temperature,
//       this.spo2,
//       this.sys,
//       this.dia,
//       this.heartRate,
//       this.temperatureType});

//   Vitals.fromJson(Map<String, dynamic> json) {
//     height = json['height'];
//     weight = json['weight'];
//     temperature = json['temperature'];
//     spo2 = json['spo2'];
//     sys = json['sys'];
//     dia = json['dia'];
//     heartRate = json['heart_rate'];
//     temperatureType = json['temperature_type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['height'] = height;
//     data['weight'] = weight;
//     data['temperature'] = temperature;
//     data['spo2'] = spo2;
//     data['sys'] = sys;
//     data['dia'] = dia;
//     data['heart_rate'] = heartRate;
//     data['temperature_type'] = temperatureType;
//     return data;
//   }
// }

// class DoctorMedicines {
//   String? medicineName;
//   String? dosage;
//   String? noOfDays;
//   int? noon;
//   int? night;
//   int? evening;
//   int? morning;
//   int? type;
//   String? interval;
//   String? timeSection;
//   String? medicalStoreName;

//   DoctorMedicines(
//       {this.medicineName,
//       this.dosage,
//       this.noOfDays,
//       this.noon,
//       this.night,
//       this.evening,
//       this.morning,
//       this.type,
//       this.interval,
//       this.timeSection,
//       this.medicalStoreName});

//   DoctorMedicines.fromJson(Map<String, dynamic> json) {
//     medicineName = json['medicine_name'];
//     dosage = json['Dosage'];
//     noOfDays = json['NoOfDays'];
//     noon = json['Noon'];
//     night = json['night'];
//     evening = json['evening'];
//     morning = json['morning'];
//     type = json['type'];
//     interval = json['interval'];
//     timeSection = json['time_section'];
//     medicalStoreName = json['medical_store_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['medicine_name'] = medicineName;
//     data['Dosage'] = dosage;
//     data['NoOfDays'] = noOfDays;
//     data['Noon'] = noon;
//     data['night'] = night;
//     data['evening'] = evening;
//     data['morning'] = morning;
//     data['type'] = type;
//     data['interval'] = interval;
//     data['time_section'] = timeSection;
//     data['medical_store_name'] = medicalStoreName;
//     return data;
//   }
// }

// class MainSymptoms {
//   String? mainsymptoms;

//   MainSymptoms({this.mainsymptoms});

//   MainSymptoms.fromJson(Map<String, dynamic> json) {
//     mainsymptoms = json['Mainsymptoms'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['Mainsymptoms'] = mainsymptoms;
//     return data;
//   }
// }

// class OtherSymptoms {
//   String? symtoms;

//   OtherSymptoms({this.symtoms});

//   OtherSymptoms.fromJson(Map<String, dynamic> json) {
//     symtoms = json['symtoms'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['symtoms'] = symtoms;
//     return data;
//   }
// }

class GetCompletedAppointmentsModel {
  bool? status;
  List<AppointmentDetails>? appointmentDetails;

  GetCompletedAppointmentsModel({this.status, this.appointmentDetails});

  GetCompletedAppointmentsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['appointment_details'] != null) {
      appointmentDetails = <AppointmentDetails>[];
      json['appointment_details'].forEach((v) {
        appointmentDetails!.add(AppointmentDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (appointmentDetails != null) {
      data['appointment_details'] =
          appointmentDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppointmentDetails {
  int? appointmentId;
  int? tokenNumber;
  String? date;
  String? tokenStartTime;
  String? symptomStartTime;
  String? symptomFrequency;
  String? checkInTime;
  String? checkoutTime;
  int? feedbackStatus;
  String? prescriptionImage;
  String? scheduleType;
  String? notes;
  int? reviewAfter;
  String? patientName;
  int? patientAge;
  int? patientId;
  int? patientUserId;
  String? doctorImage;
  String? doctorName;
  String? clinicName;
  String? labCentreName;
  List<String>? labTest;
  String? scanningCentreName;
  List<String>? scanTest;
  String? mediezyPatientId;
  String? patientUserImage;
  List<Vitals>? vitals;
  String? medicalStoreName;
  List<DoctorMedicines>? doctorMedicines;
  MainSymptoms? mainSymptoms;
  List<OtherSymptoms>? otherSymptoms;

  AppointmentDetails(
      {this.appointmentId,
      this.tokenNumber,
      this.date,
      this.tokenStartTime,
      this.symptomStartTime,
      this.symptomFrequency,
      this.checkInTime,
      this.checkoutTime,
      this.feedbackStatus,
      this.prescriptionImage,
      this.scheduleType,
      this.notes,
      this.reviewAfter,
      this.patientName,
      this.patientAge,
      this.patientId,
      this.patientUserId,
      this.doctorImage,
      this.doctorName,
      this.clinicName,
      this.labCentreName,
      this.labTest,
      this.scanningCentreName,
      this.scanTest,
      this.mediezyPatientId,
      this.patientUserImage,
      this.vitals,
      this.medicalStoreName,
      this.doctorMedicines,
      this.mainSymptoms,
      this.otherSymptoms});

  AppointmentDetails.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointment_id'];
    tokenNumber = json['token_number'];
    date = json['date'];
    tokenStartTime = json['token_start_time'];
    symptomStartTime = json['symptom_start_time'];
    symptomFrequency = json['symptom_frequency'];
    checkInTime = json['check_in_time'];
    checkoutTime = json['checkout_time'];
    feedbackStatus = json['feedback_status'];
    prescriptionImage = json['prescription_image'];
    scheduleType = json['schedule_type'];
    notes = json['notes'];
    reviewAfter = json['review_after'];
    patientName = json['patient_name'];
    patientAge = json['patient_age'];
    patientId = json['patient_id'];
    patientUserId = json['patient_user_id'];
    doctorImage = json['doctor_image'];
    doctorName = json['doctor_name'];
    clinicName = json['clinic_name'];
    labCentreName = json['lab_centre_name'];
    labTest = json['lab_test'].cast<String>();
    scanningCentreName = json['scanning_centre_name'];
    scanTest = json['scan_test'].cast<String>();
    mediezyPatientId = json['mediezy_patient_id'];
    patientUserImage = json['patient_user_image'];
    if (json['vitals'] != null) {
      vitals = <Vitals>[];
      json['vitals'].forEach((v) {
        vitals!.add(Vitals.fromJson(v));
      });
    }
    medicalStoreName = json['medical_store_name'];
    if (json['doctor_medicines'] != null) {
      doctorMedicines = <DoctorMedicines>[];
      json['doctor_medicines'].forEach((v) {
        doctorMedicines!.add(DoctorMedicines.fromJson(v));
      });
    }
    mainSymptoms = json['main_symptoms'] != null
        ? MainSymptoms.fromJson(json['main_symptoms'])
        : null;
    if (json['other_symptoms'] != null) {
      otherSymptoms = <OtherSymptoms>[];
      json['other_symptoms'].forEach((v) {
        otherSymptoms!.add(OtherSymptoms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointment_id'] = appointmentId;
    data['token_number'] = tokenNumber;
    data['date'] = date;
    data['token_start_time'] = tokenStartTime;
    data['symptom_start_time'] = symptomStartTime;
    data['symptom_frequency'] = symptomFrequency;
    data['check_in_time'] = checkInTime;
    data['checkout_time'] = checkoutTime;
    data['feedback_status'] = feedbackStatus;
    data['prescription_image'] = prescriptionImage;
    data['schedule_type'] = scheduleType;
    data['notes'] = notes;
    data['review_after'] = reviewAfter;
    data['patient_name'] = patientName;
    data['patient_age'] = patientAge;
    data['patient_id'] = patientId;
    data['patient_user_id'] = patientUserId;
    data['doctor_image'] = doctorImage;
    data['doctor_name'] = doctorName;
    data['clinic_name'] = clinicName;
    data['lab_centre_name'] = labCentreName;
    data['lab_test'] = labTest;
    data['scanning_centre_name'] = scanningCentreName;
    data['scan_test'] = scanTest;
    data['mediezy_patient_id'] = mediezyPatientId;
    data['patient_user_image'] = patientUserImage;
    if (vitals != null) {
      data['vitals'] = vitals!.map((v) => v.toJson()).toList();
    }
    data['medical_store_name'] = medicalStoreName;
    if (doctorMedicines != null) {
      data['doctor_medicines'] =
          doctorMedicines!.map((v) => v.toJson()).toList();
    }
    if (mainSymptoms != null) {
      data['main_symptoms'] = mainSymptoms!.toJson();
    }
    if (otherSymptoms != null) {
      data['other_symptoms'] =
          otherSymptoms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vitals {
  String? height;
  String? weight;
  String? temperature;
  String? spo2;
  String? sys;
  String? dia;
  String? heartRate;
  String? temperatureType;

  Vitals(
      {this.height,
      this.weight,
      this.temperature,
      this.spo2,
      this.sys,
      this.dia,
      this.heartRate,
      this.temperatureType});

  Vitals.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    weight = json['weight'];
    temperature = json['temperature'];
    spo2 = json['spo2'];
    sys = json['sys'];
    dia = json['dia'];
    heartRate = json['heart_rate'];
    temperatureType = json['temperature_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['weight'] = weight;
    data['temperature'] = temperature;
    data['spo2'] = spo2;
    data['sys'] = sys;
    data['dia'] = dia;
    data['heart_rate'] = heartRate;
    data['temperature_type'] = temperatureType;
    return data;
  }
}

class DoctorMedicines {
  String? medicineName;
  String? dosage;
  String? noOfDays;
  int? noon;
  int? night;
  int? evening;
  int? morning;
  int? type;
  String? interval;
  String? timeSection;

  DoctorMedicines(
      {this.medicineName,
      this.dosage,
      this.noOfDays,
      this.noon,
      this.night,
      this.evening,
      this.morning,
      this.type,
      this.interval,
      this.timeSection});

  DoctorMedicines.fromJson(Map<String, dynamic> json) {
    medicineName = json['medicine_name'];
    dosage = json['Dosage'];
    noOfDays = json['NoOfDays'];
    noon = json['Noon'];
    night = json['night'];
    evening = json['evening'];
    morning = json['morning'];
    type = json['type'];
    interval = json['interval'];
    timeSection = json['time_section'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medicine_name'] = medicineName;
    data['Dosage'] = dosage;
    data['NoOfDays'] = noOfDays;
    data['Noon'] = noon;
    data['night'] = night;
    data['evening'] = evening;
    data['morning'] = morning;
    data['type'] = type;
    data['interval'] = interval;
    data['time_section'] = timeSection;
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

class OtherSymptoms {
  String? symtoms;

  OtherSymptoms({this.symtoms});

  OtherSymptoms.fromJson(Map<String, dynamic> json) {
    symtoms = json['symtoms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symtoms'] = symtoms;
    return data;
  }
}

