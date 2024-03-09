import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyListTile extends StatelessWidget {
  final String ImageIconPath;
  final String tileName;
  final String subtile;
  final double height_tile;
  final double height_image;
  final void Function()? pressedButton;
  const MyListTile(
      {super.key,
      required this.ImageIconPath,
      required this.subtile,
      required this.tileName,
      this.pressedButton,
      required this.height_tile,
      required this.height_image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height_tile,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey[100]),
      padding: EdgeInsets.all(12),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage(ImageIconPath),
              height: height_image,
            ),
            // SizedBox(width: 30,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tileName,
                  style:GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.blueGrey[700]
                  )
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  subtile,
                  style: TextStyle(fontSize: 17, color: Colors.blueGrey[600]),
                ),
              ],
            ),
            // SizedBox(width: 55,),
            IconButton(
                onPressed: pressedButton, icon: Icon(Icons.arrow_forward_ios)),
          ],
        ),
      ),
    );
  }
}
