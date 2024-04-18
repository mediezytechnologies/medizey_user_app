import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/LocationScreen/location_screen.dart';

import '../../../../ddd/application/location_controller/locationcontroller.dart';
import '../../../../ddd/application/user_location/user_location_bloc.dart';

class HomeAappBar extends StatelessWidget {
  HomeAappBar({
    super.key,
  });

  final locationController = Get.put(LocationController());
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
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 20.sp,
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
                      if (locationController.loding.value) {
                        BlocProvider.of<UserLocationBloc>(context).add(
                          UserLocationEvent.started(
                            locationController.latitude.value.toString(),
                            locationController.longitude.value.toString(),
                            locationController.dist.value,
                            locationController.locality.value,
                            locationController.locationAdress.value,
                          ),
                        );
                      }
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
              // ElevatedButton(
              //     onPressed: () {
              //       locationController.fetchCountry().then((value) =>
              //           Future.delayed(Duration(seconds: 2)).then(
              //             (value) =>
              //                 BlocProvider.of<UserLocationBloc>(context).add(
              //               UserLocationEvent.started(
              //                 locationController.latitude.value.toString(),
              //                 locationController.longitude.value.toString(),
              //                 locationController.dist.value,
              //                 locationController.locality.value,
              //                 locationController.locationAdress.value,
              //               ),
              //             ),
              //           ));
              //     },
              //     child: Text("data")),
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
