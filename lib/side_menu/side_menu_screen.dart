import 'package:another_final_kids_app/side_menu/info_side_menu.dart';
import 'package:another_final_kids_app/side_menu/models/rive_assets.dart';
import 'package:another_final_kids_app/side_menu/side_menu_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  RiveAsset selectedMenu= sideMenu.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: double.infinity,
        color: Color(0xFF171D33),

        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(titleInfo: "User name",
                  subTitleInfo:"your info here"),
              //^^^^^^^^^^^^^^
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text("Browse".toUpperCase(),style: Theme.of(context).textTheme
                  .titleMedium!.copyWith(color: Colors.white70),),
              ),
             ...sideMenu.map((menu) => SideMenuTile(menu: menu,
             riveonInit: (artboard){
              StateMachineController controller=
                  RiveUtils.getRiveController(artboard,
                  stateMachineName: menu.stateMachineName);

              menu.input=controller.findSMI("active") as SMIBool;
             },
             press: (){
               menu.input!.change(true);
               Future.delayed(Duration(seconds: 1), (){
                 menu.input!.change(false);
               });
               setState(() {
                 selectedMenu=menu;
               });
             },isActive: selectedMenu==menu,

             ),
             ),

              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text("History".toUpperCase(),style: Theme.of(context).textTheme
                    .titleMedium!.copyWith(color: Colors.white70),),
              ),

              ...sideMenu2.map((menu) => SideMenuTile(menu: menu,
                riveonInit: (artboard){
                  StateMachineController controller=
                  RiveUtils.getRiveController(artboard,
                      stateMachineName: menu.stateMachineName);

                  menu.input=controller.findSMI("active") as SMIBool;
                },
                press: (){
                  menu.input!.change(true);
                  Future.delayed(const Duration(seconds: 1), (){
                    menu.input!.change(false);
                  });
                  setState(() {
                    selectedMenu=menu;
                  });
                },isActive: selectedMenu==menu,

              )),
            ],
          ),
        ),
      )
    );  }
}

class RiveUtils {

  static  StateMachineController getRiveController(Artboard artboard,
  {stateMachineName="State Machine 1"}){
 StateMachineController? controller=
     StateMachineController.fromArtboard(artboard, stateMachineName);
 artboard.addController(controller!);
 return controller;
  }
}
