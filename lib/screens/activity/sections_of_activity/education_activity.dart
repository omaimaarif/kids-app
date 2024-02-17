import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../tile/my_list_tile.dart';

class EducationActivity extends StatelessWidget {
  const EducationActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Education",
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 13,
        ),
        MyListTile(
            pressedButton: () {
              Navigator.of(context).pushNamed("Math");
            },
            height_image: 50,
            height_tile: 170,
            ImageIconPath: "lib/assets/back_math.png",
            subtile: "Arithmetic Fun",
            tileName: "MathZone!"),
        SizedBox(
          height: 20,
        ),
        MyListTile(
            pressedButton: () {
              Navigator.of(context).pushNamed("memory_game");
                // SystemChrome.setPreferredOrientations([
                //   DeviceOrientation.landscapeLeft,
                //   DeviceOrientation.landscapeRight
                // ]);

            },
            height_image: 50,
            height_tile: 170,
            ImageIconPath: "lib/assets/for_activity/memory_game.png",
            subtile: "memory Fun",
            tileName: "Memory game!"),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
