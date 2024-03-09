import 'package:flutter/material.dart';
import '../../../tile/my_list_tile.dart';

class ExpressEmotions extends StatefulWidget {
  const ExpressEmotions({super.key});

  @override
  State<ExpressEmotions> createState() => _ExpressEmotionsState();
}

class _ExpressEmotionsState extends State<ExpressEmotions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Emotions",
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
              Navigator.of(context).pushNamed("emotions");
            },
            height_image: 50,
            height_tile: 170,
            ImageIconPath: "lib/assets/heart.png",
            subtile: "Mood Detector",
            tileName: "How are u today?"),
        SizedBox(
          height: 20,
        ),
        MyListTile(
            pressedButton: () {
              Navigator.of(context).pushNamed("facedetector");
            },
            height_image: 50,
            height_tile: 170,
            ImageIconPath: "lib/assets/heart.png",
            subtile: "Mood Detector",
            tileName: "How are u today?"),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
