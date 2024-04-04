part of 'add_member_bloc.dart';

@freezed
class AddMemberEvent with _$AddMemberEvent {
  const factory AddMemberEvent.started({
    required String fullName,
    required String age,
    required String mobileNumber,
    required String gender,
    required String regularMedicine,
    required String surgeryName,
    required String treatmentTaken,
    required String surgeryDetails,
    required String treatmentTakenDetails,
    required List<Map<String, dynamic>> allergies,
    List<Medicines>? medicines,
  }) = _Started;
}
