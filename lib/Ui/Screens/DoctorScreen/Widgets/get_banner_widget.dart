import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Banner/banner_model.dart';
import 'package:mediezy_user/Repository/Bloc/banner/banner_bloc.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_screen_loading_widgets.dart';

class GetBannerWidget extends StatefulWidget {
  const GetBannerWidget({super.key});

  @override
  State<GetBannerWidget> createState() => _GetBannerWidgetState();
}

class _GetBannerWidgetState extends State<GetBannerWidget> {
  late BannerModel bannerModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 120.h,
        child: BlocBuilder<BannerBloc, BannerState>(
          builder: (context, state) {
            if (state is BannerLoading) {
              return homeBannerLoadingWidget();
            }
            if (state is BannerError) {
              return const Center(
                child: Image(
                  image:
                      AssetImage("assets/images/something went wrong-01.png"),
                ),
              );
            }
            if (state is BannerLoaded) {
              bannerModel = BlocProvider.of<BannerBloc>(context).bannerModel;
              return Swiper(
                autoplay: true,
                itemCount: bannerModel.bannerImages!.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 6.w, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FancyShimmerImage(
                        boxFit: BoxFit.contain,
                        errorWidget: const Image(
                          image: AssetImage("assets/icons/no image.png"),
                        ),
                        imageUrl: bannerModel.bannerImages![index],
                      ),
                    ),
                  );
                }),
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.grey[200],
                      activeColor: Colors.red[400],
                      size: 8.sp,
                      activeSize: 8.sp),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}