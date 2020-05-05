import 'package:weather/json/response.dart';

class WeatherModel {
  final String city;
  final double temperature;
  final String description;
  final double rain;
  final double lat;
  final double long;
  final String icon;

  WeatherModel({
    this.city,
    this.temperature,
    this.description,
    this.rain,
    this.lat,
    this.long,
    this.icon,
  });

  WeatherModel.fromResponse(City response)
      : city = response.name,
        // Because api return Kelvin
        temperature = response.main.temp - 273.15,
        description = response.weather[0]?.description,
        icon = response.weather[0]?.icon,
        rain = response.rain.threeHour,
        lat = response.coord.lat,
        long = response.coord.lon;
}
