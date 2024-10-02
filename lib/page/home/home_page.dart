import 'package:flutter/material.dart';
import 'package:flutter_project1/models/weather.dart';
import 'package:flutter_project1/page/home/widgets/home_detail_weather.dart';
import 'package:flutter_project1/page/home/widgets/home_location.dart';
import 'package:flutter_project1/page/home/widgets/home_temperture.dart';
import 'package:flutter_project1/page/home/widgets/home_weather_icon.dart';
import 'package:flutter_project1/providers/weather_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WeatherProvider>().getWeatherCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        //mix màu nên lại với nhau
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            //đổ màu từ trên xuống dưới
            begin: Alignment.topCenter,
            colors: [
              Color(0xff1D6CF3),
              Color(0xff19D2FE),
            ],
          ),
        ),
        child: FutureBuilder(
          future: context.read<WeatherProvider>().getWeatherCurrent(),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // trạng thái đang chờ loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // không có data thì trả về màn hình lỗi hoặc text no data
            if (!snapshot.hasData) {
              return Container(
                child: const Text('no data'),
              );
            }

            WeatherData data = snapshot.data as WeatherData;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //icon thời tiết
                HomeWeatherIcon(nameIcon: data.weather[0].main),
                //nhiệt độ
                HomeTemperture(temp: data.main.temp),
                //icon location
                HomeLocation(nameLocation: data.name),
                //detail weather
                const SizedBox(height: 40),
                HomeDetailWeather(
                  humidity: data.main.humidity,
                  speedWind: data.wind.speed,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
