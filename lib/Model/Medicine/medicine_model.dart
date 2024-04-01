class MedicineModel {
  String? medicineName;
  String? illness;

  MedicineModel({this.medicineName, this.illness});

  MedicineModel.fromJson(Map<String, dynamic> json) {
    medicineName = json['medicineName'];
    illness = json['illness'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medicineName'] = medicineName;
    data['illness'] = illness;
    return data;
  }
}
