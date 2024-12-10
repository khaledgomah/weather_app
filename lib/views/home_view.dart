import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/change_thime_cubit/change_thime_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/search_weather_view.dart';
import 'package:weather_app/widgets/no_weather_widget.dart';
import 'package:weather_app/widgets/weather_show_widger.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BlocBuilder<ChangeThimeCubit, ChangeThimeState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () =>
                  BlocProvider.of<ChangeThimeCubit>(context).changeThime(),
              icon: state.icon,
            );
          },
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchWeatherView(),
                    ),
                  ),
              icon: const Icon(Icons.search))
        ],
        centerTitle: true,
        title: const Text('Weather app'),
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is GetWeatherInitial) {
            return const NoWeatherWidget();
          } else if (state is FailureGetWeatherState) {
            return Center(
                child: Text(
              state.errorMessage,
              style: const TextStyle(fontSize: 24),
            ));
          } else if (state is LoadingGetWeatherState) {
            return const Center(child: CircularProgressIndicator());
          }
          return const WeatherShow();
        },
      ),
    );
  }
}
