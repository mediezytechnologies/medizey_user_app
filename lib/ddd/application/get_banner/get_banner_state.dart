part of 'get_banner_bloc.dart';

// @freezed
// class GetBannerState with _$GetBannerState {
//   const factory GetBannerState(
//       {required bool isloding,
//       required bool isError,
//       required String message,
//       required bool status,
//       GetBannerModel? model}) = _Initial;

//   factory GetBannerState.initial() => const GetBannerState(
//         isloding: false,
//         isError: false,
//         message: '',
//         status: false,
//       );
// }

@freezed
class GetBannerState with _$GetBannerState {
  const factory GetBannerState({
    required bool isLoading,
    required bool isError,
    required String message,
    required bool status,
    required bool cached,
    GetBannerModel? model,
  }) = _Initial;

  factory GetBannerState.initial() => const GetBannerState(
        isLoading: false,
        isError: false,
        message: '',
        status: false,
        cached: false,
      );
}
