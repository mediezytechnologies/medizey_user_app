import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/forgot_password/forgot_password_model/forgot_password_model.dart';
import '../../../domain/forgot_password/forgot_password_repository.dart';
part 'forget_password_first_event.dart';
part 'forget_password_first_state.dart';
part 'forget_password_first_bloc.freezed.dart';

@injectable
class ForgetPasswordFirstBloc
    extends Bloc<ForgetPasswordFirstEvent, ForgetPasswordFirstState> {
  ForgotPasswordRepository forgotPasswordRepository;
  ForgetPasswordFirstBloc(this.forgotPasswordRepository)
      : super(ForgetPasswordFirstState.initial()) {
    on<_ForgetPassword>((event, emit) async {
      emit(
        const ForgetPasswordFirstState(
            isloding: true, isError: false, message: "", status: false),
      );
      final forgotPasswordResult =
          await forgotPasswordRepository.forgotPasswordRepo(event.email);
      emit(
        forgotPasswordResult.fold(
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
            forgotPasswordModel: r,
          );
        }),
      );
    });
  }
}
