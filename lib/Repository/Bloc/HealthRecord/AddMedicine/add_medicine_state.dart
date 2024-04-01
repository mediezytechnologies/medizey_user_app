part of 'add_medicine_bloc.dart';

@immutable
sealed class AddMedicineState {}

final class AddMedicineInitial extends AddMedicineState {}

class AddMedicineLoading extends AddMedicineState {}

class AddMedicineLoaded extends AddMedicineState {}

class AddMedicineError extends AddMedicineState {}
