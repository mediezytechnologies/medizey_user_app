part of 'delete_medicine_bloc.dart';

@immutable
sealed class DeleteMedicineEvent {}


class FetchDeleteMedicineEvent extends DeleteMedicineEvent{
  final String medicineId;
  final String patientId;

  FetchDeleteMedicineEvent({required this.medicineId, required this.patientId});
}
