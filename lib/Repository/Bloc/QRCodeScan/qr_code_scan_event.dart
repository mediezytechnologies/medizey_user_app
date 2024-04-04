part of 'qr_code_scan_bloc.dart';

@immutable
sealed class QrCodeScanEvent {}

class CheckQRCodeScan extends QrCodeScanEvent {
  final String patientId;
  final String reachedStatus;
  final String tokenId;

  CheckQRCodeScan(
      {required this.patientId,
      required this.reachedStatus,
      required this.tokenId});
}
