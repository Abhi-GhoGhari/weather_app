import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:weather_app/helper/app_helper.dart';

class WeatherapiController extends ChangeNotifier {
  List allweatherdata = [];
  Logger logger = Logger();

  Future<void> getWeather() async {
    allweatherdata = await WeatherHelper.instance.getWeatherapi();
    notifyListeners();
  }

  Future<void> getWeather2() async {
    var newWeatherData = await WeatherHelper.instance.getWeatherapi();
    if (allweatherdata.length >= 2) {
      allweatherdata.insertAll(2, newWeatherData);
    } else {
      allweatherdata
          .addAll(newWeatherData); // Add to the end if not enough items
    }
    notifyListeners();
  }
}
