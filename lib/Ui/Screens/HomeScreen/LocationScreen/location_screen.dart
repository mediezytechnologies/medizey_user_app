import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_user/ddd/application/location_controller/locationcontroller.dart';

import '../../../CommonWidgets/horizontal_spacing_widget.dart';
import '../../../CommonWidgets/vertical_spacing_widget.dart';
import '../../../Consts/app_colors.dart';
import '../../../Data/app_datas.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  //final TextEditingController locationController = TextEditingController();
  final lController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Location"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
              // child: TextFormField(
              //   cursorColor: kMainColor,
              // //  controller: locationController,
              //   keyboardType: TextInputType.text,
              //   textInputAction: TextInputAction.next,
              //   onChanged: (newValue) {},
              //   decoration: InputDecoration(
              //     suffixIcon: Icon(
              //       IconlyLight.search,
              //       color: kMainColor,
              //     ),
              //     hintStyle: TextStyle(fontSize: 15.sp, color: kSubTextColor),
              //     hintText: "Search Location",
              //     filled: true,
              //     fillColor: kCardColor,
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(20),
              //       borderSide: BorderSide.none,
              //     ),
              //   ),
              // ),
            ),
            const VerticalSpacingWidget(height: 10),
            GestureDetector(
              onTap: () {
                // lController.fetchCountry().then(
                //                         (value) =>
                //                             BlocProvider.of<UserLocationBloc>(
                //                                     context)
                //                                 .add(
                //                           UserLocationEvent.started(
                //                             lController.latitude.value
                //                                 .toString(),
                //                             lController.longitude.value
                //                                 .toString(),
                //                             lController.dist.value,
                //                             lController.locality.value,
                //                             lController
                //                                 .locationAdress.value,
                //                           ),
                //                         ),
                //                       );
              },
              child: Row(
                children: [
                  const Icon(Icons.my_location),
                  const HorizontalSpacingWidget(width: 10),
                  Text(
                    "Use current location",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const VerticalSpacingWidget(height: 10),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: locations.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey.shade300,
                ),
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: kMainColor,
                    ),
                    title: Text(locations[index]),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
