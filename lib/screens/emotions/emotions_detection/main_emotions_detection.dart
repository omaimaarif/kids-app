// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EDEE),
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
                      child: Text("Pick a Image of a Person Face"),
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
                        icon: Icon(Icons.camera_alt_rounded),
                        label: Text("Camera"),
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
                        label: Text("Gallary"),
                        icon: Icon(Icons.image_rounded),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    facesmiling,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
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

        if (smileprob != null && smileprob < 0.25) {
          facesmiling = "You look sad 😢";
          player.play(AssetSource('audio/You look sad.mp3'));
        }

        if (smileprob != null && smileprob >= 0.25 && smileprob < 0.45) {
          facesmiling = "You don't look fine 😔";
          player.play(AssetSource("audio/You don't look fine.mp3"));
        }

        if (smileprob != null && smileprob >= 0.45 && smileprob < 0.65) {
          facesmiling = "You look good, but I'd love to see a bigger smile on your face 😐";
        }  player.play(AssetSource('audio/bigger smile on your face.mp3'));

        if (smileprob != null && smileprob >= 0.65 && smileprob < 0.75) {
          facesmiling = "You're smiling now! You look very beautiful 🙂";
          player.play(AssetSource('audio/Youre smiling now.mp3'));
        }
        if (smileprob != null && smileprob >= 0.75) {
          facesmiling = "You are so happy 😀";
          player.play(AssetSource('audio/you are so happy.mp3'));
        }

      }
    }
    faceDetector.close();
    faceDetectorChecking = false;
    setState(() {});
  }


}
