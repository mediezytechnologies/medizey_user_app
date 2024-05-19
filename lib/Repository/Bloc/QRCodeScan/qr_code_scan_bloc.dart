import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Model/QRScanModel/qr_scan_model.dart';
import 'package:mediezy_user/Repository/Api/QRCode/qr_code_api.dart';
part 'qr_code_scan_event.dart';
part 'qr_code_scan_state.dart';

class QrCodeScanBloc extends Bloc<QrCodeScanEvent, QrCodeScanState> {
  QRCodeApi qRCodeApi = QRCodeApi();
  late QRCodeModel qRCodeModel;
  QrCodeScanBloc() : super(QrCodeScanInitial()) {
    on<CheckQRCodeScan>((event, emit) async {
      emit(QrCodeScanLoading());
      try {
        qRCodeModel = await qRCodeApi.qrCodeScan(
            patientId: event.patientId,
            reachedStaus: event.reachedStatus,
            tokenId: event.tokenId);
        emit(QrCodeScanLoaded());
      } catch (e) {
        emit(
          QrCodeScanError(
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
