import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../cards/home_page_card.dart';
import '../../../tile/my_list_tile.dart';

class SortAndDrag extends StatefulWidget {
  const SortAndDrag({super.key});

  @override
  State<SortAndDrag> createState() => _SortAndDragState();
}

class _SortAndDragState extends State<SortAndDrag> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              padding: EdgeInsets.only(top: 1),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(2)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Text("let's start\nexploring together",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.aBeeZee(
                            color: Colors.black54,
                            fontSize: 19,
                            fontWeight: FontWeight.normal)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 22),
                    child: Image(
                      image:
                          AssetImage("lib/assets/for_activity/penguin (1).png"),
                      height: 140,
                      width: 140,
                    ),
                  ),
                ],
              ),
            ),
          ),

          MyListTile(
              pressedButton: () {
                Navigator.of(context).pushNamed("activity");
              },
              height_image: 75,
              height_tile: 140,
              ImageIconPath:
                  "lib/assets/studdy (2).png",
              subtile: " organize items ",
              tileName: "Sorting!"),
          SizedBox(
            height: 5,
          ),
          Text(
            "Puzzle games",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          MyListTile(
              pressedButton: () {
                Navigator.of(context).pushNamed("puzzle_num");
              },
              height_image: 75,
              height_tile: 120,
              ImageIconPath: "lib/assets/icons/chalky-yellow-dotted-line.png",
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
              height_tile: 120,
              ImageIconPath:
                  "lib/assets/icons/chalky-yellow-lego-brick.png",
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
