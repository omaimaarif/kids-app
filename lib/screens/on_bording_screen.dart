import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../conistants/data.dart';
import 'login_screen/login_screen.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  int currentIndex = 0;
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    pageController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EDEE),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Skip",
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0,
                          color: Color(0xFF688382),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: pageController,
                itemCount: contents.length,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          contents[index].image,
                          height: 300,
                          width: 300,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          contents[index].title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.courgette(
                              fontSize: 30.0,
                              color: Color(0xFF6CA3AC),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          contents[index].discription,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.aBeeZee(
                            fontSize: 16,
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (currentIndex == contents.length - 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      } else {
                        pageController!.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: const Color(0xFF599099),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      child: Text(
                          currentIndex == contents.length - 1
                              ? "Get Started"
                              : "Next",
                          style: GoogleFonts.aBeeZee(
                              color: Colors.white,fontWeight: FontWeight.bold

                          )),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (index) => Dot(index, context),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer Dot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: 6,
      width: currentIndex == index ? 24 : 6,
      margin: EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Color(0xFFFFFFFF) : Colors.black26,
      ),
    );
  }
}
