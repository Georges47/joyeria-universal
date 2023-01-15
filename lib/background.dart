import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return (
      WaveWidget(
        config: CustomConfig(
          colors: [
            const Color(0xFFdfdfdf),
            const Color(0xFFd2d2d2),
          ],
          durations: [
            10000,
            13000,
          ],
          heightPercentages: [
            0.4,
            0.6,
          ],
        ),
        backgroundColor: const Color(0xFFececec),
        size: const Size(double.infinity, double.infinity),
      )
    );
  }
}
