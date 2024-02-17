import 'package:another_final_kids_app/screens/activity/sorting_drag_select/question_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Text(
            widget.questionModel.title,
            style: GoogleFonts.courgette(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.blueGrey
            )

          ),
          SizedBox(height: 60),
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
          SizedBox(height: 90),
          ElevatedButton(
            onPressed: () {
              if (select == -1) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Container(
                      padding: EdgeInsets.all(16),
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFFBE5C56),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Attention!",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Complete the following task first",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ));
              }
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
            child: Text(
              "Next".toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
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
