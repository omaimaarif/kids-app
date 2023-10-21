
import 'package:another_final_kids_app/screens/activity/question_model.dart';
import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';

class DragDrop extends StatefulWidget {
  DragDrop({super.key, required this.questionModel,required this.next});
  QuestionModel questionModel;
  Function(bool) next;

  @override
  State<DragDrop> createState() => _DragDropState();
}

class _DragDropState extends State<DragDrop> {
  List<Map<String,dynamic>> ques = [];
  List<Map<String,dynamic>> answer = [];
  List <String> randomAnswer =[];

  int check =0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ques= List.generate(widget.questionModel.answers.length, (index) => {'image':widget.questionModel.images[index],'text':widget.questionModel.answers[index]});
    answer= List.generate(widget.questionModel.answers.length, (index) => {'image':'','text':''});
    randomAnswer = widget.questionModel.answers;
    randomAnswer.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.questionModel.title,style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20,color: Colors.blueGrey
        ),),
        Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: List.generate(
              widget.questionModel.answers.length,
                  (index) => buildTarget(
                context,
                text: widget.questionModel.answers[index],
                object: answer[index],
                onAccept: (data) => setState(() {
                  if(answer.contains(data)){
                    answer[answer.indexOf(data)]={'image':'','text':''};
                  }else{
                    ques[ques.indexOf(data)]={'image':'','text':''};
                  }
                  answer[index]=data;
                  check++;
                }),

              )),
        ),
        SizedBox(height: 10,),
        Divider(
          thickness: 1, // thickness of the line
          indent: 20, // empty space to the leading edge of divider.
          endIndent: 20, // empty space to the trailing edge of the divider.
          color: Colors.blueGrey, // The color to use when painting the line.
          height: 10,
        ),
        SizedBox(height: 20,),
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
                  if(ques.contains(data)){
                    ques[ques.indexOf(data)]={'image':'','text':''};
                  }else{
                    answer[answer.indexOf(data)]={'image':'','text':''};
                  }
                  ques[index]=data;
                  check--;
                }),
              )),
        ),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: (){
          bool c=true;
          if(check == widget.questionModel.answers.length){
            for(int i =0;i<widget.questionModel.answers.length;i++){
              if(answer[i]['text']!=randomAnswer[i]){
                c=false;
                break;
              }
            }
          }else{
            return;
          }
          widget.next(c);
        }, child: Text("next".toUpperCase()),
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
        color:object['image']==''?Colors.black26: Colors.transparent,
        offset:   Offset(2, 2),
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
                object['image']!=''?
                Draggable<Map<String, dynamic>>(
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
                ):
                SizedBox( height: 150,
                  width: 150,),

                  SizedBox(height: 40,),

                  IgnorePointer(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 70, left: 20, right: 10,),
                            child: Container(
                              child: Text(
                                text,
                                style: TextStyle(
                                    color:object['image']==''?Colors.grey: Colors.transparent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            ),
                          ),
                        ))

              ],
            ),
            onWillAccept: (data) {return object['image']==''? true :false;},
            onAccept: (data) {
              onAccept(data);
            },
          ),
        ),
      );
}
