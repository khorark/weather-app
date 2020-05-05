// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse(
    json['message'] as String,
    json['cod'] as String,
    json['count'] as int,
    (json['list'] as List)
        ?.map(
            (e) => e == null ? null : City.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'cod': instance.cod,
      'count': instance.count,
      'list': instance.cities,
    };

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    json['id'] as int,
    json['name'] as String,
    json['coord'] == null
        ? null
        : Coord.fromJson(json['coord'] as Map<String, dynamic>),
    json['main'] == null
        ? null
        : Main.fromJson(json['main'] as Map<String, dynamic>),
    json['dt'] as int,
    json['wind'] == null
        ? null
        : Wind.fromJson(json['wind'] as Map<String, dynamic>),
    json['rain'] == null
        ? null
        : Rain.fromJson(json['rain'] as Map<String, dynamic>),
    json['clouds'] == null
        ? null
        : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
    (json['weather'] as List)
        ?.map((e) =>
            e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coord,
      'main': instance.main,
      'dt': instance.dt,
      'wind': instance.wind,
      'rain': instance.rain,
      'clouds': instance.clouds,
      'weather': instance.weather,
    };

Coord _$CoordFromJson(Map<String, dynamic> json) {
  return Coord();
}

Map<String, dynamic> _$CoordToJson(Coord instance) => <String, dynamic>{};

Main _$MainFromJson(Map<String, dynamic> json) {
  return Main();
}

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{};

Wind _$WindFromJson(Map<String, dynamic> json) {
  return Wind();
}

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{};

Rain _$RainFromJson(Map<String, dynamic> json) {
  return Rain();
}

Map<String, dynamic> _$RainToJson(Rain instance) => <String, dynamic>{};

Clouds _$CloudsFromJson(Map<String, dynamic> json) {
  return Clouds();
}

Map<String, dynamic> _$CloudsToJson(Clouds instance) => <String, dynamic>{};

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather();
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{};
