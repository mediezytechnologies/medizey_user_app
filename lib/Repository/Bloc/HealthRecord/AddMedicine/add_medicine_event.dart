part of 'add_medicine_bloc.dart';

@immutable
sealed class AddMedicineEvent {}

class FetchAddMedicineEvent extends AddMedicineEvent {
  final String medicineName;
  final String illnessName;

  FetchAddMedicineEvent(
      {required this.medicineName, required this.illnessName});
}
