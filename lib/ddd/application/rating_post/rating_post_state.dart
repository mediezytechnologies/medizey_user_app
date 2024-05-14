part of 'rating_post_bloc.dart';

@freezed
class RatingPostState with _$RatingPostState {
  const factory RatingPostState(
    {
    required bool isloding,
     AddRatingModel? addRatingModel,
    required bool isError,
    required String message,
    required bool status,
  }

   
  ) = _Initial;
  factory RatingPostState.initial() => const RatingPostState(
      isloding: false, isError: false, message: '', status: false);

}
