import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longtude;

  Future<void> getCurrentLocation() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        longtude = position.longitude;
      } catch (e) {
        print(e);
      }
    }
  }
}
