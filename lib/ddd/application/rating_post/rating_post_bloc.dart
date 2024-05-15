import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/rating/model/add_rating_model/add_rating_model.dart';
import '../../domain/rating/rating_repository.dart';

part 'rating_post_event.dart';
part 'rating_post_state.dart';
part 'rating_post_bloc.freezed.dart';

@injectable
class RatingPostBloc extends Bloc<RatingPostEvent, RatingPostState> {
  RatingRepository ratingRepository;
  RatingPostBloc(this.ratingRepository) : super(RatingPostState.initial()) {
    on<_RatingAddFeedBacks>((event, emit) async {
      emit(
        const RatingPostState(
            isloding: true, isError: false, message: "", status: false),
      );
      log(emit.toString());
      final addFeedbackResult = await ratingRepository.addRatingRepo(
        appointmentId: event.appointmentId!,
        rating: event.rating,
        reviewId: event.reviewId,
        doctorRecommentation: event.doctorRecommentation,
        userComments: event.userComments,
        ratingId: event.ratingId,
      );
      emit(addFeedbackResult.fold(
          (l) => state.copyWith(
                isloding: false,
                isError: true,
                message: l.message!,
                status: false,
              ), (r) {
        return state.copyWith(
          isloding: false,
          isError: false,
          message: state.message,
          status: true,
          addRatingModel: r,
        );
      }));
    });
  }
}
