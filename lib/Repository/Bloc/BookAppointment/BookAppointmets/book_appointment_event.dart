part of 'book_appointment_bloc.dart';

@immutable
abstract class BookAppointmentEvent {}

class PassBookAppointMentEvent extends BookAppointmentEvent {
  final String patientName;
  final String doctorId;
  final String clinicId;
  final String date;
  final String whenitcomes;
  final String whenitstart;
  final String tokenTime;
  final String tokenNumber;
  final String gender;
  final String age;
  final String mobileNo;
  final String bookingType;
  final List<String> appoinmentfor1;
  final List<int> appoinmentfor2;
  final String patientId;
  final String sheduleType;

  PassBookAppointMentEvent(
      {required this.patientName,
      required this.doctorId,
      required this.clinicId,
      required this.date,
      required this.whenitcomes,
      required this.whenitstart,
      required this.tokenTime,
      required this.tokenNumber,
      required this.gender,
      required this.age,
      required this.mobileNo,
      required this.bookingType,
      required this.appoinmentfor1,
      required this.appoinmentfor2,
      required this.patientId,
      required this.sheduleType});
}
