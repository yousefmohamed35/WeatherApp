import 'package:weatherapp/models/weather_model.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  
}
class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccessState(this.weatherModel);
}
class WeatherFailureState extends WeatherState {}
