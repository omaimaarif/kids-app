import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveAsset{


  final String artboard, stateMachineName,title,src;
  late SMIBool? input;

  RiveAsset(this.src,{
    required this.artboard,
    required this.stateMachineName,
  required this.title,
this.input});
  set  setInput(SMIBool status){
    input =status;
  }
}
List<RiveAsset> sideMenu=[
 RiveAsset("lib/assets/icons/rive icons/iconsrive.riv",
   artboard: "HOME",
   stateMachineName: "HOME_interactivity",
   title: "Home",),


  RiveAsset("lib/assets/icons/rive icons/iconsrive.riv",
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Search",),

  RiveAsset("lib/assets/icons/rive icons/iconsrive.riv",
    artboard: "LIKE/STAR",
    stateMachineName: "STAR_Interactivity",
    title: "favorite",),

  RiveAsset("lib/assets/icons/rive icons/iconsrive.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Help",),
];

List<RiveAsset> sideMenu2=[

  RiveAsset("lib/assets/icons/rive icons/iconsrive.riv",
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "History",),

  RiveAsset("lib/assets/icons/rive icons/iconsrive.riv",
    artboard: "BELL",
    stateMachineName: "BELL",
    title: "Notification",),
];