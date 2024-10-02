import 'package:flutter/material.dart';
import 'package:flutter_project1/models/weather.dart';
import 'package:flutter_project1/repositories/api_repositories.dart';

class WeatherProvider extends ChangeNotifier {
  // call API chuyển sang cho nó đứng chờ kq
  Future<WeatherData> getWeatherCurrent() async {
    WeatherData result = await ApiRepository.callApiGetWeather();
    return result;
  }

  Future<List<WeatherDetail>> getWeatherDetail() async {
    List<WeatherDetail> result = await ApiRepository.callApiGetWeatherDetail();
    return result;
  }
}
