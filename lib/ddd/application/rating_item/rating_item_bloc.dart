import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_item_event.dart';
part 'rating_item_state.dart';
part 'rating_item_bloc.freezed.dart';

class RatingItemBloc extends Bloc<RatingItemEvent, RatingItemState> {
  RatingItemBloc() : super(RatingItemState.initial()) {
    on<_Started>((event, emit) {
      emit(
        RatingItemState(
          ratingValue: event.ratingValue,
          ratingTest: event.ratingTest
        ),
      );
     
    });
     on<_RatingChanged>((event, emit) {
        emit(state.copyWith(ratingValue: event.ratingValue));

      });
       on<_RatingTextChanged>((event, emit) {
        emit(state.copyWith(ratingTest: event.ratingTest));
        log("rating : ${event.ratingTest}");
      });
  }
}
