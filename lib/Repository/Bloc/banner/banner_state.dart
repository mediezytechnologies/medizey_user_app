part of 'banner_bloc.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}


class BannerLoading extends BannerState {}

class BannerLoaded extends BannerState {}

class BannerError extends BannerState {}
