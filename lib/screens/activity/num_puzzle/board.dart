import 'package:another_final_kids_app/screens/activity/num_puzzle/grid.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'image_widget.dart';

class board extends StatefulWidget {
  const board({super.key});

  @override
  State<board> createState() => _boardState();
}

class _boardState extends State<board> {
  var number=[0,1,2,3,4,5,6,7,8];
  int numberOfMoves=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number.shuffle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60,),
          Text(numberOfMoves.toString()+" Moves | 8 Tiles",
            style:GoogleFonts.courgette(
                color: Color(0xFF579D9A),
                fontSize: 25,
                fontWeight: FontWeight.bold
            ) ,
          ),
          SizedBox(height: 20,),
          // ImageDisplay("lib/assets/woolly-fly.png"),
          Center(child: grid(number, onClick)),
          SizedBox(height: 60,),

           Align(
             alignment: Alignment.centerLeft,
               child: ImageDisplay('lib/assets/for_activity/robot-with-heart.png')),

          // ElevatedButton(onPressed: (){
          //   checkWinner()
          // },
          //
          //     child: Text("check"))



        ],
      ),
    );
  }
  void onClick(index){

    if(index-1 >= 0 && number[index-1]==0 && index % 3 !=0 ||
        index +1< 9 && number[index+1]==0 &&(index+1)%3 !=0 ||
        (index -3 >= 0 && number[index-3]==0) ||
        (index +3 < 9 && number[index+3]==0)){
      setState(() {
        number[number.indexOf(0)]=number[index];
        number[index]=0;
        numberOfMoves++;
      });
      }
    checkWinner();
  }

  bool isShorted(List numberList){
    int first=numberList.first;
    for(int i=1; i<numberList.length; i++ ){
      int nextNumber=numberList[i];
      if(first>nextNumber)
        return false;
      first=numberList[i];
    }
    return true;
  }
  void checkWinner(){
    bool isWinner=isShorted(number);
    if(isWinner){
      AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: 'congratulations',
          desc: 'Now you can move to the second level',
          btnCancelOnPress: () {},
    btnOkOnPress: () {},
    ).show();

    }
  }
}


