import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const kApiKey = 'dbcb16a1f918b30d4e0fb668f1487fbb';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5'
    '/weather';

class WeatherModel {

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper =
    NetworkHelper('$openWeatherMapUrl?lat=${location.latitude}&'
        'lon=${location.longitude}&appid=$kApiKey&units=imperial');
    var weatherData = await networkHelper.getData();

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
    if (temp > 50) {
      return 'It\'s 🍦 time';
    } else if (temp > 40) {
      return 'Time for shorts and 👕';
    } else if (temp < 30) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
