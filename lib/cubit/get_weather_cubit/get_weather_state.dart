part of 'get_weather_cubit.dart';

sealed class GetWeatherState {}

final class GetWeatherInitial extends GetWeatherState {}

final class SuccessGetWeatherState extends GetWeatherState {}

final class FailureGetWeatherState extends GetWeatherState {
  final String errorMessage;

  FailureGetWeatherState({required this.errorMessage});
}
final class LoadingGetWeatherState extends GetWeatherState{}