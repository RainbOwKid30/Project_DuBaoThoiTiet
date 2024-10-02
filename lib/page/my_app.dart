import 'package:flutter/material.dart';
import 'package:flutter_project1/apps/configs/theme_custom.dart';
import 'package:flutter_project1/page/bottom_navigation_custom/bottom_custom.dart';
import 'package:flutter_project1/providers/weather_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          WeatherProvider(), // bọc toàn bộ app bên trong cái WeatherProvider để sử dụng nó
      child: MaterialApp(
        theme: ThemeCustom.themeLight,
        debugShowCheckedModeBanner: false,
        home: const BottomNavigationCustom(),
      ),
    );
  }
}
