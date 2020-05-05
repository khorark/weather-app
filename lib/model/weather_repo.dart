import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:geolocation/geolocation.dart';

import 'package:weather/json/response.dart';

import 'package:weather/model/model.dart';
import 'package:weather/const.dart';

class WeatherRepo {
  final http.Client client;
  final String url = 'http://api.openweathermap.org/data/2.5/find?';

  WeatherRepo({
    this.client,
  });

  int cnt = 50;

  void addCities(int count) {
    cnt = count;
  }

  Future<List<WeatherModel>> updateWeather(LocationResult result) async {
    double lat;
    double long;

    if (result != null) {
      lat = result.location.latitude;
      long = result.location.longitude;
    } else {
      lat = 43;
      long = 79;
    }

    String url = this.url + 'lat$lat&lon=$long&cnt=$cnt&appid=$API_KEY';

    final response = await client.get(url);

    List<WeatherModel> req = BaseResponse.fromJson(json.decode(response.body))
        .cities
        .map((city) => WeatherModel.fromResponse(city))
        .toList();

    return req;
  }

  Future<LocationResult> updateLocation() async {
    Future<LocationResult> result = Geolocation.lastKnownLocation();
    return result;
  }

  Future<bool> getGps() async {
    final GeolocationResult result = await Geolocation.isLocationOperational();

    if (result.isSuccessful) {
      return true;
    } else {
      return false;
    }
  }
}
