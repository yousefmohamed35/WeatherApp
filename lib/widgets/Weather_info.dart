import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/models/weather_model.dart';

import 'package:weatherapp/widgets/text.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherModel.getThemeColor(),
            weatherModel.getThemeColor()[300]!,
            weatherModel.getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: weatherModel.cityName),
            CustomText(
                text:
                    'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}'),
            const SizedBox(
              height: 48,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network('https:${weatherModel.image}'),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: CustomText(text: '${weatherModel.avTemp.round()}'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'MaxTemp: ${weatherModel.maxTemp.round()}'),
                    CustomText(text: 'MinTemp: ${weatherModel.minTemp.round()}'),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            CustomText(text: weatherModel.weatherCondition),
          ],
        ),
      ),
    );
  }
}
