import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/error_model/error_model.dart';
import '../../domain/fcmToken/fcmToken_service.dart';
part 'notificatio_token_event.dart';
part 'notificatio_token_state.dart';
part 'notificatio_token_bloc.freezed.dart';

@injectable
class NotificatioTokenBloc
    extends Bloc<NotificatioTokenEvent, NotificatioTokenState> {
  final FccmTokenRepo fccmTokenRepo;
  NotificatioTokenBloc(this.fccmTokenRepo)
      : super(NotificatioTokenState.initial()) {
    on<_Started>((event, emit) async {
      emit(
        const NotificatioTokenState(
            isloding: true, isError: false, message: "", status: false),
      );
      log(emit.toString());
      final fcmTokenResult = await fccmTokenRepo.fcmTokenData();
      final state = fcmTokenResult.fold((ErrorModel error) {
        return NotificatioTokenState(
            isloding: false,
            isError: true,
            message: error.message!,
            status: false);
      }, (r) {
        return NotificatioTokenState(
            isloding: false,
            isError: false,
            message: r.message!,
            status: r.status!);
      });
           emit(state);
    });
  }
}
