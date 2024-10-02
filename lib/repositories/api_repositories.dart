import 'package:dio/dio.dart';
import 'package:flutter_project1/apps/utils/const.dart';
import 'package:flutter_project1/models/weather.dart';

class ApiRepository {
  static Future<WeatherData> callApiGetWeather() async {
    try {
      final dio = Dio();
      final res = await dio.get(
          // muốn thay đổi api key thì vào asset.dart
          'https://api.openweathermap.org/data/2.5/weather?lat=10.758490&lon=106.702843&units=metric&appid=${MyKey.api_token}');
      final data = res.data;
      // chuyển thành đối tượng weather lúc trc đã tạo
      // sau khi chuyển đổi thì khi result.<ten item>
      WeatherData result = WeatherData.fromMap(data);
      return result; // providers nhận giá trị
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<List<WeatherDetail>> callApiGetWeatherDetail() async {
    try {
      final dio = Dio();
      final res = await dio.get(
          // muốn thay đổi api key thì vào asset.dart
          'https://api.openweathermap.org/data/2.5/forecast?lat=10.758490&lon=106.702843&units=metric&appid=${MyKey.api_token}');
      List data = res.data['list'];
      List<WeatherDetail> result = List<WeatherDetail>.from(
          data.map((e) => WeatherDetail.fromMap(e)).toList());
      return result; // providers nhận giá trị
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
