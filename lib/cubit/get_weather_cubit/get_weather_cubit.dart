import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/get_weather_service.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  late WeatherModel weather;
  GetWeatherCubit() : super(GetWeatherInitial());
  void getWeather(String cityName)async {
    try {
      emit(LoadingGetWeatherState());
      weather =await GetWeatherService().getWeather(city: cityName);
      emit(SuccessGetWeatherState());
    } catch (e) {
      emit(FailureGetWeatherState(errorMessage: e.toString()));
    }
  }
}
