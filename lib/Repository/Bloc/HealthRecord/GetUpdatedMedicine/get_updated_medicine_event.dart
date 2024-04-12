import 'package:flutter/material.dart';

@immutable
sealed class GetUpdatedMedicineEvent {}

class GetFetchUpdatedMedicineEvent extends GetUpdatedMedicineEvent {
  final String patientId;

  GetFetchUpdatedMedicineEvent({required this.patientId});
}
