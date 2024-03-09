import 'package:another_final_kids_app/screens/activity/memory_game/pages/error_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../../../main.dart';
import '../models/word.dart';
import 'game_page.dart';

class Main_of_memory_game extends StatefulWidget {
  const Main_of_memory_game({super.key});

  @override
  State<Main_of_memory_game> createState() => _Main_of_memory_gameState();
}
class _Main_of_memory_gameState extends State<Main_of_memory_game> {

  Future<int> populateSourceWords() async {
    final ref = FirebaseStorage.instance.ref();
    final all = await ref.listAll();

    for (var item in all.items) {
      sourceWords.add(Word(
          text: item.name.substring(0, item.name.indexOf('.')),
          url: await item.getDownloadURL(),
          displayText: false));
    }

    return 1;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      future: populateSourceWords(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorPage();
        }
        if (snapshot.hasData) {
          print('sucsses! source word length ${sourceWords.length}');
          return const GamePage();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }}