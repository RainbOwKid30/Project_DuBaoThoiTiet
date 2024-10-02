import 'package:flutter/material.dart';
import 'package:flutter_project1/apps/utils/const.dart';

class HomeWeatherIcon extends StatelessWidget {
  const HomeWeatherIcon({super.key, required this.nameIcon});

  final String nameIcon;

  @override
  Widget build(BuildContext context) {
    // tính toán kích thước của màn hình
    Size size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width / 1.5,
      padding: const EdgeInsets.all(20),
      child: Image.asset(
        AssetCustom.getLinkImg(nameIcon),
        fit: BoxFit.cover, //không làm bể hình và nhòe khi thay đổi size
      ),
    );
  }
}
