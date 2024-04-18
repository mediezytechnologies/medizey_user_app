
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/LocationScreen/location_screen.dart';

import '../../../../ddd/application/location_controller/locationcontroller.dart';
import '../../../../ddd/application/user_location/user_location_bloc.dart';
import '../../../CommonWidgets/horizontal_spacing_widget.dart';

class HomeAappBar extends StatefulWidget {
  const HomeAappBar({super.key});

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
      duration: const Duration(microseconds: 5000),
      width: double.infinity,
      height: size.height * .10,
      color: const Color(0xFF4cb499),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding:    EdgeInsets.only(bottom: 10.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 15.sp,
                      color: Colors.white,
                    ),
                    const HorizontalSpacingWidget(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LocationScreen(),
                          ),
                        );
                      },
                      child: Obx(() {
                        return Text(
                          locationController.subLocality.value,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
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
              //const HorizontalSpacingWidget(width: 10)
            ]),
      ),
    );
  }
}