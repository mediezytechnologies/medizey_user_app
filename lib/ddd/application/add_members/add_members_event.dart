part of 'add_members_bloc.dart';

@freezed
class AddMembersEvent with _$AddMembersEvent {
  const factory AddMembersEvent.started(
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