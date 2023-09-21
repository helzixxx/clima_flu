import 'package:flutter/material.dart';
import 'package:clima_flu/services/location.dart';
import 'package:clima_flu/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'd4712222dbaa423134470503eeaab8ad';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longtude;

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation(context);
    latitude = location.latitude!;
    longtude = location.longtude!;

    NetworkingHelper networkingHelper = NetworkingHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longtude&appid=$apiKey');
    var weatherData = await networkingHelper.getData();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocationScreen()));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
