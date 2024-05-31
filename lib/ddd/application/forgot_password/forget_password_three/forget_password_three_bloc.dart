import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/forgot_password/success_password_model/success_password_model.dart';
import '../../../domain/forgot_password/forgot_password_repository.dart';
part 'forget_password_three_event.dart';
part 'forget_password_three_state.dart';
part 'forget_password_three_bloc.freezed.dart';

@injectable
class ForgetPasswordThreeBloc
    extends Bloc<ForgetPasswordThreeEvent, ForgetPasswordThreeState> {
  ForgotPasswordRepository forgotPasswordRepository;
  ForgetPasswordThreeBloc(this.forgotPasswordRepository)
      : super(ForgetPasswordThreeState.initial()) {
    on<_SuccessPassword>((event, emit) async {
      emit(
        const ForgetPasswordThreeState(
            isloding: true, isError: false, message: "", status: false),
      );
      final successPasswordResult =
          await forgotPasswordRepository.successPasswordRepo(event.newPassword);
      emit(
        successPasswordResult.fold(
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
            successPasswordModel: r,
          );
        }),
      );
    });
  }
}
