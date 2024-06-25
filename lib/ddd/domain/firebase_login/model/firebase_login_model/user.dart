// import 'package:json_annotation/json_annotation.dart';

// part 'user.g.dart';

// @JsonSerializable()
// class User {
//   int? id;
//   String? firstname;
//   String? email;
//   dynamic age;
//   dynamic dateofbirth;
//   dynamic dob;
//   @JsonKey(name: 'email_verified_at')
//   dynamic emailVerifiedAt;
//   @JsonKey(name: 'created_at')
//   DateTime? createdAt;
//   @JsonKey(name: 'updated_at')
//   DateTime? updatedAt;
//   @JsonKey(name: 'user_role')
//   String? userRole;
//   String? mobileNo;
//   dynamic secondname;
//   @JsonKey(name: 'registration_status')
//   int? registrationStatus;
//   @JsonKey(name: 'provider_name')
//   String? providerName;
//   @JsonKey(name: 'provider_id')
//   String? providerId;

//   User({
//     this.id,
//     this.firstname,
//     this.email,
//     this.age,
//     this.dateofbirth,
//     this.dob,
//     this.emailVerifiedAt,
//     this.createdAt,
//     this.updatedAt,
//     this.userRole,
//     this.mobileNo,
//     this.secondname,
//     this.registrationStatus,
//     this.providerName,
//     this.providerId,
//   });

//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }
