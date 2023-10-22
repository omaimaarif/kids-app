import 'package:another_final_kids_app/screens/activity/question_model.dart';
import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  const Select({Key? key, required this.questionModel, required this.next})
      : super(key: key);

  final QuestionModel questionModel;
  final Function(bool) next;

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {


  int select = -1;
  @override


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.questionModel.title,style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25,color: Colors.blueGrey
          ),),
          SizedBox(height: 40),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            childAspectRatio: 1,
            children: List.generate(
              widget.questionModel.answers.length,
                  (index) => InkWell(
                onTap: () {
                  setState(() {
                    select = index;
                  });
                },
                child: Container(
                  height: 60,
                 width: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        widget.questionModel.images[index],
                        width: 100,
                        height: 100,
                      ),
                      Text(
                        widget.questionModel.answers[index],
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              bool c = true;
              if (select != -1) {
                if (widget.questionModel.numOfTrueAnswer != select) {
                  c = false;
                }
              } else {
                return;
              }
              widget.next(c);
            },
            child: Text("Next".toUpperCase()),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              primary: const Color(0xDF5D7A7C),
            ),
          ),
        ],
      ),
    );
  }
}