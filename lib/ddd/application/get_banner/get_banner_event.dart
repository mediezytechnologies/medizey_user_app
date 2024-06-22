part of 'get_banner_bloc.dart';

@freezed
class GetBannerEvent with _$GetBannerEvent {
  const factory GetBannerEvent.fetchBanner(String bannerId) = _FetchBanner;
}