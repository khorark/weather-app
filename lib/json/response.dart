import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  final String message;
  final String cod;
  final int count;

  @JsonKey(name: 'list')
  final List<City> cities;

  BaseResponse(
    this.message,
    this.cod,
    this.count,
    this.cities,
  );

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

@JsonSerializable()
class City {
  final int id;
  final String name;
  final Coord coord;
  final Main main;
  final int dt;
  final Wind wind;
  final Rain rain;
  final Clouds clouds;
  final List<Weather> weather;

  City(this.id, this.name, this.coord, this.main, this.dt, this.wind, this.rain,
      this.clouds, this.weather);

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class Coord {
  final double lat;
  final double lon;

  Coord(
    this.lat,
    this.lon,
  );

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class Main {
  final double temp;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempmax;

  Main(
    this.temp,
    this.pressure,
    this.humidity,
    this.tempMin,
    this.tempmax,
  );

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}

@JsonSerializable()
class Wind {
  final double spend;
  final int deg;
  final double gust;

  Wind(
    this.spend,
    this.deg,
    this.gust,
  );

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}

@JsonSerializable()
class Rain {
  @JsonKey(name: '3h')
  final double threeHour;
  Rain(this.threeHour);

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);

  Map<String, dynamic> toJson() => _$RainToJson(this);
}

@JsonSerializable()
class Clouds extends Object {
  final int all;

  Clouds(
    this.all,
  );

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather(
    this.id,
    this.main,
    this.description,
    this.icon,
  );

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
