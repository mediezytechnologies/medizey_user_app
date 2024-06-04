import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	@JsonKey(name: 'question_id') 
	String? questionId;
	@JsonKey(name: 'user_id') 
	String? userId;
	@JsonKey(name: 'selected_option') 
	String? selectedOption;
	@JsonKey(name: 'updated_at') 
	DateTime? updatedAt;
	@JsonKey(name: 'created_at') 
	DateTime? createdAt;
	int? id;

	Data({
		this.questionId, 
		this.userId, 
		this.selectedOption, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
