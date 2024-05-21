class GetQuestionModel {
  bool? status;
  List<Data>? data;

  GetQuestionModel({this.status, this.data});

  GetQuestionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? symptomId;
  String? symptomQuestion;
  String? symptomQuestionImage;
  List<String>? options;

  Data(
      {this.id,
      this.symptomId,
      this.symptomQuestion,
      this.symptomQuestionImage,
      this.options});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symptomId = json['symptom_id'];
    symptomQuestion = json['symptom_question'];
    symptomQuestionImage = json['symptom_question_image'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symptom_id'] = symptomId;
    data['symptom_question'] = symptomQuestion;
    data['symptom_question_image'] = symptomQuestionImage;
    data['options'] = options;
    return data;
  }
}
