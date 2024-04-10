part of 'edit_member_bloc.dart';

@freezed
class EditMemberEvent with _$EditMemberEvent {
  const factory EditMemberEvent.started(
    String patientId,
    String fullName,
    String age,
    String mobileNumber,
    String gender,
    String regularMedicine,
    String surgeryName,
    String treatmentTaken,
    String surgeryDetails,
    String treatmentTakenDetails,
    BuildContext context,
    List<Allergy>? allergies,
    List<Medicine>? medicines,
  ) = _Started;
}
