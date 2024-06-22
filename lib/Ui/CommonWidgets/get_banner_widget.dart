// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_screen_loading_widgets.dart';
// import 'package:card_swiper/card_swiper.dart';
// import '../../ddd/application/get_banner/get_banner_bloc.dart';
// import '../Consts/app_colors.dart';

// class GetBannerWidget extends StatefulWidget {
//   const GetBannerWidget({super.key});

//   @override
//   State<GetBannerWidget> createState() => _GetBannerWidgetState();
// }

// class _GetBannerWidgetState extends State<GetBannerWidget> {
//   @override
//   void initState() {
//     BlocProvider.of<GetBannerBloc>(context)
//         .add(const GetBannerEvent.fetchBanner("3"));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 120.h,
//           child: BlocBuilder<GetBannerBloc, GetBannerState>(
//             builder: (context, state) {
//               if (state.status) {
//                 return homeBannerLoadingWidget();
//               }
//               if (state.isError) {
//                 return Center(
//                   child: Text(state.message),
//                 );
//               }
//               log("initial length ${state.model!.bannerImages!.length}");
//               return Swiper(
//                 autoplay: true,
//                 itemCount: state.model!.bannerImages!.length,
//                 itemBuilder: ((context, index) {
//                   return Padding(
//                     padding: EdgeInsets.fromLTRB(0, 0, 6.w, 0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10.r),
//                       child: Image(
//                         image: NetworkImage(
//                           state.model!.bannerImages![index],
//                         ),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   );
//                 }),
//                 pagination: SwiperPagination(
//                   alignment: Alignment.bottomCenter,
//                   builder: DotSwiperPaginationBuilder(
//                       color: Colors.grey[200],
//                       activeColor: kMainColor,
//                       size: 8.sp,
//                       activeSize: 8.sp),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_screen_loading_widgets.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../ddd/application/get_banner/get_banner_bloc.dart';
import '../Consts/app_colors.dart';

class GetBannerWidget extends StatefulWidget {
  const GetBannerWidget({super.key});

  @override
  State<GetBannerWidget> createState() => _GetBannerWidgetState();
}

class _GetBannerWidgetState extends State<GetBannerWidget> {
  @override
  void initState() {
    super.initState();
    _fetchBannerData();
  }

  void _fetchBannerData() {
    final bannerBloc = context.read<GetBannerBloc>();
    if (!bannerBloc.state.cached || bannerBloc.state.model == null) {
      bannerBloc.add(const GetBannerEvent.fetchBanner("3"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120.h,
          child: BlocBuilder<GetBannerBloc, GetBannerState>(
            builder: (context, state) {
              if (state.isLoading) {
                return homeBannerLoadingWidget();
              }
              if (state.isError) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state.model == null ||
                  state.model!.bannerImages == null ||
                  state.model!.bannerImages!.isEmpty) {
                return const Center(
                  child: Text('No banner images available'),
                );
              }
              log("Banner images length: ${state.model!.bannerImages!.length}");
              return Swiper(
                autoplay: true,
                itemCount: state.model!.bannerImages!.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 6.w, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image(
                        image: NetworkImage(
                          state.model!.bannerImages![index],
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.grey[200],
                      activeColor: kMainColor,
                      size: 8.sp,
                      activeSize: 8.sp),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
