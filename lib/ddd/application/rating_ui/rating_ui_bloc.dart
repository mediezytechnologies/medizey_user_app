import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_ui_event.dart';
part 'rating_ui_state.dart';
part '../bloc/rating_ui_bloc.freezed.dart';

class RatingUiBloc extends Bloc<RatingUiEvent, RatingUiState> {
  RatingUiBloc() : super(RatingUiState.initial()) {
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
        on<_RatingResonChanged>((event, emit) {
        emit(state.copyWith(: event.resonIndex));
        log("rating : ${event.resonIndex}");
      });
        on<_RatingResonChanged>((event, emit) {
        emit(state.copyWith(resonIndex: event.resonIndex));
        log("rating : ${event.resonIndex}");
      });
  }
}
