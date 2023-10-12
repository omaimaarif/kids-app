import 'package:another_final_kids_app/buttons/my_buttons_homepage.dart';
import 'package:another_final_kids_app/side_menu/side_menu_screen.dart';
import 'package:another_final_kids_app/tile/my_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../cards/home_page_card.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key,});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller=PageController();
  late SMIBool isSideBarClosed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
      child: SideMenu(),
      ),
      backgroundColor: Color(0xFFE9EDEE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //App bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 60,
                        ),
                        Text("D", style: TextStyle(fontSize: 30
                            ,fontWeight: FontWeight.bold),),
                        Text("iscover", style: TextStyle(fontSize:30
                        ),),
                      ],
                    ),
                    //Plus buttons
                    Container(

                        decoration: BoxDecoration(shape: BoxShape.circle,
                            color: Colors.grey[200],
                            boxShadow: [BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0,3),
                                blurRadius: 8
                            )]),
                        padding: EdgeInsets.all(4),
                        child: IconButton(
                          onPressed: () { },
                        icon: Image(image: AssetImage("lib/assets/user_profile.png"),),)),
                  ],
                ),
              ),
              SizedBox(height: 20),
                 //Cards
              Container(
                height: 200,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: [
                  MyCard(
                    imagePathe:"lib/assets/man.png",
                    title: "Get ready for\nexciting activities!",
                    color:Color(0xD2E2B56E),),
                  MyCard(
                    imagePathe:"lib/assets/icons/art.png",
                    title: "Inspiring Colors\nand Creativity",
                    color:  Color(0x4F6D9EA8),),
                    MyCard(imagePathe: "lib/assets/icons/connection.png",
                        title: "Messages ignite\nsensory creativity", color: Color(0x89DDB3B5))
                ],
                ),
              ),
              SizedBox(height: 20,),
              SmoothPageIndicator(controller:
              _controller, count: 3,
                  effect:ExpandingDotsEffect(
                    activeDotColor: Color(0xFFDDB3B5)
                  ) ,)

  ,SizedBox(height: 20,),
                           //Column state
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    "Categories",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                  color: Colors.grey),),
                  SizedBox(height: 10,),
                  MyListTile(ImageIconPath: "lib/assets/icons/puzzle.png",
                    tileName: "Activities",subtile:"plenty of activities"),
                    SizedBox(height: 10,),
                    MyListTile(ImageIconPath: "lib/assets/icons/palette.png", subtile: " let's paint here", tileName: "Drawing")
                    ,SizedBox(height: 5,)
                    ,Text(
                      "Communication",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                        color: Colors.grey),),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyButtons(buttonText: "chat", IconImagePath: "lib/assets/icons/paper.png"),
                      ],
                    )
                ],
                ),
              )
            ],
          ),

      ),
      )
    );
  }
}
