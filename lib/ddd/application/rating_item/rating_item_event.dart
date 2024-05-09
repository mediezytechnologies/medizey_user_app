part of 'rating_item_bloc.dart';

@freezed
class RatingItemEvent with _$RatingItemEvent {
  // const factory RatingItemEvent.started({
  //   required double ratingValue,
  //  required  String ratingTest,
  // }) = _Started;
   const factory RatingItemEvent.ratingChanged(double ratingValue) = _RatingChanged;
      const factory RatingItemEvent.ratingTextChanged(String ratingTest) = _RatingTextChanged;
}