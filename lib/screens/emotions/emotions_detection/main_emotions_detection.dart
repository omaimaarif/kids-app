// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';
import 'package:another_final_kids_app/buttons/my_buttons_homepage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class EmotionFaceDetector extends StatefulWidget {
  const EmotionFaceDetector({Key? key}) : super(key: key);



  @override
  State<EmotionFaceDetector> createState() => _EmotionFaceDetectorState();
}

class _EmotionFaceDetectorState extends State<EmotionFaceDetector> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMKey =
  GlobalKey<ScaffoldMessengerState>();
  bool faceDetectorChecking = false;
  XFile? imageFile;
  String facesmiling = "";
  String headRotation = "";
final player=AudioPlayer();
bool happy=false, sad=false,   good=false, smile=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEEBF3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              if (faceDetectorChecking)
                const CircularProgressIndicator.adaptive(),
              if (!faceDetectorChecking && imageFile == null)
                Container(

                    width: 300,
                    height: 300,
                    color: Colors.white,
                    child: Center(
                      child: Text("Pick a Image of a Person Face", style: TextStyle(
                        fontSize: 19,
                        color: Colors.grey
                      ),),
                    )),
              if (imageFile != null && !faceDetectorChecking)
                Image.file(
                  File(imageFile!.path),
                  width: 350,
                  height: 450,
                  fit: BoxFit.contain,
                ),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton.icon(

                        onPressed: () {
                          onPickBtnImgSelected(btnName: 'Camera');
                        },
                        icon: Icon(Icons.camera_alt_rounded, color: Colors.blueGrey),
                        label: Text("Camera", style: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          onPickBtnImgSelected(btnName: 'Gallary');
                        },
                        label: Text("Gallary", style: TextStyle(color: Colors.grey),),
                        icon: Icon(Icons.image_rounded, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: Colors.white30),


                  child: Center(
                    child: Text(

                      facesmiling,
                      style: GoogleFonts.aBeeZee(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                  
                  
                ),
              ),
             SizedBox(height: 20,),
             facesmiling==""? Container(
               height: 2,
               width: 2,
             ):Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 30),
                   child: ElevatedButton(onPressed: (){
                    showDialog(context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Colors.white70,
                          elevation: 0,

                          content: Row(children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                happy==true?
                                  Column(
                                    children: [
                                      Text("Happiness",   style: TextStyle(
                                          color: Colors.black87, fontSize: 20),),
                                      Text(
                                        "Happy comes when you win\na competition or achieve\na challenging goal\n\n It can also be found in\nmoments of play and fun\nwith friends and family",
                                        style: TextStyle(
                                            color: Colors.black87, fontSize: 17),),

                                    ],
                                  ):sad==true?
                               Column(


                                 children: [
                                 Text("Sadness comes when\nyou lose something\nimportant to you\nlike losing\nsomeone you love or\nlosing something\nyou cherish",
                                   style: TextStyle(color: Colors.black54,fontSize: 17),)
                               ]):good==true?Text("A smile is not the only\nway to express happiness\nfor example,"
                                    " you can\nbe fine but busy with\na game or a specific "
                                    "food\nand when you get it\nyou will be even\nhappier and smile",  style: TextStyle(
                                    color: Colors.black87, fontSize: 17)):smile==true?
                                Text("A smile is a expression\nthat appears on our faces\nwhen we are happy\nor joyful.\nIt shows that you\nare a happy person right\nnow\nand it also makes us\nlook more beautiful\nI love to smile, and you?",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 17)):
                                    Text("No"),


                             Row(


                               children: [

                                if(happy==true)
                                IconButton(onPressed: (){
                                  player.play(AssetSource('audio/abouthappy.mp3'));
                                },
                                    icon: Icon(Icons.play_arrow)),


                                 if(sad==true)
                                   IconButton(onPressed: (){
                                     player.play(AssetSource('audio/aboutSad.mp3'));
                                   },
                                       icon: Icon(Icons.play_arrow)),

                                 if(good==true)
                                   IconButton(onPressed: (){
                                     player.play(AssetSource('audio/aboutgood.mp3'));
                                   },
                                       icon: Icon(Icons.play_arrow)),

                                 if(smile==true)
                                   IconButton(onPressed: (){
                                     player.play(AssetSource('audio/aboutsmile.mp3'));
                                   },
                                       icon: Icon(Icons.play_arrow)),



                                 SizedBox(width: 40,),
                                 if(happy==true)
                                   Image(image: AssetImage("lib/assets/happy.png"), height: 150,),

                                 if(sad==true)
                                   Image(image: AssetImage("lib/assets/mood-boredom.png"), height: 150,),

                                 if(good==true)
                                   Image(image: AssetImage("lib/assets/mood-guilt.png"), height: 150,),

                                 if(smile==true)
                                   Image(image: AssetImage("lib/assets/lovemood.png"), height: 150,),

                               ],
                             )




                            ],)

                          ],),
                        ));

                   }, child: Text("...",
                     style:GoogleFonts.aBeeZee(
                       fontSize: 50,
                       color: Colors.grey
                     ), )),
                 ),
                 SizedBox(width: 30,),

    sad==true?Image(image: AssetImage("lib/assets/mood-boredom.png"),height: 110):
    happy==true? Image(image: AssetImage("lib/assets/happy.png"), height: 150,):
    good==true? Image(image: AssetImage("lib/assets/mood-guilt.png"), height: 150,):
        smile==true?Image(image: AssetImage("lib/assets/lovemood.png"), height: 150,):
        Container(height: 1, width: 1,)



               ],
             )



            ],
          ),
        ),
      ),
    );
  }

  void onPickBtnImgSelected({required String btnName}) async {
    ImageSource imageSource;
    if (btnName == "Camera") {
      imageSource = ImageSource.camera;
    } else {
      imageSource = ImageSource.gallery;
    }
    final scaffoldstate = _scaffoldMKey.currentState;
    try {
      XFile? file = await ImagePicker().pickImage(source: imageSource);
      if (file != null) {
        faceDetectorChecking = true;
        imageFile = file;
        setState(() {});
        getImageFacedetections(file);
      }
    } catch (e) {
      faceDetectorChecking = false;
      imageFile = null;
      facesmiling = "Error Occured while getting image";
      scaffoldstate?.showSnackBar(SnackBar(
        content: Text(e.toString()),
        duration: const Duration(seconds: 4),
      ));
      setState(() {});
    }
  }

  void getImageFacedetections(XFile source) async {
    final faceDetector = GoogleMlKit.vision.faceDetector(FaceDetectorOptions(
        enableClassification: true,
        enableLandmarks: true,
        enableContours: true,
        enableTracking: true));
    final InputImage inputImage = InputImage.fromFilePath(source.path);

    final List<Face> faces = await faceDetector.processImage(inputImage);
    double? smileprob = 0.0;

    // extract faces
    for (Face face in faces) {
      if (face.smilingProbability != null) {
        smileprob = face.smilingProbability;

        if (smileprob != null && smileprob < 0.45) {
          facesmiling = "You look sad";
          player.play(AssetSource('audio/You look sad.mp3'));
          sad=true; happy=false;  smile=false; good=false;
        }

         if (smileprob != null && smileprob >= 0.45) {
          facesmiling = "You look good, but I'd love to see a bigger smile on your face";
          player.play(AssetSource('audio/bigger smile on your face.mp3'));
          good=true; happy=false;  sad=false; smile=false;
        }
        if (smileprob != null && smileprob >= 0.75) {
          facesmiling = "You're smiling now\nYou look very beautiful🤍";
          player.play(AssetSource('audio/Youre smiling now.mp3'));
          smile=true;  happy=false; sad=false;    good=false;
        }
         if (smileprob != null && smileprob >= 0.86) {
          facesmiling = "You are so happy ";
          player.play(AssetSource('audio/you are so happy.mp3'));
          happy=true; sad=false;  good=false; smile=false;
        }

      }

    }
    faceDetector.close();
    faceDetectorChecking = false;
    setState(() {});
  }


}
