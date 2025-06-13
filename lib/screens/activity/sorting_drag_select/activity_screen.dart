import 'package:another_final_kids_app/screens/activity/sorting_drag_select/pravo.dart';
import 'package:another_final_kids_app/screens/activity/sorting_drag_select/question_model.dart';
import 'package:another_final_kids_app/screens/activity/sorting_drag_select/select.dart';
import 'package:another_final_kids_app/tile/my_list_tile.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../category_activity.dart';
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
        answers: [
          'Basket',
          'Bed',
          'Book',
          'Clock',
          'balloons',
          'Gift box',
        ],
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
        answers: ['Bee', 'Cat', 'Chicken', 'Dolphin', 'Goose', 'Horse'],
        typeOfQuestion: 'drag'),
    // QuestionModel(2,
    //     images: [
    //       'lib/assets/for_activity/anger.png',
    //       'lib/assets/for_activity/crying.png',
    //       'lib/assets/for_activity/disgruntled-ginger-boy.png',
    //       'lib/assets/for_activity/smile.png',
    //       'lib/assets/for_activity/surprised.png',
    //       'lib/assets/for_activity/tired.png',
    //     ],
    //     title: "Let's try to name these emotions together",
    //     answers: [
    //       'Anger',
    //       'Crying',
    //       'Disgruntled',
    //       'Smile',
    //       'Surprised',
    //       'Tired',
    //     ],
    //     typeOfQuestion: 'drag'),
    QuestionModel(4,
        images: [
          'lib/assets/for_activity/butterfly.png',
          'lib/assets/for_activity/pieceofcake.png',
          'lib/assets/for_activity/candy.png',
          'lib/assets/for_activity/fire.png',
          'lib/assets/for_activity/sun.png',
          'lib/assets/for_activity/pump-bottle.png',
          'lib/assets/for_activity/soil.png',
          'lib/assets/for_activity/bread.png',
          'lib/assets/for_activity/vegetables.png'
        ],
        title: "What does a tree need to grow?",
        answers: [
          'Butterfly',
          'Cake',
          'Candy',
          'Fire',
          'Sun',
          'Soap',
          'Soil',
          'Bread',
          'Vegetables'
        ],
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
                SizedBox(
                  height: 2,
                ),
                _question.length <= counter
                    ? Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 0, left: 0),
                              child: score >= 2
                                  ? Image(
                                      image: AssetImage("lib/assets/p (2).png"),
                                    )
                                  : Container(
                                      height: MediaQuery.of(context).size.height /5,
                                      width: MediaQuery.of(context).size.width / 5,
                                    )),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: score <= 1
                                    ? Text(
                                        'Oops!',
                                        style: TextStyle(
                                            fontFamily: 'TitanOne',
                                            fontSize: 32,
                                            color: Color(0xFF1ECDDE)),
                                      )
                                    : Text(
                                        "Congratulations",
                                        style: TextStyle(
                                            fontFamily: 'TitanOne',
                                            fontSize: 32,
                                            color: Color(0xFF1ECDDE)),
                                      ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              score <= 1
                                  ? Text(
                                      " Don't worry, You can retry the game",
                                      style: TextStyle(
                                        fontFamily: 'Roboto Condensed',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    )
                                  : Text(
                                      "You have completed the test",
                                      style: TextStyle(
                                        fontFamily: 'Roboto Condensed',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Roboto Condensed',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Your score is: ",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    TextSpan(
                                      text: "$score",
                                      style:
                                          TextStyle(color: Color(0xFF1ECDDE)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 100,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 40, ),
                                    child: score <= 1
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [

                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pushNamed("activity");
                                                  },

                                                  child: Text(
                                                    "Retry Now",
                                                    style: GoogleFonts.aBeeZee(
                                                        color: Color(0xFF1ECDDE)),
                                                  ),
                                                ),

                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pushReplacement(
                                                          CupertinoPageRoute(builder: (ctx)=> const CategoryActivity()));
                                                    },
                                                    child: Text(
                                                      "Exit",
                                                      style: GoogleFonts.aBeeZee(
                                                          color: Color(0xFF1ECDDE)),
                                                    ),
                                                  ),


                                              Image(
                                                image: AssetImage(
                                                    "lib/assets/for_activity/robot (8).png"),
                                                alignment: Alignment.bottomRight,
                                                height: 200,
                                                width: 200,
                                              ),

                                            ],
                                          )
                                        :Row(children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pushReplacement(
                                              CupertinoPageRoute(builder: (ctx)=> const CategoryActivity()));
                                        },
                                        child: Text(
                                          "Exit",
                                          style: GoogleFonts.aBeeZee(
                                              color: Color(0xFF1ECDDE)),
                                        ),
                                      ),
                                      Image(
                                        image: AssetImage(
                                            "lib/assets/for_activity/robot (9).png"),
                                        alignment: Alignment.topRight,
                                        height: 200,
                                        width: 220,
                                      ),
                                    ],)
                                  )
                                ],
                              )

                            ],
                          )
                        ],
                      )
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
