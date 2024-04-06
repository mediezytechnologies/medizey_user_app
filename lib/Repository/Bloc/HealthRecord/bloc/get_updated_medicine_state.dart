import 'package:flutter/material.dart';
import 'package:mediezy_user/Model/HealthRecord/GetUpdatedMedicine/get_updated_medicine_model.dart';

@immutable
sealed class GetUpdatedMedicineState {}

final class GetUpdatedMedicine extends GetUpdatedMedicineState {}

class GetUpdatedMedicineLoading extends GetUpdatedMedicineState {}

class GetUpdatedMedicineLoaded extends GetUpdatedMedicineState {
  final GetUpdatedMedicineModel getUpdatedMedicineModel;

  GetUpdatedMedicineLoaded({required this.getUpdatedMedicineModel});
}

class GetUpdatedMedicineError extends GetUpdatedMedicineState {
  final String errorMessage;

  GetUpdatedMedicineError({required this.errorMessage});
}
