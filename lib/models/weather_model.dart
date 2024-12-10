
class WeatherModel  {
  final String name;
  final double tempC;
  final double mintempC;
  final double maxtempC;
  final String text;
  final String icon;
  final String lastUpdated;

  WeatherModel(
      {required this.name,
      required this.tempC,
      required this.mintempC,
      required this.maxtempC,
      required this.text,
      required this.icon,
      required this.lastUpdated});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        tempC: json['current']['temp_c'],
        mintempC: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxtempC: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        text: json['current']['condition']['text'],
        icon: json['current']['condition']['icon'],
        lastUpdated:
            '${DateTime.parse(json['current']['last_updated']).toLocal().hour.toString().padLeft(2, '0')}:${DateTime.parse(json['current']['last_updated']).toLocal().minute.toString().padLeft(2, '0')}',
        name: json['location']['name']);
  }
}

