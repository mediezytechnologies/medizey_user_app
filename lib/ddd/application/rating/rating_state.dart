part of 'rating_bloc.dart';

@freezed
class RatingState with _$RatingState {
   const factory RatingState({
    required double ratingValue,
    required String ratingTest,
    required int resonIndex,
   required int  likedIndex,
   required int  radioIndex
  }) = _Initial;
  factory RatingState.initial() => const RatingState(
        ratingValue: 0,
        ratingTest: "",
        resonIndex: -1,
        likedIndex: -1,
        radioIndex: -1, 
      );
}