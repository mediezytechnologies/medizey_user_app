class GetFamilyMembersModel {
  bool? status;
  List<FamilyMember>? familyMember;
  String? message;

  GetFamilyMembersModel({this.status, this.familyMember, this.message});

  GetFamilyMembersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['FamilyMember'] != null) {
      familyMember = <FamilyMember>[];
      json['FamilyMember'].forEach((v) {
        familyMember!.add(FamilyMember.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (familyMember != null) {
      data['FamilyMember'] = familyMember!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class FamilyMember {
  int? id;
  String? firstname;

  FamilyMember({this.id, this.firstname});

  FamilyMember.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = firstname;
    return data;
  }
}
