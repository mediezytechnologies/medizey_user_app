import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Repository/Api/Profile/profile_api.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
part 'upload_user_image_event.dart';
part 'upload_user_image_state.dart';

class UploadUserImageBloc
    extends Bloc<UploadUserImageEvent, UploadUserImageState> {
  ProfileApi profileApi = ProfileApi();
  late String updoadedSuccessfully;
  UploadUserImageBloc() : super(UploadUserImageInitial()) {
    on<FetchUploadUserImage>((event, emit) async {
      emit(UploadUserImageLoading());
      try {
        updoadedSuccessfully =
            await profileApi.uploadUserImage(userImage: event.userImage);
        emit(UploadUserImageLoaded());
        Map<String, dynamic> data = jsonDecode(updoadedSuccessfully);
        GeneralServices.instance.showToastMessage(data['response']);
      } catch (error) {
        log("<<<<<<<<<<UploadUserImageError>>>>>>>>>>$error");
        emit(UploadUserImageError());
      }
    });
  }
}
