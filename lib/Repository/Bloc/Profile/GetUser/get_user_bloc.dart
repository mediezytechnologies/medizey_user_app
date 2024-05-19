import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Model/Profile/get_user_model.dart';
import 'package:mediezy_user/Repository/Api/Profile/profile_api.dart';
part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  late GetUserModel getUserModel;
  ProfileApi profileApi = ProfileApi();
  GetUserBloc() : super(GetUserInitial()) {
    on<FetchUserDetails>((event, emit) async {
      emit(GetUserDetailsLoading());
      try {
        getUserModel = await profileApi.getUserDetails();
        emit(GetUserDetailsLoaded());
      } catch (e) {
        log("Error>>>>>>>>>>>>>><<<<<<<<<<<<<<>>>>>>>>>>>$e");
        emit(GetUserDetailsError());
      }
    });
  }
}
