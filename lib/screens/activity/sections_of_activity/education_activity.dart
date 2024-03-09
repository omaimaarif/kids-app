import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../tile/my_list_tile.dart';

class EducationActivity extends StatelessWidget {
  const EducationActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyListTile(
              pressedButton: () {
                Navigator.of(context).pushNamed("Math");
              },
              height_image: 37,
              height_tile: 170,
              ImageIconPath: "lib/assets/books.png",
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
              height_image: 60,
              height_tile: 170,
              ImageIconPath: "lib/assets/studdy (1).png",
              subtile: "Mind Challenge",
              tileName: "Memory game!"),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              padding: EdgeInsets.only(top: 1),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Padding(
                  //     padding: const EdgeInsets.all(10),
                  //     child: Image(
                  //       height: 170,
                  //       image: AssetImage("lib/assets/back_math.png"),
                  //     )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
