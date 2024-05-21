// ignore_for_file: file_names

class GetTokenModel {
  bool? status;
  Schedule? schedule;
  String? message;

  GetTokenModel({this.status, this.schedule, this.message});

  GetTokenModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    schedule =
        json['schedule'] != null ? Schedule.fromJson(json['schedule']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (schedule != null) {
      data['schedule'] = schedule!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Schedule {
  List<Schedule1>? schedule1;
  List<Schedule2>? schedule2;
  List<Schedule3>? schedule3;

  Schedule({this.schedule1, this.schedule2, this.schedule3});

  Schedule.fromJson(Map<String, dynamic> json) {
    if (json['schedule_1'] != null) {
      schedule1 = <Schedule1>[];
      json['schedule_1'].forEach((v) {
        schedule1!.add(Schedule1.fromJson(v));
      });
    }
    if (json['schedule_2'] != null) {
      schedule2 = <Schedule2>[];
      json['schedule_2'].forEach((v) {
        schedule2!.add(Schedule2.fromJson(v));
      });
    }
    if (json['schedule_3'] != null) {
      schedule3 = <Schedule3>[];
      json['schedule_3'].forEach((v) {
        schedule3!.add(Schedule3.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (schedule1 != null) {
      data['schedule_1'] = schedule1!.map((v) => v.toJson()).toList();
    }
    if (schedule2 != null) {
      data['schedule_2'] = schedule2!.map((v) => v.toJson()).toList();
    }
    if (schedule3 != null) {
      data['schedule_3'] = schedule3!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedule1 {
  int? tokenId;
  int? scheduleId;
  int? tokenNumber;
  String? scheduleType;
  int? isReserved;
  int? isBooked;
  String? formattedStartTime;
  String? estimateStartTime;
  int? isTimeout;

  Schedule1(
      {this.tokenId,
      this.scheduleId,
      this.tokenNumber,
      this.scheduleType,
      this.isReserved,
      this.isBooked,
      this.formattedStartTime,
      this.estimateStartTime,
      this.isTimeout});

  Schedule1.fromJson(Map<String, dynamic> json) {
    tokenId = json['token_id'];
    scheduleId = json['schedule_id'];
    tokenNumber = json['token_number'];
    scheduleType = json['schedule_type'];
    isReserved = json['is_reserved'];
    isBooked = json['is_booked'];
    formattedStartTime = json['formatted_start_time'];
    estimateStartTime = json['estimate_start_time'];
    isTimeout = json['is_timeout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token_id'] = tokenId;
    data['schedule_id'] = scheduleId;
    data['token_number'] = tokenNumber;
    data['schedule_type'] = scheduleType;
    data['is_reserved'] = isReserved;
    data['is_booked'] = isBooked;
    data['formatted_start_time'] = formattedStartTime;
    data['estimate_start_time'] = estimateStartTime;
    data['is_timeout'] = isTimeout;
    return data;
  }
}

class Schedule2 {
  int? tokenId;
  int? scheduleId;
  int? tokenNumber;
  String? scheduleType;
  int? isReserved;
  int? isBooked;
  String? formattedStartTime;
  String? estimateStartTime;
  int? isTimeout;

  Schedule2(
      {this.tokenId,
      this.scheduleId,
      this.tokenNumber,
      this.scheduleType,
      this.isReserved,
      this.isBooked,
      this.formattedStartTime,
      this.estimateStartTime,
      this.isTimeout});

  Schedule2.fromJson(Map<String, dynamic> json) {
    tokenId = json['token_id'];
    scheduleId = json['schedule_id'];
    tokenNumber = json['token_number'];
    scheduleType = json['schedule_type'];
    isReserved = json['is_reserved'];
    isBooked = json['is_booked'];
    formattedStartTime = json['formatted_start_time'];
    estimateStartTime = json['estimate_start_time'];
    isTimeout = json['is_timeout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token_id'] = tokenId;
    data['schedule_id'] = scheduleId;
    data['token_number'] = tokenNumber;
    data['schedule_type'] = scheduleType;
    data['is_reserved'] = isReserved;
    data['is_booked'] = isBooked;
    data['formatted_start_time'] = formattedStartTime;
    data['estimate_start_time'] = estimateStartTime;
    data['is_timeout'] = isTimeout;
    return data;
  }
}

class Schedule3 {
  int? tokenId;
  int? scheduleId;
  int? tokenNumber;
  String? scheduleType;
  int? isReserved;
  int? isBooked;
  String? formattedStartTime;
  String? estimateStartTime;
  int? isTimeout;

  Schedule3(
      {this.tokenId,
      this.scheduleId,
      this.tokenNumber,
      this.scheduleType,
      this.isReserved,
      this.isBooked,
      this.formattedStartTime,
      this.estimateStartTime,
      this.isTimeout});

  Schedule3.fromJson(Map<String, dynamic> json) {
    tokenId = json['token_id'];
    scheduleId = json['schedule_id'];
    tokenNumber = json['token_number'];
    scheduleType = json['schedule_type'];
    isReserved = json['is_reserved'];
    isBooked = json['is_booked'];
    formattedStartTime = json['formatted_start_time'];
    estimateStartTime = json['estimate_start_time'];
    isTimeout = json['is_timeout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token_id'] = tokenId;
    data['schedule_id'] = scheduleId;
    data['token_number'] = tokenNumber;
    data['schedule_type'] = scheduleType;
    data['is_reserved'] = isReserved;
    data['is_booked'] = isBooked;
    data['formatted_start_time'] = formattedStartTime;
    data['estimate_start_time'] = estimateStartTime;
    data['is_timeout'] = isTimeout;
    return data;
  }
}
