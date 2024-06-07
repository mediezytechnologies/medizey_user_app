import 'package:json_annotation/json_annotation.dart';
part 'question_data.g.dart';

@JsonSerializable()
class QuestionData {
	int? id;
	@JsonKey(name: 'symptom_id') 
	int? symptomId;
	@JsonKey(name: 'symptom_question') 
	String? symptomQuestion;
	@JsonKey(name: 'symptom_question_image') 
	dynamic symptomQuestionImage;
	List<String>? options;

	QuestionData({
		this.id, 
		this.symptomId, 
		this.symptomQuestion, 
		this.symptomQuestionImage, 
		this.options, 
	});

	factory QuestionData.fromJson(Map<String, dynamic> json) => _$QuestionDataFromJson(json);

	Map<String, dynamic> toJson() => _$QuestionDataToJson(this);
}
