import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/error_model/error_model.dart';
import '../../domain/firebase_login/firebase_login_api_impl.dart';
import '../../domain/firebase_login/model/firebase_login_model/firebase_login_model.dart';
part 'firebase_login_event.dart';
part 'firebase_login_state.dart';
part 'firebase_login_bloc.freezed.dart';

@injectable
class FirebaseLoginBloc extends Bloc<FirebaseLoginEvent, FirebaseLoginState> {
  final AddFirebaseLogin addFirebaseLogin;
  FirebaseLoginBloc(this.addFirebaseLogin)
      : super(FirebaseLoginState.initial()) {
    on<_Started>((event, emit) async {
      emit(
        FirebaseLoginState(
            isloding: true, isError: false, message: "", status: false),
      );
      log(emit.toString());
      final firebaseLoginResult =
          await addFirebaseLogin.addFirebaseLogin(event.mobileNumber);

      final state = firebaseLoginResult.fold((ErrorModel error) {
        return FirebaseLoginState(
            isloding: false,
            isError: true,
            message: error.message!,
            status: false);
      }, (FirebaseLoginModel? success) {
        return FirebaseLoginState(
            isloding: false,
            isError: false,
            message: success!.response!,
            status: success.status!);
      });
      emit(state);
    });
  }
}
