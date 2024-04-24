// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mediezy_user/Repository/Api/Suggestion/suggestion_api.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:meta/meta.dart';
part 'suggestion_event.dart';
part 'suggestion_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  late String updatedSuccessfully;
  SuggestionApi suggestionApi = SuggestionApi();
  SuggestionBloc() : super(SuggestionInitial()) {
    on<FetchSuggestions>((event, emit) async {
      emit(SuggestionLoading());
      try {
        updatedSuccessfully =
            await suggestionApi.getSuggestions(message: event.message);
        Map<String, dynamic> data = jsonDecode(updatedSuccessfully);
        // GeneralServices.instance.showToastMessage(data['message']);
        GeneralServices.instance.showSuccessMessage(event.context,data['message'],);
        emit(SuggestionLoaded());
      } catch (e) {
        print("<<<<< SUGGESTION ERROR : $e >>>>>");
        emit(SuggestionError());
      }
    });
  }
}
