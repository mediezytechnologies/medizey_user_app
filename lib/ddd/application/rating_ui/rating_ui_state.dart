part of 'rating_ui_bloc.dart';

@freezed
class RatingUiState with _$RatingUiState {
  const factory RatingUiState({
    required double ratingValue,
    required String ratingTest,
    required int resonIndex,
   required int  likedIndex,
   required int  radioIndex
  }) = _Initial;
  factory RatingUiState.initial() => const RatingItemState(
        ratingValue: 0,
        ratingTest: "",
        resonIndex: -1,
        likedIndex: -1,
        radioIndex: -1, 
      );

 
}
