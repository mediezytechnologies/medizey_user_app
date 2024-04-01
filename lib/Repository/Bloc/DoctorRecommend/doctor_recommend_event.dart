part of 'doctor_recommend_bloc.dart';

@immutable
sealed class DoctorRecommendEvent {}

class AddDoctorRecommentationEvent extends DoctorRecommendEvent {
  final String doctorName;
  final String location;
  final String clinicName;
  final String specialization;
  final String phoneNumber;

  AddDoctorRecommentationEvent(
      {required this.doctorName,
      required this.location,
      required this.clinicName,
      required this.specialization,
      required this.phoneNumber});
}
