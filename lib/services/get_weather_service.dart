import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class GetWeatherService {
  final dio = Dio();
  Future<WeatherModel> getWeather({required String city}) async {
    try {
      final response = await dio.get(
          'http://api.weatherapi.com/v1/forecast.json?key=83efe355f30a46ad900145807230704&q=$city&days=1&aqi=no&alerts=yes');

      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error']['message']??'error try again');
    } catch (e) {
      throw Exception(e);
    }
  }
}
