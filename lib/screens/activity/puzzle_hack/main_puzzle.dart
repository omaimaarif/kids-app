import 'dart:async';
import 'package:another_final_kids_app/screens/activity/puzzle_hack/screens/puzzle_page.dart';
import 'package:another_final_kids_app/screens/activity/puzzle_hack/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class App extends StatefulWidget {
  const App({
    Key? key,
    required this.appTheme,
  }) : super(key: key);

  final AppTheme appTheme;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(milliseconds: 20), () {
      for (var i = 1; i <= 15; i++) {
        precacheImage(
          Image.asset('lib/assets/images/$i.png').image,
          context,
        );
      }
      precacheImage(
        Image.asset('lib/assets/images/ball.png').image,
        context,
      );
      precacheImage(
        Image.asset('lib/assets/images/box.png').image,
        context,
      );
      precacheImage(
        Image.asset('lib/assets/images/deco_1.png').image,
        context,
      );
      precacheImage(
        Image.asset('lib/assets/images/deco_2.png').image,
        context,
      );
      precacheImage(
        Image.asset('lib/assets/images/deco_3.png').image,
        context,
      );
      precacheImage(
        Image.asset('lib/assets/images/dribble.png').image,
        context,
      );
      precacheImage(
        Image.asset('lib/assets/images/github.png').image,
        context,
      );
      precacheImage(
        Image.asset('lib/assets/images/title.png').image,
        context,
      );
      precacheImage(
        Image.asset('lib/assets/images/twitter.png').image,
        context,
      );
      precacheImage(
        Image.asset('lib/assets/images/youtube.png').image,
        context,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: widget.appTheme.darkTheme,
        home:  PuzzlePage(),

    );
  }
}
