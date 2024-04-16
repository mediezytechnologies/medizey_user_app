import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';


class LocationController extends GetxController {
  var country    =''.obs;

  @override
  void onInit() {
    fetchCountry();
    super.onInit();
  }

  void fetchCountry() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude);
      Placemark place = placemarks[0];
      country.value = place.locality!;
      update();
    } catch (e) {
      print('Error fetching location: $e');
    }
  }
}


class Mlo extends StatelessWidget {
  const Mlo({super.key});



  @override
  Widget build(BuildContext context) {

    final controller =Get.put(LocationController());
    return  Scaffold(
        appBar: AppBar(
          title: Obx(() {

            if (controller.country.value.isEmpty) {
            CircularProgressIndicator();
            }
return Text('Current Countr: ${controller.country.value}');
          }
          
          
          
            )    ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Get.find<LocationController>().fetchCountry();
            },
            child: Text('Fetch Country'),
          ),
        ),
     
    );
  }
}