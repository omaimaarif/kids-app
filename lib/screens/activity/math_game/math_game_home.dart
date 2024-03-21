import 'dart:math';
import 'package:another_final_kids_app/screens/activity/math_game/util/my_button.dart';
import 'package:another_final_kids_app/screens/activity/math_game/util/result_message.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class MathGame extends StatefulWidget {
  const MathGame({Key? key}) : super(key: key);

  @override
  State<MathGame> createState() => _MathGameState();
}

class _MathGameState extends State<MathGame> {
  // number pad list
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    ' ',
    '0',
    'Retry',

  ];

  // create random numbers
  var randomNumber = Random();

  // GO TO NEXT QUESTION
  void goToNextQuestion() {
    // dismiss alert dialog
    Navigator.of(context).pop();

    // reset values
    setState(() {
      userAnswer = '';
    });

    // create a new question
    numberA = randomNumber.nextInt(10);
    numberB = randomNumber.nextInt(10);
  }
  // number A, number B
  int numberA = 1;
  int numberB = 1;

  // user answer
  String userAnswer = '';

  // user tapped a button
  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        // calculate if user is correct or incorrect
        checkResult();
      } else if (button == 'C') {
        // clear the input
        userAnswer = '';
      }else if (button == 'Retry') {

        numberA = randomNumber.nextInt(10);
        numberB = randomNumber.nextInt(10);
        userAnswer = '';
      }
      else if (button == 'DEL') {
        // delete the last number
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 3) {
        // maximum of 3 numbers can be inputted
        userAnswer += button;
      }
    });
  }

  // check if user is correct or not
  void checkResult() {
    if (numberA + numberB == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            if(userAnswer!=" "){
              userAnswer = '';
            }
            return ResultMessage(
              message: "error, please try again",
              onTap: goBackToQuestion,
              icon: Icons.rotate_left,
            );
          });
    }
  }


  // GO BACK TO QUESTION
  void goBackToQuestion() {
    // dismiss alert dialog
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFF120A14),

      body: Column(
        children: [
          // level progress, player needs 5 correct answers in a row to proceed to next level
          SafeArea(
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/for_activity/mathBack.png'),
                  fit: BoxFit.cover,
                ),
              ),
              // child: Image(image: AssetImage("lib/assets/for_activity/mathBack.png"),),
            ),
          ),
          SizedBox(height: 20,),

          // question
          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // question
                    Text(
                      numberA.toString() + ' + ' + numberB.toString() + ' = ',
                        style:GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.white,
                        )
                    ),

                    // answer box
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF1A2933),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          userAnswer,
                           style:GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
    fontSize: 32,
    color: Colors.white,
    )
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),

          // number pad
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: numberPad.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return Button_for_math_game(
                    child: numberPad[index],
                    onTap: () => buttonTapped(numberPad[index]),
                  );
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}
