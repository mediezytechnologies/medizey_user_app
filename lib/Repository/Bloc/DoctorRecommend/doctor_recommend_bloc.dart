// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Repository/Api/DoctorRecommend/doctor_recommend_api.dart';
part 'doctor_recommend_event.dart';
part 'doctor_recommend_state.dart';

class DoctorRecommendBloc
    extends Bloc<DoctorRecommendEvent, DoctorRecommendState> {
  late String updatedSuccessfully;
  DoctorRecommendApi doctorRecommendApi = DoctorRecommendApi();
  DoctorRecommendBloc() : super(DoctorRecommendInitial()) {
    on<AddDoctorRecommentationEvent>((event, emit) async {
      emit(DoctorRecommendLoading());
      try {
        updatedSuccessfully = await doctorRecommendApi.doctorRecommend(
            doctorName: event.doctorName,
            location: event.location,
            clinicName: event.clinicName,
            specialization: event.specialization,
            phoneNumber: event.phoneNumber);
        Map<String, dynamic> data = jsonDecode(updatedSuccessfully);
        emit(
            DoctorRecommendLoaded(successMesseage: data['message'].toString()));
      } catch (e) {
        print("<<<<< SUGGESTION ERROR : $e >>>>>");
        emit(DoctorRecommendError(errorMessage: e.toString()));
      }
    });
  }
}
