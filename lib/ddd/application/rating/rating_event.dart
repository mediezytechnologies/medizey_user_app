part of 'rating_bloc.dart';

@freezed
class RatingEvent with _$RatingEvent {
  const factory RatingEvent.ratingChanged(double ratingValue) = _RatingChanged;
  const factory RatingEvent.ratingTextChanged(String ratingTest) =
      _RatingTextChanged;
  const factory RatingEvent.ratingReasonChanged(int reasonIndex) =
      _RatingReasonChanged;
  const factory RatingEvent.ratingLikeChanged(int likedIndex) =
      _RatingLikeChanged;
  const factory RatingEvent.ratingRadioChanged(int radioIndex) =
      _RatingRadioChanged;
  const factory RatingEvent.ratingGetFeedBacks(String feedback) =
      _RatingGetFeedBacks;
}
