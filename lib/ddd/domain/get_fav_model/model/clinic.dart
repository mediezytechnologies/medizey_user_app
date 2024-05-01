// import 'package:json_annotation/json_annotation.dart';

// part 'clinic.g.dart';

// @JsonSerializable()
// class Clinic {
//   @JsonKey(name: 'clinic_id')
//   int? clinicId;
//   @JsonKey(name: 'clinic_name')
//   String? clinicName;
//   @JsonKey(name: 'clinic_start_time')
//   String? clinicStartTime;
//   @JsonKey(name: 'clinic_end_time')
//   String? clinicEndTime;
//   @JsonKey(name: 'clinic_address')
//   String? clinicAddress;
//   @JsonKey(name: 'clinic_location')
//   String? clinicLocation;
//   @JsonKey(name: 'clinic_main_image')
//   String? clinicMainImage;
//   @JsonKey(name: 'clinic_description')
//   String? clinicDescription;
//   @JsonKey(name: 'total_token_Count')
//   int? totalTokenCount;
//   @JsonKey(name: 'available_token_count')
//   int? availableTokenCount;
//   @JsonKey(name: 'next_available_token_time')
//   String? nextAvailableTokenTime;

//   Clinic({
//     this.clinicId,
//     this.clinicName,
//     this.clinicStartTime,
//     this.clinicEndTime,
//     this.clinicAddress,
//     this.clinicLocation,
//     this.clinicMainImage,
//     this.clinicDescription,
//     this.totalTokenCount,
//     this.availableTokenCount,
//     this.nextAvailableTokenTime,
//   });

//   factory Clinic.fromJson(Map<String, dynamic> json) {
//     return _$ClinicFromJson(json);
//   }

//   Map<String, dynamic> toJson() => _$ClinicToJson(this);
// }
