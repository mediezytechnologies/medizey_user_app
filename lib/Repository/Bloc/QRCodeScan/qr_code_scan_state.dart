part of 'qr_code_scan_bloc.dart';

@immutable
sealed class QrCodeScanState {}

final class QrCodeScanInitial extends QrCodeScanState {}

class QrCodeScanLoading extends QrCodeScanState {}

class QrCodeScanLoaded extends QrCodeScanState {}

class QrCodeScanError extends QrCodeScanState {
  final String errorMessage;

  QrCodeScanError({required this.errorMessage});
}
