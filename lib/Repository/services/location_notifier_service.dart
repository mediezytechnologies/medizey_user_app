import 'package:flutter/material.dart';

class LocationNotifier extends ValueNotifier<String> {
  LocationNotifier() : super('');

  void updateCountry(String country) {
    value = country;
  }
}
