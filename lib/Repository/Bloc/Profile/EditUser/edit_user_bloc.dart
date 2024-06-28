import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Model/Profile/edit_user_model.dart';
import 'package:mediezy_user/Repository/Api/Profile/profile_api.dart';
part 'edit_user_event.dart';
part 'edit_user_state.dart';

class EditUserBloc extends Bloc<EditUserEvent, EditUserState> {
  late EditUserModel editUserModel;
  ProfileApi profileApi = ProfileApi();
  EditUserBloc() : super(EditUserInitial()) {
    on<FetchEditUser>((event, emit) async {
      emit(EditUserDetailsLoading());
      try {
        editUserModel = await profileApi.editUserDetails(
            firstName: event.firstName,
            secondName: event.secondName,
            email: event.email,
            mobileNo: event.mobileNo,
            location: event.location,
            gender: event.gender,
            dob: event.dob);
        emit(EditUserDetailsLoaded());
      } catch (error) {
        print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + error.toString());
        emit(EditUserDetailsError());
      }
    });
  }
}
