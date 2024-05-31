part of 'rating_post_bloc.dart';

@freezed
class RatingPostEvent with _$RatingPostEvent {
  const factory RatingPostEvent.ratingAddFeedBacks(
    int appointmentId,
    double rating,
    int? reviewId,
    int? doctorRecommentation,
    int? userComments,
    int? ratingId,
    String? otherComment,
  ) = _RatingAddFeedBacks;
}
