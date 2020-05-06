import 'package:geolocator/geolocator.dart';
import 'package:rx_command/rx_command.dart';

import 'package:weather/model/model.dart';
import 'package:weather/model/weather_repo.dart';

class ModelCommand {
  final WeatherRepo weatherRepo;

  final RxCommand<dynamic, Position> updateLocationCommand;
  final RxCommand<Position, List<WeatherModel>> updateWeatherCommand;
  final RxCommand<void, bool> getGpsCommand;
  final RxCommand<bool, bool> radioCheckedCommand;
  final RxCommand<int, void> addCitiesCommand;

  ModelCommand._(
    this.weatherRepo,
    this.updateLocationCommand,
    this.updateWeatherCommand,
    this.getGpsCommand,
    this.radioCheckedCommand,
    this.addCitiesCommand,
  );

  factory ModelCommand(WeatherRepo repo) {
    final _getGpsCommand = RxCommand.createAsyncNoParam<bool>(repo.getGps);

    final _radioCheckedCommand = RxCommand.createSync<bool, bool>((b) => b);

    final _updateLocationCommand = RxCommand.createAsyncNoParam<Position>(
        repo.updateLocation,
        canExecute: _getGpsCommand);

    final _updateWeatherCommand =
        RxCommand.createAsync<Position, List<WeatherModel>>(repo.updateWeather,
            canExecute: _radioCheckedCommand);

    final _addCitiesCommand = RxCommand.createSyncNoResult<int>(repo.addCities);

    _updateLocationCommand.listen((data) => _updateWeatherCommand(data));

    _updateWeatherCommand(null);

    return ModelCommand._(
      repo,
      _updateLocationCommand,
      _updateWeatherCommand,
      _getGpsCommand,
      _radioCheckedCommand,
      _addCitiesCommand,
    );
  }
}
