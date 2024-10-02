import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/models/weather.dart';
import 'package:flutter_project1/page/detail/widgets/detail_body.dart';
import 'package:flutter_project1/providers/weather_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          //đổ màu tử trên xuống dưới
          begin: Alignment.topCenter,
          colors: [
            Color(0xff1D6CF3),
            Color(0xff19D2FE),
          ],
        ),
      ),
      child: FutureBuilder(
          future: context.read<WeatherProvider>().getWeatherDetail(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            List<WeatherDetail> listData = snapshot.data as List<WeatherDetail>;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                //
                elevation: 0,
                centerTitle: false,
                title: Row(
                  children: [
                    const Icon(CupertinoIcons.location),
                    const SizedBox(width: 15),
                    AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TyperAnimatedText(
                          'Ho Chi Minh City',
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                    ),
                  ],
                ),
                actions: const [
                  Icon(CupertinoIcons.search),
                  SizedBox(width: 15),
                ],
              ),
              body: DetailBody(
                listData: listData,
              ),
            );
          }),
    );
  }
}
