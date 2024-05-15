import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/rating/model/add_rating_model/add_rating_model.dart';
import '../../domain/rating/model/get_rating_model/user_rating.dart';
import '../../domain/rating/rating_repository.dart';
part 'rating_event.dart';
part 'rating_state.dart';
part 'rating_bloc.freezed.dart';

@injectable
class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingRepository ratingRepository;
  RatingBloc(this.ratingRepository) : super(RatingState.initial()) {
    //! for ui
    on<_RatingChanged>((event, emit) {
      emit(state.copyWith(ratingValue: event.ratingValue));
    });
    on<_RatingTextChanged>((event, emit) {
      emit(state.copyWith(ratingTest: event.ratingTest));
      log("rating : ${event.ratingTest}");
    });
    on<_RatingReasonChanged>((event, emit) {
      emit(state.copyWith(reasonIndex: event.reasonIndex));
      log("rating : ${event.reasonIndex}");
    });
    on<_RatingLikeChanged>((event, emit) {
      emit(state.copyWith(likedIndex: event.likedIndex));
      log("rating : ${event.likedIndex}");
    });
    on<_RatingRadioChanged>((event, emit) {
      emit(state.copyWith(radioIndex: event.radioIndex));
      log("rating : ${event.radioIndex}");
    });

    //! for api
    on<_RatingGetFeedBacks>((event, emit) async {
      emit(state.copyWith(
        isloading: true,
        isError: false,
        message: "",
        status: false,
        userRating: [],
      ));
      log("Loading >>>>>>");
      final ratingResult =
          await ratingRepository.getRatingRepo(ratingText: event.feedback);
      emit(ratingResult.fold(
          (l) => state.copyWith(
                isloading: false,
                isError: true,
                message: l.message!,
                userRating: [],
                status: false,
              ), (r) {
        return state.copyWith(
          isloading: false,
          isError: false,
          message: state.message,
          status: state.status,
          userRating: r,
        );
      }));
    });

    // on<_RatingAddFeedBacks>((event, emit) async {
    //   emit(state.copyWith(
    //     addIsloading: true,
    //     addIsError: false,
    //     addMessage: "",
    //     addStatus: false,
    //   ));
    //   final addFeedbackResult = await ratingRepository.addRatingRepo(
    //       appointmentId: event.appointmentId,
    //       rating: event.rating,
    //    doctorRecommentation: event.doctorRecommentation,
    //       userComments: event.userComments,
    //       rating Id: event.ratingId,
    //      reviewId: event.reviewId,
    //       );

    //   emit(addFeedbackResult.fold(
    //       (l) => state.copyWith(
    //             addIsloading: false,
    //             addIsError: true,
    //             addMessage: l.message!,
    //             addStatus: false,
    //           ), (r) {
    //     return state.copyWith(
    //       addIsloading: false,
    //       addIsError: false,
    //       addMessage: state.message,
    //       addStatus: true,
    //       addRatingModel: r,
    //     );
    //   }));
    // });
  }
}
