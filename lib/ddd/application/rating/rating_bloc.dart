import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_event.dart';
part 'rating_state.dart';
part 'rating_bloc.freezed.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingBloc() : super(RatingState.initial()) {
    on<_RatingChanged>((event, emit) {
      emit(state.copyWith(ratingValue: event.ratingValue));
    });
    on<_RatingTextChanged>((event, emit) {
      emit(state.copyWith(ratingTest: event.ratingTest));
      log("rating : ${event.ratingTest}");
    });
    on<_RatingResonChanged>((event, emit) {
      emit(state.copyWith(resonIndex: event.resonIndex));
      log("rating : ${event.resonIndex}");
    });
    on<_RatingLikeChanged>((event, emit) {
      emit(state.copyWith(likedIndex: event.likedIndex));
      log("rating : ${event.likedIndex}");
    });
    on<_RatingRadioChanged>((event, emit) {
      emit(state.copyWith(radioIndex: event.radioIndex));
      log("rating : ${event.radioIndex}");
    });
  }
}
