import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';

class SearchWeatherView extends StatelessWidget {
  const SearchWeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          autofocus: true,
          onSubmitted: (value) async {
            BlocProvider.of<GetWeatherCubit>(context).getWeather(value);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            hintText: 'City',
            label: const Text('Search'),
            suffixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          ),
        ),
      ),
    );
  }
}
