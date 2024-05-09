part of 'rating_item_bloc.dart';

@freezed
class RatingItemState with _$RatingItemState {
  const factory RatingItemState({
    required double ratingValue,
     String? ratingTest,
  })= _Initial;
   factory RatingItemState.initial()=> RatingItemState(ratingValue: 0,);
}
