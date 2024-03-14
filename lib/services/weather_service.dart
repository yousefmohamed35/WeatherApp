import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WethearSevice {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'f1b559d0cc0140049e6144307242501';
  WethearSevice(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'opps try again later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error try later');
    }
  }
}
