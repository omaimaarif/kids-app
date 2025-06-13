import 'package:another_final_kids_app/screens/activity/sorting_drag_select/question_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';

class DragDrop extends StatefulWidget {
  DragDrop({super.key, required this.questionModel, required this.next});
  QuestionModel questionModel;
  Function(bool) next;

  @override
  State<DragDrop> createState() => _DragDropState();
}

class _DragDropState extends State<DragDrop> {
  List<Map<String, dynamic>> ques = [];
  List<Map<String, dynamic>> answer = [];
  List<String> randomAnswer = [];

  int check = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ques = List.generate(
        widget.questionModel.answers.length,
        (index) => {
              'image': widget.questionModel.images[index],
              'text': widget.questionModel.answers[index]
            });
    answer = List.generate(widget.questionModel.answers.length,
        (index) => {'image': '', 'text': ''});
    randomAnswer = [...widget.questionModel.answers];
    randomAnswer.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          widget.questionModel.title,
          style: GoogleFonts.courgette(
              fontWeight: FontWeight.w500,
              fontSize: 19,
              color: Colors.blueGrey)
        ),
        SizedBox(
          height: 20,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: List.generate(
              widget.questionModel.answers.length,
              (index) => buildTarget(
                    context,
                    text: randomAnswer[index],
                    object: answer[index],
                    onAccept: (data) => setState(() {
                      if (answer.contains(data)) {
                        answer[answer.indexOf(data)] = {
                          'image': '',
                          'text': ''
                        };
                      } else {
                        ques[ques.indexOf(data)] = {'image': '', 'text': ''};
                      }
                      answer[index] = data;
                      check++;
                    }),
                  )),
        ),
        const SizedBox(
          height: 20,
        ),
        Divider(
          thickness: 1, // thickness of the line
          indent: 20, // empty space to the leading edge of divider.
          endIndent: 20, // empty space to the trailing edge of the divider.
          color: Colors.blueGrey, // The color to use when painting the line.
          height: 10,
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: List.generate(
              widget.questionModel.answers.length,
              (index) => buildTarget(
                    context,
                    text: '',
                    object: ques[index],
                    onAccept: (data) => setState(() {
                      if (ques.contains(data)) {
                        ques[ques.indexOf(data)] = {'image': '', 'text': ''};
                      } else {
                        answer[answer.indexOf(data)] = {
                          'image': '',
                          'text': ''
                        };
                      }
                      ques[index] = data;
                      check--;
                    }),
                  )),
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: () {

            bool c = true;
            if(check==0){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
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
                            Text("Attention!",style: TextStyle(
                                fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),),
                            Text("Complete the following task first",style: TextStyle(
                                fontSize: 15, color: Colors.white),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,),
                          ],
                        )),
                    behavior:SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    elevation: 0,

                  )
              ); return;
            }
            else if (check == widget.questionModel.answers.length) {
              for (int i = 0; i < widget.questionModel.answers.length; i++) {
                if (answer[i]['text'] != randomAnswer[i]) {
                  c = false;
                  break;
                }
              }
            } else {
              return;

            }
            widget.next(c);
          },
          child: Text(
            "next".toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            primary: const Color(0xDF5D7A7C),
          ),
        )
      ],
    );
  }

  Widget buildTarget(
    BuildContext context, {
    required String text,
    required Map<String, dynamic> object,
    required DragTargetAccept<Map<String, dynamic>> onAccept,
  }) =>
      InnerShadow(
        blur: 1,
        color: object['image'] == '' ? Colors.black26 : Colors.transparent,
        offset: Offset(2, 2),
        child: Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: DragTarget<Map<String, dynamic>>(
            builder: (context, candidateData, rejectedData) => Stack(
              children: [
                object['image'] != ''
                    ? Draggable<Map<String, dynamic>>(
                        data: object,
                        feedback: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white,
                          ),
                          child: Image.asset(object['image']),
                        ),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white,
                          ),
                          child: Image.asset(object['image']),
                        ),
                        childWhenDragging: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white,
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 150,
                        width: 150,
                      ),
                SizedBox(
                  height: 20,
                ),
                IgnorePointer(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 60,
                    ),
                    child: Container(
                      child: Text(
                        text,
                        style: TextStyle(
                            color: object['image'] == ''
                                ? Colors.grey
                                : Colors.transparent,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ))
              ],
            ),
            onWillAccept: (data) {
              return object['image'] == '' ? true : false;
            },
            onAccept: (data) {
              onAccept(data);
            },
          ),
        ),
      );
}
