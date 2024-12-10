import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherShow extends StatelessWidget {
  const WeatherShow({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weather = BlocProvider.of<GetWeatherCubit>(context).weather;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Spacer(),
        Text(
          weather.name,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(
          'Updated at: ${weather.lastUpdated}',
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 64),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              'http:${weather.icon}',
              scale: .7,
            ),
            Text(
              weather.tempC.toInt().toString(),
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Text('Max temp: ${weather.maxtempC.toInt()}'),
                Text('min temp:${weather.mintempC.toInt()}')
              ],
            )
          ],
        ),
        const SizedBox(height: 64),
        Text(
          weather.text,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const Spacer()
      ],
    );
  }
}
