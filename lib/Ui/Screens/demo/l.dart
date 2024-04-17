// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';



// Future<Position> _getGeoLocationPosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     await Geolocator.openLocationSettings();
//     return Future.error('Location services are disabled.');
//   }
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permissions are denied');
//     }
//   }
//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }

//   return await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high);
// }

// class PostCodeService {
//   final locationController = Get.put(LocationController());
//   static Future<dynamic> witnessService(String postCode) async {
//     try {
//       var response =
//           await Dio().post('http://www.postalpincode.in/api/pincode/$postCode');
//       String api = 'http://www.postalpincode.in/api/pincode/$postCode';
//       log("api value : $api");
//       if (response.statusCode == 200) {
//         final jsonResponse = json.decode(response.data);

//         if (jsonResponse['Status'] == 'Error') {
//           log(jsonResponse['Status']);
//           // Show a snackbar if the PIN code is not valid
//         } else {
//           log("error");
//           // Parse and display details if the PIN code is valid
//           //   final postOfficeArray = jsonResponse['PostOffice'] as List;
//           // final obj = postOfficeArray[0];

//           // final district = obj['District'];
//           // final state = obj['State'];
//           // final country = obj['Country'];

//           // setState(() {
//           //   pinCodeDetails =
//           //       'Details of pin code are:\nDistrict: $district\nState: $state\nCountry: $country';
//           // });
//         }
//       } else {
//         log("error");
//       }
//     } on DioError catch (e) {
//       print("Dio error");
//       print("${e.error}==ii");
//       print("${e.message}==ieeei");
//       print("${e.response!.data}==errors");
//       print(e.response!.statusMessage);

//       if (e.type == DioException) {
//         return "No internet connection";
//       }

//       if (e.response != null) {
//         return e.response!.data['message'];
//       }
//       return "flase";
//     } catch (e) {
//       print(e);
//     } on SocketException {
//       throw "no net work";
//     }
//     return null;
//   }
// }

// class Mlo extends StatelessWidget {
//   const Mlo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(LocationController());
//     return Scaffold(
//       appBar: AppBar(title: Obx(() {
//         if (controller.country.value.isEmpty) {
//           CircularProgressIndicator();
//         }
//         return Text('Current Countr: ${controller.country.value}');
//       })),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Get.find<LocationController>().fetchCountry();
//           },
//           child: Text('Fetch Country'),
//         ),
//       ),
//     );
//   }
// }
