part of 'update_medicine_bloc.dart';

@immutable
abstract class UpdateMedicineState {}

class UpdateMedicineInitial extends UpdateMedicineState {}

class UpdateMedicineLoading extends UpdateMedicineState {}

class UpdateMedicineLoaded extends UpdateMedicineState {}

class UpdateMedicineError extends UpdateMedicineState {}
