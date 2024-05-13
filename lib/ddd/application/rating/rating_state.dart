part of 'rating_bloc.dart';

@freezed
class RatingState with _$RatingState {
  const factory RatingState(
      {required bool isloading,
      required bool isError,
      required String message,
      required bool status,
      required double ratingValue,
      required String ratingTest,
      required List<UserRating> userRating,
      required int reasonIndex,
      required int likedIndex,
      required int radioIndex}) = _Initial;
  factory RatingState.initial() => const RatingState(
      isloading: false,
      isError: false,
      message: '',
      status: false,
      ratingValue: 0,
      ratingTest: "",
      reasonIndex: -1,
      likedIndex: -1,
      radioIndex: -1,
      userRating: []);
}
