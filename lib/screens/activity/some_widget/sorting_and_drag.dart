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
            Text("Category",
              style: TextStyle(fontSize: 20, color: Colors.grey,),),
            SizedBox(height: 13,),
            MyListTile(pressedButton: (){
      Navigator.of(context).pushNamed("activity");
      },
      height_image: 75,
      height_tile: 170,ImageIconPath: "lib/assets/icons/casual-life-3d-idea-yellow-lamp.png",
      subtile: " organize items ", tileName: "Sorting!"),
            SizedBox(height: 20,),
            MyListTile(
              pressedButton: (){
                Navigator.of(context).pushNamed("puzzle_hack");
              },
                height_image: 75,
                height_tile: 170,ImageIconPath: "lib/assets/flourishing.png",
                subtile: " ", tileName: "puzzle hack"),
            SizedBox(height: 20,),
            MyListTile(
                pressedButton: (){
                  Navigator.of(context).pushNamed("puzzle_num");
                },
                height_image: 75,
                height_tile: 170,ImageIconPath: "lib/assets/flourishing.png",
                subtile: " ", tileName: "Puzzle num"),
            SizedBox(height: 20,),
          ],
      ),
    );
  }
}
