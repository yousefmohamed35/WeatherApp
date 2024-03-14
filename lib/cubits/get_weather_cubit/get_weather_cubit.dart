import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    emit(WeatherLoadedState());
    try {
      weatherModel =
          await WethearSevice(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherSuccessState(weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }
  }
}
