import 'dart:convert';

import 'package:http/http.dart' as http;

import '../globalclass.dart';

class WeatherHelper {
  WeatherHelper._();
  static final WeatherHelper instance = WeatherHelper._();

  String ApiLink =
      "http://api.weatherapi.com/v1/current.json?key=65578899c53c48b999f121435240206&q=${Global.instance.city6}";
  // "https://api.openweathermap.org/data/2.5/weather?lat=21.1702&lon=72.8311&appid=f9b533218a2b4bc46d75fab7e56e60c4";

  List weatherapi = [];

  Future<List> getWeatherapi() async {
    // List<Weather> Weathers = [];
    http.Response response = await http.get(Uri.parse(ApiLink));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body)["location"];
      Map data2 = jsonDecode(response.body)["current"];
      weatherapi.add(data);
      weatherapi.add(data2);
    }
    return weatherapi;
  }
}
