import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'user_id')
  String? userId;
  String? latitude;
  String? longitude;
  String? city;
  String? district;
  @JsonKey(name: 'location_address')
  String? locationAddress;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  int? id;

  Data({
    this.userId,
    this.latitude,
    this.longitude,
    this.city,
    this.district,
    this.locationAddress,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
