import 'dart:async';
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'package:weather/json/response.dart';

import 'package:weather/model/model.dart';
import 'package:weather/const.dart';

class WeatherRepo {
  final http.Client client;
  final String url = 'https://api.openweathermap.org/data/2.5/find?';
  final Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager = true;

  WeatherRepo({
    this.client,
  });

  int cnt = 50;

  void addCities(int count) {
    cnt = count;
  }

  Future<List<WeatherModel>> updateWeather(Position result) async {
    double lat;
    double long;

    if (result != null) {
      lat = result.latitude;
      long = result.longitude;
    } else {
      lat = 43;
      long = 79;
    }

    String url = this.url + 'lat=$lat&lon=$long&cnt=$cnt&appid=$API_KEY';

    try {
      final response = await client.get(url);
      List<WeatherModel> req = BaseResponse.fromJson(json.decode(response.body))
          .cities
          .map((city) => WeatherModel.fromResponse(city))
          .toList();

      return req;
    } catch (e) {
      return null;
    }
  }

  Future<Position> updateLocation() async {
    Future<Position> result =
        geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    return result;
  }

  Future<bool> getGps() async {
    final GeolocationStatus result =
        await geolocator.checkGeolocationPermissionStatus();

    if (result.value.toString() == GeolocationStatus.granted.toString()) {
      return false;
    } else {
      return true;
    }
  }
}
