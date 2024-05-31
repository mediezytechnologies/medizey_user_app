import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/forgot_password/forgot_password_repository.dart';
import '../../../domain/forgot_password/otp_verfied_model/otp_verfied_model.dart';
part 'forget_password_two_event.dart';
part 'forget_password_two_state.dart';
part 'forget_password_two_bloc.freezed.dart';

@injectable
class ForgetPasswordTwoBloc
    extends Bloc<ForgetPasswordTwoEvent, ForgetPasswordTwoState> {
  ForgotPasswordRepository forgotPasswordRepository;
  ForgetPasswordTwoBloc(this.forgotPasswordRepository)
      : super(ForgetPasswordTwoState.initial()) {
    on<_OtpVerification>((event, emit) async {
      emit(
        const ForgetPasswordTwoState(
            isloding: true, isError: false, message: "", status: false),
      );
      final otpVerificationResult =
          await forgotPasswordRepository.otpVerficationRepo(event.otp);
      emit(
        otpVerificationResult.fold(
            (l) => state.copyWith(
                  isloding: false,
                  isError: true,
                  message: l.message!,
                  status: false,
                ), (r) {
          return state.copyWith(
            isloding: false,
            isError: false,
            message: state.message,
            status: true,
            otpVerfiedModel: r,
          );
        }),
      );
    });
  }
}
