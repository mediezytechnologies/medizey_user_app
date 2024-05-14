part of 'rating_post_bloc.dart';

@freezed
class RatingPostEvent with _$RatingPostEvent {
  const factory RatingPostEvent.ratingAddFeedBacks(
      String appointmentId,
      String rating,
      String reviewId,
      int? doctorRecommentation,
      int? userComments,
      String? ratingId,
      ) = _RatingAddFeedBacks;
}