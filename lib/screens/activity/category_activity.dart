import 'package:another_final_kids_app/cards/home_page_card.dart';
import 'package:another_final_kids_app/screens/activity/dragDrop.dart';
import 'package:another_final_kids_app/screens/activity/some_widget/category_list_state.dart';
import 'package:another_final_kids_app/tile/my_list_tile.dart';
import 'package:flutter/material.dart';

class CategoryActivity extends StatefulWidget {
  const CategoryActivity({super.key});

  @override
  State<CategoryActivity> createState() => _CategoryActivityState();
}

class _CategoryActivityState extends State<CategoryActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EDEE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:  IconButton(onPressed: (){
          Navigator.of(context).pushNamed("HomePage");
        },
          icon:Icon(Icons.arrow_back_ios),color: Colors.grey,),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryList(),
                SizedBox(height: 20,),

               Text("Category",
                    style: TextStyle(fontSize: 20, color: Colors.grey,
                  ),),
               SizedBox(height: 20,),
                MyListTile(pressedButton: (){
                Navigator.of(context).pushNamed("activity");
                },
                    height_image: 75,
                    height_tile: 170,ImageIconPath: "lib/assets/icons/casual-life-3d-idea-yellow-lamp.png",
                    subtile: " organize items ", tileName: "Sorting!"),
                SizedBox(height: 25,),

                
                MyListTile(
                    height_image: 75,
                    height_tile: 170,ImageIconPath: "lib/assets/flourishing.png",
                    subtile: " ", tileName: "   "),
                SizedBox(height: 20,),
                Divider(
                  height: 2,
                  thickness: 2,
                  color: Colors.grey[200],
                )










              ],
            ),
        ),
      ),
      );

  }
}
