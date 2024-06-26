import 'dart:developer';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mediezy_user/ddd/infrastructure/location_service/location_service.dart';

import '../../domain/location_model/location_model.dart';

class LocationController extends GetxController {
  Rx<LocationModel> allLocation = LocationModel().obs;
  RxBool loding = true.obs;
  var isLoading =true .obs;
   RxBool isLocationFetched = false.obs;

  String location = 'Null, Press Button';
  var address = "".obs;
  var street = "".obs;
  var locality = "".obs;
  var subLocality = "".obs;
  var country = "".obs;
  var name = "".obs;
  var postCode = ''.obs;
  var dist = ''.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var locationAdress = ''.obs;

  @override
  void onInit() {
    fetchCountry();
    super.onInit();
  }

  //===========================//
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  //geocoding //==========
  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    log("pls====: ${placemarks.toString()}");
    log("pls lo====: ${placemarks.last.locality.toString()}");
    Placemark place = placemarks[0];

    String? thoroughfare = place.thoroughfare == ""
        ? placemarks.last.thoroughfare
        : place.thoroughfare;
    String? subloc = place.subLocality == ""
        ? placemarks.last.subLocality
        : place.subLocality;

    //log("trot============================================.,///>>>>>>  : $thoroughfare");

    locationAdress.value = '$thoroughfare, ${place.subLocality}';
    latitude.value = position.latitude;
    longitude.value = position.longitude;
    address.value =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}, ${place.name}';
    street.value = "${place.street}";
    subLocality.value = subloc!;
    log("===============subloc ==================: ${subLocality.value}");
    locality.value = "${place.locality}";
    // subLocality.value = "${place.subLocality}";
    country.value = "${place.country}";
    name.value = "${place.administrativeArea}";
    postCode.value = "${place.postalCode}";
    // log('msg:${postCode.value}');
    // log('lat================:${latitude.value}');
    // log('log===============================:${longitude.value}');
    update();
  }
  //dist api ===========

   Future<void> fetchCountry() async {
    try {
      loding.value = true;
      isLocationFetched.value = false;
      
      Position position = await _getGeoLocationPosition();
      await getAddressFromLatLong(position);
      await getLocation(); // This calls the API to get additional location data
      
      isLocationFetched.value = true;
    } catch (e) {
      log('Error fetching location: $e');
    } finally {
      loding.value = false;
    }
  }

  Future<void> getLocation() async {
    try {
      var data = await LocationService.getLocatioinService();
      allLocation.value = data!;
      dist.value = data.postOffice?.first.district ?? '';
      update();
    } catch (e) {
      log('Error fetching location from API: $e');
    }
  }

// oninit =======================================

  // Future<void> fetchCountry() async {
  //   try {
     
  //     Position position = await _getGeoLocationPosition();
  //      isLoading.value=false;
  //     update();
  //     getAddressFromLatLong(position).then((value) => getLocation());

  //     update();
  //   } catch (e) {
  //     //log('Error fetching location: $e');
  //   }
  // }
}
