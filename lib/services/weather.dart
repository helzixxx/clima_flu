import 'package:clima_flu/services/location.dart';
import 'package:clima_flu/services/networking.dart';

const apiKey = 'd4712222dbaa423134470503eeaab8ad';
const weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getWeatherLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkingHelper networkingHelper = NetworkingHelper(
        '$weatherApiUrl?lat=${location.latitude}&lon=${location.longtude}&appid=$apiKey&units=metric');
    var weatherData = await networkingHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
