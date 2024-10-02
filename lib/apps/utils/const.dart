import 'package:flutter/material.dart';

const linkAsset = 'assets/images/weathers/';

class AssetCustom {
  static String getLinkImg(String name) =>
      '$linkAsset${name.replaceAll(' ', '').toLowerCase()}.png';
}

class MyKey {
  static const String api_token = '6b9ee93e2ceed6ce047213d173ae2335';
}

Widget createTemp(num temp, {double size = 100}) {
  return Row(
    //căng giữa theo row
    mainAxisAlignment: MainAxisAlignment.center,
    // vị trí bắt đầu
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        temp.round().toString(),
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Text(
        '0',
        style: TextStyle(
          fontSize: size / 3,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ],
  );
}
