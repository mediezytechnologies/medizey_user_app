part of 'add_member_bloc.dart';

@immutable
sealed class AddMemberEvent {}

// ignore: must_be_immutable
class FetchAddMember extends AddMemberEvent {
  final String fullName;
  final String age;
  final String gender;
  final String mobileNumber;
  final String regularMedicine;
  final List<Map<String, dynamic>> allergies;
  final String surgeyName;
  final String treatmentTaken;
  final String suregeryDetails;
  final String treatmentTakenDetails;
  List<Map<String, dynamic>>? medicines;

  FetchAddMember({
    required this.fullName,
    required this.age,
    required this.allergies,
    required this.gender,
    required this.mobileNumber,
    required this.regularMedicine,
    required this.surgeyName,
    required this.treatmentTaken,
    this.medicines,
    required this.suregeryDetails,
    required this.treatmentTakenDetails,
  });
}

class AddFamilyMemberImageEvent extends AddMemberEvent {
  final File image;

  AddFamilyMemberImageEvent({required this.image});
}
