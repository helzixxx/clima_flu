import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double? _latitude;
  double? _longtude;

  double? get latitude => _latitude;
  double? get longtude => _longtude;

  void getCurrentLocation(BuildContext context) async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
      }
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        _latitude = position.latitude;
        _longtude = position.longitude;
        print(_latitude);
        print(_longtude);
      } catch (e) {
        print(e);
      }
    }
  }
}
