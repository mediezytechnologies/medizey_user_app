part of 'rating_ui_bloc.dart';

@freezed
class RatingUiEvent with _$RatingUiEvent {
  const factory RatingUiEvent.ratingChanged(double ratingValue) =
      _RatingChanged;
  const factory RatingUiEvent.ratingTextChanged(String ratingTest) =
      _RatingTextChanged;
  const factory RatingUiEvent.ratingResonChanged(int resonIndex) =
      _RatingResonChanged;
       const factory RatingUiEvent.ratingLikeChanged(int likedIndex) =
      _RatingLikeChanged;
       const factory RatingUiEvent.ratingRadioChanged(int radioIndex) =
      _RatingRadioChanged;nst factory RatingUiEvent.started() = _Started;
}