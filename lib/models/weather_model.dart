import 'package:flutter/material.dart';

class WeatherModel {
  final String cityName;
  final DateTime date;
  final double avTemp;
  final double maxTemp;
  final double minTemp;
  final String? image;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.avTemp,
      required this.maxTemp,
      required this.minTemp,
      this.image,
      required this.weatherCondition});
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        avTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon']);
  }
  MaterialColor getThemeColor() {
    if (weatherCondition == 'Clear') {
      return Colors.blue;
    } else if (weatherCondition == 'Sunny') {
      return Colors.orange;
    }
  else if (weatherCondition == 'Overcast') {
      return Colors.grey;
    } else if (weatherCondition == 'Blizzard' ||
        weatherCondition == 'Patchy snow possible' ||
        weatherCondition == 'Patchy sleet possible' ||
        weatherCondition == 'Patchy freezing drizzle possible' ||
        weatherCondition == 'Blowing snow' || weatherCondition == 'Cloudy' ||
        weatherCondition == 'Patchy rain possible' || weatherCondition == 'Patchy rain nearby'||
        weatherCondition == 'Heavy Rain' ||
        weatherCondition == 'Showers') {
      return Colors.lightBlue;
    } else if (weatherCondition == 'Thundery outbreaks possible' ||
        weatherCondition == 'Moderate or heavy snow with thunder' ||
        weatherCondition == 'Patchy light snow with thunder' ||
        weatherCondition == 'Moderate or heavy rain with thunder' ||
        weatherCondition == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.blueGrey;
    }
  }
}
