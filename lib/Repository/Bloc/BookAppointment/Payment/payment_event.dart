part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class PassPaymentEvent extends PaymentEvent {
  final String razorPaymentId;
  final String tokenId;
  final String currency;
  final String contactNumber;
  final String email;
  final double amount;

  PassPaymentEvent(
      {required this.razorPaymentId,
      required this.tokenId,
      required this.currency,
      required this.contactNumber,
      required this.email,
      required this.amount});
}
