part of 'edit_member_bloc.dart';

@immutable
sealed class EditMemberEvent {}

class FetchEditMember extends EditMemberEvent {
  final String patientId;
  final String age;
  final String fullName;
  final String gender;
  final String mobileNumber;
  final String allergyId;
  final String allegyDetails;
  final String surgeryName;
  final String treatmentName;
  final String regularMedicine;
  final File? patientImage;
  final String surgeyDetails;
  final String treatmentDetails;

  FetchEditMember(
      {required this.patientId,
      required this.age,
      required this.fullName,
      required this.gender,
      required this.allegyDetails,
      required this.allergyId,
      required this.mobileNumber,
      required this.regularMedicine,
      required this.surgeryName,
      required this.treatmentName,
      required this.patientImage,
      required this.surgeyDetails,
      required this.treatmentDetails});
}
