part of 'banner_bloc.dart';

@immutable
sealed class BannerEvent {}

class FetchBannerEvent extends BannerEvent {
  final String type;

  FetchBannerEvent({required this.type});
}
