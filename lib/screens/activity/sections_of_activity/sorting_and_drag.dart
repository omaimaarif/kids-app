import 'package:flutter/material.dart';
import '../../../tile/my_list_tile.dart';

class SortAndDrag extends StatelessWidget {
  const SortAndDrag({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Drag And drop games",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MyListTile(
              pressedButton: () {
                Navigator.of(context).pushNamed("activity");
              },
              height_image: 75,
              height_tile: 160,
              ImageIconPath:
                  "lib/assets/icons/casual-life-3d-idea-yellow-lamp.png",
              subtile: " organize items ",
              tileName: "Sorting!"),
          SizedBox(height: 2,),
          Text(
            "Puzzle games",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MyListTile(
              pressedButton: () {
                Navigator.of(context).pushNamed("puzzle_num");
              },
              height_image: 75,
              height_tile: 140,
              ImageIconPath: "lib/assets/for_activity/lego.png",
              subtile: "Easy level",
              tileName: "Puzzle num"),
          SizedBox(
            height: 10,
          ),
          MyListTile(
              pressedButton: () {
                Navigator.of(context).pushNamed("puzzle_hack");
              },
              height_image: 75,
              height_tile: 140,
              ImageIconPath: "lib/assets/for_activity/3d-casual-life-lego-2.png",
              subtile: "Medium level",
              tileName: "puzzle hack"),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
