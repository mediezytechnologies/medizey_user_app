part of 'update_medicine_bloc.dart';

@immutable
sealed class UpdateMedicineEvent {}

class FetchUpdateMedicine extends UpdateMedicineEvent {
  final String parientId;
  final String medicineId;
  final String illnessName;
  final String medicineName;

  FetchUpdateMedicine(
      {required this.parientId,
      required this.medicineId,
      required this.illnessName,
      required this.medicineName});
}
