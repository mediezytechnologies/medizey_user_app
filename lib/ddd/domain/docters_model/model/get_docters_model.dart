import 'package:json_annotation/json_annotation.dart';

import 'all_doctor.dart';
part 'get_docters_model.g.dart';

@JsonSerializable()
class GetDoctersModel {
  bool? success;
  @JsonKey(name: 'All Doctors')
  List<AllDoctor>? allDoctors;
  String? code;
  String? message;

  GetDoctersModel({this.success, this.allDoctors, this.code, this.message});

  factory GetDoctersModel.fromJson(Map<String, dynamic> json) {
    return _$GetDoctersModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetDoctersModelToJson(this);
}








