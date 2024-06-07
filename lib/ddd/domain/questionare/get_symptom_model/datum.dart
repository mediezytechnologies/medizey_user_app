import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	@JsonKey(name: 'symptom_id') 
	int? symptomId;
	@JsonKey(name: 'symptom_name') 
	String? symptomName;
	@JsonKey(name: 'symptom_image') 
	String? symptomImage;

	Datum({this.symptomId, this.symptomName, this.symptomImage});

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);
}
