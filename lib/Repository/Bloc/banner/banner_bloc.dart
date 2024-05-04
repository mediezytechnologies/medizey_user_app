import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Model/Banner/banner_model.dart';
import 'package:mediezy_user/Repository/Api/Banner/banner_api.dart';
part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  BannerApi bannerApi = BannerApi();

  BannerBloc() : super(BannerInitial()) {
    on<FetchBannerEvent>((event, emit) async {
      emit(BannerLoading());
      try {
        final bannerModel = await bannerApi.getBanner(type: event.type);
        emit(BannerLoaded(bannerModel: bannerModel));
      } catch (error) {
        print("banner error");
        emit(BannerError());
      }
    });
  }
}
