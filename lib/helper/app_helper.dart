import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/modal/app_modal.dart';

class WeatherHelper {
  WeatherHelper._();
  static final WeatherHelper instance = WeatherHelper._();

  String ApiLink =
      "https://api.openweathermap.org/data/2.5/weather?lat=21.1702&lon=72.8311&appid=f9b533218a2b4bc46d75fab7e56e60c4";

  List<Weatherapimodal> weatherapi = [];

  Future<List<Weatherapimodal>> getWeatherapi() async {
    List<Weather> Weathers = [];
    http.Response response = await http.get(Uri.parse(ApiLink));
    if (response.statusCode == 200) {
      Map Data = jsonDecode(response.body);
      List weather = Data['weather'];
      weatherapi = weather.map((e) => Weatherapimodal.fromJson(e)).toList();
    }

    return weatherapi;
  }
}
