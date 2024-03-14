import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/widgets/text.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Search a city'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              GetWeatherCubit getWeatherCubit =
                  BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
              hintText: 'Enter city name',
              suffixIcon: Icon(Icons.search),
              labelText: 'Search',
            ),
          ),
        ),
      ),
    );
  }
}
