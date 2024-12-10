import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/change_thime_cubit/change_thime_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetWeatherCubit>(
          create: (context) => GetWeatherCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeThimeCubit(),
        ),
      ],
      child: BlocBuilder<ChangeThimeCubit, ChangeThimeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                state is DarkThimeState ? ThemeData.dark() : ThemeData.light(),
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
