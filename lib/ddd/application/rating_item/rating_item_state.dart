part of 'rating_item_bloc.dart';

@freezed
class RatingItemState with _$RatingItemState {
  const factory RatingItemState({
    required double ratingValue,
    required String ratingTest,
  })= _Initial;
   factory RatingItemState.initial()=> RatingItemState(ratingValue: 0,ratingTest: "");
}
