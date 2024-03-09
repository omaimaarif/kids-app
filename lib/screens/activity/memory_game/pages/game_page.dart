import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../main.dart';
import '../animation/confetti_animation.dart';
import '../components/replay_popup.dart';
import '../components/word_tile.dart';
import '../managers/game_manager.dart';
import '../models/word.dart';
import 'error_page.dart';
import 'loading_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final _futureCachedImages;
  List<Word> _gridWords = [];

  @override
  void initState() {
    _futureCachedImages = _cacheImages();
    _setUp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.10;
    return FutureBuilder(
      future: _futureCachedImages,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorPage();
        }
        if (snapshot.hasData) {
          return Selector<GameManager, bool>(
            selector: (_, gameManager) => gameManager.roundCompleted,
            builder: (_, roundCompleted, __) {
              WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) async {
                  if (roundCompleted) {
                    await showDialog(
                        barrierColor: Colors.transparent,
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => const ReplayPopUp());
                  }
                },
              );

              return Scaffold(
                backgroundColor:Color(0xFF82B3E3) ,
                appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading:  IconButton(onPressed: (){
                      Navigator.of(context).pushNamed("CategoryActivity");
                    },
                      icon:Icon(Icons.arrow_back_ios),color: Colors.white,)
                ),
                body: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'lib/assets/images_of_memorygame/Cloud.png'))),
                    ),
                    SafeArea(
                      child: Center(
                        child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(
                                left: widthPadding, right: widthPadding),
                            itemCount: 6,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    mainAxisExtent: size.height * 0.38),
                            itemBuilder: (context, index) => WordTile(
                                  index: index,
                                  word: _gridWords[index],
                                )),
                      ),
                    ),
                    ConfettiAnimation(animate: roundCompleted)
                  ],
                ),
              );
            },
          );
        } else {
          return const LoadingPage();
        }
      },
    );
  }


  _setUp() {
    sourceWords.shuffle();
    for (int i = 0; i < 3; i++) {
      _gridWords.add(sourceWords[i]);
      _gridWords.add(Word(
          text: sourceWords[i].text,
          url: sourceWords[i].url,
          displayText: true));
    }
    _gridWords.shuffle();
  }

  Future<int> _cacheImages() async {
    for (var w in _gridWords) {
      final image = Image.network(w.url);
      await precacheImage(image.image, context);
    }

    return 1;
  }


}
