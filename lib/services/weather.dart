import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '74cfb9215f5e8fb6d560060034aaba3e';
const urlApi = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityweather(String city) async {
    String url = '$urlApi?q=$city&appid=$apiKey&units=metric';
    NetworkHelper network = NetworkHelper(url);
    var weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();

    String url =
        '$urlApi?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    NetworkHelper network = NetworkHelper(url);

    var weatherData = await network.getData();
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
