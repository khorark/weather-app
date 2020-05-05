import 'package:rx_command/rx_command.dart';
import 'package:geolocation/geolocation.dart';

import 'package:weather/model/model.dart';
import 'package:weather/model/weather_repo.dart';

class ModelCommand {
  final WeatherRepo weatherRepo;

  final RxCommand<Null, LocationResult> updateLocationCommand;
  final RxCommand<LocationResult, List<WeatherModel>> updateWeatherCommand;
  final RxCommand<Null, bool> getGpsCommand;
  final RxCommand<bool, bool> radioCheckedCommand;

  ModelCommand._(
    this.weatherRepo,
    this.updateLocationCommand,
    this.updateWeatherCommand,
    this.getGpsCommand,
    this.radioCheckedCommand,
  );

  factory ModelCommand(WeatherRepo repo) {
    final _getGpsCommand = RxCommand.createAsyncNoParam<bool>(repo.getGps);

    final _radioCheckedCommand = RxCommand.createSync<bool, bool>((b) => b);

    final _updateLocationCommand = RxCommand.createAsyncNoParam<LocationResult>(
        repo.updateLocation,
        canExecute: _getGpsCommand);

    final _updateWeatherCommand =
        RxCommand.createAsync<LocationResult, List<WeatherModel>>(
            repo.updateWeather,
            canExecute: _radioCheckedCommand);

    _updateLocationCommand.listen((data) => _updateWeatherCommand(data));

    _updateWeatherCommand(null);

    return ModelCommand._(
      repo,
      _updateLocationCommand,
      _updateWeatherCommand,
      _getGpsCommand,
      _radioCheckedCommand,
    );
  }
}
