// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';
import 'package:mediezy_user/Model/GetTokens/GetTokenModel.dart';
import 'package:mediezy_user/Repository/Api/GetToken/get_token_api.dart';
import 'package:meta/meta.dart';
part 'get_token_event.dart';
part 'get_token_state.dart';

class GetTokenBloc extends Bloc<GetTokenEvent, GetTokenState> {
  late GetTokenModel getTokenModel;
  GetTokenApi getTokenApi = GetTokenApi();
  GetTokenBloc() : super(GetTokenInitial()) {
    on<FetchToken>((event, emit) async {
      emit(GetTokenLoading());
      try {
        getTokenModel = await getTokenApi.getTokens(
            doctorId: event.doctorId,
            clinicId: event.hospitalId,
            date: event.date);
        emit(GetTokenLoaded());
      } catch (error) {
        print("<<<<< GET TOKEN ERROR : $error >>>>>");
        emit(GetTokenError(errorMessage: error.toString()));
      }
    });
  }
}
