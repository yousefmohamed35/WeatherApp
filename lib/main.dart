import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/screens/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
               theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: BlocProvider.of<GetWeatherCubit>(context).weatherModel == null
              ? Colors.blue
              : BlocProvider.of<GetWeatherCubit>(context).weatherModel!.getThemeColor(),
        ),
        primaryColor: BlocProvider.of<GetWeatherCubit>(context).weatherModel == null
            ? Colors.blue
            : BlocProvider.of<GetWeatherCubit>(context).weatherModel!.getThemeColor(),
        primarySwatch: BlocProvider.of<GetWeatherCubit>(context).weatherModel == null
            ? Colors.blue
            : BlocProvider.of<GetWeatherCubit>(context).weatherModel!.getThemeColor(),
      ),
              debugShowCheckedModeBanner: false,
            
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }


}
