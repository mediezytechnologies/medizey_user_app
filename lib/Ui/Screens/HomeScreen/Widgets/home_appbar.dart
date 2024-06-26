// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_user/Repository/Bloc/GetDoctor/GetDoctors/get_doctor_bloc.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import '../../../../ddd/application/location_controller/locationcontroller.dart';
import '../../../../ddd/application/user_location/user_location_bloc.dart';
import '../../../CommonWidgets/horizontal_spacing_widget.dart';

class HomeAappBar extends StatefulWidget {
  const HomeAappBar({
    Key? key,
    required this.isAppBar,
  }) : super(key: key);

  final double isAppBar;

  @override
  State<HomeAappBar> createState() => _HomeAappBarState();
}

class _HomeAappBarState extends State<HomeAappBar> {
  final locationController = Get.put(LocationController());
  @override
  void initState() {
    BlocProvider.of<UserLocationBloc>(context).add(
      UserLocationEvent.started(
        locationController.latitude.value.toString(),
        locationController.longitude.value.toString(),
        locationController.dist.value,
        locationController.locality.value,
        locationController.locationAdress.value,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: double.infinity,
      height: widget.isAppBar,
      color:
      //Colors.black,
       kSecondaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        log("message sfjksdfjkhdfjks");
                        locationController.fetchCountry().then(
                              (value) =>
                                  BlocProvider.of<UserLocationBloc>(context)
                                      .add(
                                UserLocationEvent.started(
                                  locationController.latitude.value.toString(),
                                  locationController.longitude.value.toString(),
                                  locationController.dist.value,
                                  locationController.locality.value,
                                  locationController.locationAdress.value,
                                ),
                              ),
                            );
                        Future.delayed(const Duration(seconds: 1), () {
                          BlocProvider.of<GetDoctorBloc>(context).add(
                            FetchGetDoctor(),
                          );
                        });
                      },
                      child: Icon(
                        Platform.isIOS
                            ? CupertinoIcons.placemark_fill
                            : Icons.location_on,
                        size: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                    const HorizontalSpacingWidget(width: 5),
                    GestureDetector(
                        onTap: () {
    log("Fetching location...");
    locationController.fetchCountry().then((_) {
      BlocProvider.of<UserLocationBloc>(context).add(
        UserLocationEvent.started(
          locationController.latitude.value.toString(),
          locationController.longitude.value.toString(),
          locationController.dist.value,
          locationController.locality.value,
          locationController.locationAdress.value,
        ),
      );
      Future.delayed(const Duration(seconds: 1), () {
        BlocProvider.of<GetDoctorBloc>(context).add(
          FetchGetDoctor(),
        );
      });
    });
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const LocationScreen(),
                        //   ),
                        // );
                      },
                      child: Obx(() {
    // if (locationControlleObx(() {
    if (locationController.loading.value) {
      return  Center(
        child: CupertinoActivityIndicator(radius: 15.r,
          color: Colors.white,
        ),
      );
    }
    if (!locationController.isLocationFetched.value) {
      return Text(
        "Tap to get location",
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      );
    }
    return Text(
      locationController.subLocality.value.isEmpty
          ? locationController.dist.value
          : locationController.subLocality.value,
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }),
                    ),
                  ],
                ),
              ),
              Image(
                image: const AssetImage(
                  "assets/icons/mediezy logo small.png",
                ),
                height: 35.h,
                width: 100.w,
              ),
            ]),
      ),
    );
  }
}
