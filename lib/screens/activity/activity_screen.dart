import 'package:another_final_kids_app/screens/activity/question_model.dart';
import 'package:another_final_kids_app/screens/activity/select.dart';
import 'package:another_final_kids_app/tile/my_list_tile.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'dragDrop.dart';
class activityScreen extends StatefulWidget {
  const activityScreen({Key? key}) : super(key: key);

  @override
  State<activityScreen> createState() => _activityScreenState();
}

class _activityScreenState extends State<activityScreen> {

  final List<QuestionModel> _question = [

    QuestionModel(2,
        images: [
          'lib/assets/for_activity/basket.png',
          'lib/assets/for_activity/bed.png',
          'lib/assets/for_activity/book.png',
          'lib/assets/for_activity/clock.png',
          'lib/assets/for_activity/balloons.png',
          'lib/assets/for_activity/gift-box.png',

        ],
        title: "Place the pictures in their\nappropriate positions",
        answers: ['Basket','Bed','Book','Clock','balloons','Gift box',],
        typeOfQuestion: 'drag'),

    QuestionModel(2,
        images: [
         'lib/assets/for_activity/bee.png',
          'lib/assets/for_activity/cat.png',
          'lib/assets/for_activity/chicken.png',
          'lib/assets/for_activity/dolphin.png',
          'lib/assets/for_activity/goose.png',
          'lib/assets/for_activity/horse.png',
        ],
        title: "Match the animal pictures with their names",
        answers: ['Bee', 'Cat', 'Chicken','Dolphin','Goose','Horse'],
        typeOfQuestion: 'drag'),


    QuestionModel(2,
        images: [
          'lib/assets/for_activity/anger.png',
          'lib/assets/for_activity/crying.png',
          'lib/assets/for_activity/disgruntled-ginger-boy.png',
          'lib/assets/for_activity/smile.png',
          'lib/assets/for_activity/surprised.png',
          'lib/assets/for_activity/tired.png',
        ],
        title: "Let's try to name these emotions together",
        answers: ['Anger', 'Crying', 'Disgruntled','Smile','Surprised','Tired',],
        typeOfQuestion: 'drag'),
    QuestionModel(1,
        images: [
          'lib/assets/for_activity/butterfly.png',
          'lib/assets/for_activity/sun.png',
          'lib/assets/for_activity/candy.png',
          'lib/assets/for_activity/fire.png',
          'lib/assets/for_activity/pieceofcake.png',
          'lib/assets/for_activity/pump-bottle.png',
          'lib/assets/for_activity/soil.png',
          'lib/assets/for_activity/bread.png',
          'lib/assets/for_activity/vegetables.png'
        ],
        title: "What does a tree need to grow?",
        answers: ['Butterfly','Sun', 'Candy', 'Fire','Cake','Soap','Soil','Bread','Vegetables'],
        typeOfQuestion: 'select'),



  ];
  int score = 0;
  int counter = 0;

  void check(bool c) {
    if (c) score++;
    counter++;
    setState(() {});
  }

   @override
   Widget build(BuildContext context) {
     return SafeArea(
       child: Scaffold(
         backgroundColor: Colors.grey[50],
         body: SizedBox(
           width: double.infinity,
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 40,),
                 _question.length <= counter
                     ? Text("Done!")
                     : _question[counter].typeOfQuestion == 'drag'
                     ? DragDrop(
                   key: UniqueKey(),
                   questionModel: _question[counter],
                   next: (n) {
                     check(n);
                   },
                 )
                     : Select(
                   key: UniqueKey(),
                   questionModel: _question[counter],
                   next: (n) {
                     check(n);
                   },
                 ),
                 SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.only(left: 10,),
                   child: Text("Score: $score",style: TextStyle(
                       fontSize: 15,fontWeight: FontWeight.bold,
                   color: Colors.blueGrey),),
                 ),
               ],
             ),
           ),
         ),
       ),
     );
   }
}
