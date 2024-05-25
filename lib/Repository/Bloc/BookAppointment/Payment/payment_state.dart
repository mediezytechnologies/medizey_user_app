part of 'payment_bloc.dart';

@immutable
abstract class PaymentState {}

final class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentLoaded extends PaymentState {
  final PaymentModel paymentModel;

  PaymentLoaded({required this.paymentModel});
}

class PaymentError extends PaymentState {
  final String errorMessage;

  PaymentError({required this.errorMessage});
}
