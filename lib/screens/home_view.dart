import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/screens/searchScreen.dart';
import 'package:weatherapp/widgets/Weather_info.dart';
import 'package:weatherapp/widgets/noweatherBody.dart';
import 'package:weatherapp/widgets/text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.transparent,
      appBar: AppBar(

        title: const Text("Weather App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchView();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return const  NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return const  WeatherInfo();
          } else {
            return  SizedBox(
              width: double.infinity,
              height: double.infinity,
              
              child: Center(child: Image.asset('assets/image/er2.jpg',fit: BoxFit.fill,height: double.infinity,width: double.infinity,)));
          }
        },
      ),
    );
  }
}
// state >= الاوضاع اللي بياخدها ال يو اي بتاعنا
// the name of cubit come from logic that change the state which manage it 
// cubit is simple way from bloc state 
// bloc state management construction 
// create states 
// create cubit
// create function 
// provide cubit 
// integrate cubit 
// trigger cubit 