class CommonSymptomModel {
  bool? status;
  String? message;
  List<Data>? data;

  CommonSymptomModel({this.status, this.message, this.data});

  CommonSymptomModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? symptomId;
  String? symptomName;
  String? symptomImage;

  Data({this.symptomId, this.symptomName, this.symptomImage});

  Data.fromJson(Map<String, dynamic> json) {
    symptomId = json['symptom_id'];
    symptomName = json['symptom_name'];
    symptomImage = json['symptom_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symptom_id'] = symptomId;
    data['symptom_name'] = symptomName;
    data['symptom_image'] = symptomImage;
    return data;
  }
}
