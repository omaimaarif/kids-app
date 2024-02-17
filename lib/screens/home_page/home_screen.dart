import 'package:another_final_kids_app/buttons/my_buttons_homepage.dart';
import 'package:another_final_kids_app/tile/my_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rive/rive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../cards/home_page_card.dart';
import '../side_menu/side_menu_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = PageController();
  late SMIBool isSideBarClosed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.disconnect();
                await FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("splash", (route) => false);
              },
              icon: Icon(Icons.exit_to_app),
              color: Colors.grey[500],
            )
          ],
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "D",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[500]),
              ),
              TextSpan(
                text: "iscover",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueGrey),
              )
            ]),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                color: Colors.grey[500],
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
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
                    children: [],
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
                        imagePathe: "lib/assets/man.png",
                        title: "Get ready for\nexciting activities!",
                        color: Color(0xD2E2B56E),
                      ),
                      MyCard(
                        imagePathe: "lib/assets/icons/art.png",
                        title: "Inspiring Colors\nand Creativity",
                        color: Color(0x4F6D9EA8),
                      ),
                      MyCard(
                          imagePathe: "lib/assets/icons/connection.png",
                          title: "Messages ignite\nsensory creativity",
                          color: Color(0x89DDB3B5))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect:
                      ExpandingDotsEffect(activeDotColor: Color(0xE5C48E94)),
                ),
                SizedBox(
                  height: 20,
                ),
                //Column state
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Popular",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyListTile(
                        height_image: 50,
                        height_tile: 100,
                        ImageIconPath: "lib/assets/icons/puzzle.png",
                        tileName: "Activities",
                        subtile: "plenty of activities",
                        pressedButton: () {
                          Navigator.of(context)
                              .pushNamed("welcome_to_activity");
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyListTile(
                          pressedButton: () {
                            Navigator.of(context)
                                .pushNamed("welcome_to_art_section");
                          },
                          height_image: 50,
                          height_tile: 100,
                          ImageIconPath: "lib/assets/icons/palette.png",
                          subtile: " let's paint here",
                          tileName: "Drawing"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Chatterbox",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyButtons(
                            buttonText: "chat",
                            IconImagePath: "lib/assets/icons/paper.png",
                            onTap: () {
                              Navigator.of(context).pushNamed('chat_screen');
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
