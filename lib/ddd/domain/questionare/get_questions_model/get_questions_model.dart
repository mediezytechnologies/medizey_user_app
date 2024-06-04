import 'package:json_annotation/json_annotation.dart';
import 'package:mediezy_user/ddd/domain/questionare/get_questions_model/question_data.dart';
part 'get_questions_model.g.dart';

@JsonSerializable()
class GetQuestionsModel {
	bool? status;
	List<QuestionData>? data;

	GetQuestionsModel({this.status, this.data});

	factory GetQuestionsModel.fromJson(Map<String, dynamic> json) {
		return _$GetQuestionsModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GetQuestionsModelToJson(this);
}
