import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/forgot_password/forgot_password_repository.dart';
import '../../domain/forgot_password/forgot_password_model/forgot_password_model.dart';
import '../../domain/forgot_password/otp_verfied_model/otp_verfied_model.dart';
import '../../domain/forgot_password/success_password_model/success_password_model.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';
part 'forgot_password_bloc.freezed.dart';

@injectable
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordRepository forgotPasswordRepository;
  ForgotPasswordBloc(this.forgotPasswordRepository)
      : super(ForgotPasswordState.initial()) {
    //* first call send email
    on<_ForgetPassword>((event, emit) async {
      emit(
          // const ForgotPasswordState(
          //   forgetPasswordisloding: true,
          //   forgetPasswordisError: false,
          //   forgetPasswordmessage: "",
          //   forgetPasswordstatus: false,
          //   otpVerfiedisloding: true,
          //   otpVerfiedisError: false,
          //   otpVerfiedmessage: "",
          //   otpVerfiedstatus: false,
          //   successPasswordisloding: true,
          //   successPasswordisError: false,
          //   successPasswordmessage: "",
          //   successPasswordstatus: false,
          // ),
          state.copyWith(
        forgetPasswordisloding: true,
        forgetPasswordisError: false,
        forgetPasswordmessage: "",
        forgetPasswordstatus: false,
      ));
      final forgotPasswordResult =
          await forgotPasswordRepository.forgotPasswordRepo(event.email);
      emit(
        forgotPasswordResult.fold(
            (l) => state.copyWith(
                  forgetPasswordisloding: false,
                  forgetPasswordisError: true,
                  forgetPasswordmessage: l.message!,
                  forgetPasswordstatus: false,
                ), (r) {
          return state.copyWith(
            forgetPasswordisloding: false,
            forgetPasswordisError: false,
            forgetPasswordmessage: state.forgetPasswordmessage,
            forgetPasswordstatus: true,
            forgotPasswordModel: r,
          );
        }),
      );
    });

    //* second call otp verfication

    on<_OtpVerification>((event, emit) async {
      emit(state.copyWith(
        otpVerfiedisloding: true,
        otpVerfiedisError: false,
        otpVerfiedmessage: "",
        otpVerfiedstatus: false,
      ));
      final otpVerificationResult =
          await forgotPasswordRepository.otpVerficationRepo(event.otp);
      emit(
        otpVerificationResult.fold(
            (l) => state.copyWith(
                  otpVerfiedisloding: false,
                  otpVerfiedisError: true,
                  otpVerfiedmessage: l.message!,
                  otpVerfiedstatus: false,
                ), (r) {
          return state.copyWith(
            otpVerfiedisloding: false,
            otpVerfiedisError: false,
            otpVerfiedmessage: state.otpVerfiedmessage,
            otpVerfiedstatus: true,
            otpVerfiedModel: r,
          );
        }),
      );
    });

    //* last call reset password

    on<_SuccessPassword>((event, emit) async {
      emit(state.copyWith(
        successPasswordisloding: true,
        successPasswordisError: false,
        successPasswordmessage: "",
        successPasswordstatus: false,
      ));
      final succesPasswordResult =
          await forgotPasswordRepository.successPasswordRepo(event.newPassword);
      emit(
        succesPasswordResult.fold(
            (l) => state.copyWith(
                  successPasswordisloding: false,
                  successPasswordisError: true,
                  successPasswordmessage: l.message!,
                  successPasswordstatus: false,
                ), (r) {
          return state.copyWith(
            successPasswordisloding: false,
            successPasswordisError: false,
            successPasswordmessage: state.successPasswordmessage,
            successPasswordstatus: true,
            successPasswordModel: r,
          );
        }),
      );
    });
  }
}
