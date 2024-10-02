import 'package:flutter/material.dart';

class HomeTemperture extends StatelessWidget {
  const HomeTemperture({super.key, required this.temp});

  final num temp;

  @override
  Widget build(BuildContext context) {
    return Row(
      //căng giữa theo row
      mainAxisAlignment: MainAxisAlignment.center,
      // vị trí bắt đầu
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          temp.round().toString(),
          style: const TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const Text(
          '0',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
