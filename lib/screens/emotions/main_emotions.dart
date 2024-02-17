import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmotionsPage extends StatefulWidget {
  const EmotionsPage({super.key});

  @override
  State<EmotionsPage> createState() => _EmotionsPageState();
}

class _EmotionsPageState extends State<EmotionsPage> {
  String feel = "0";
  double _value = 0.0;
  double lastsection = 0.0;
  String feedbacktxt = "Very Poor";
  Color backgroundclr = Color(0xFF8CB9BD);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundclr,
        body: Stack(
          children: <Widget>[
            Center(
              child: FlareActor(
                'lib/assets/feelings.flr',
                fit: BoxFit.contain,
                alignment: Alignment.center,
                animation: feel,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: Text(feedbacktxt,
                      style: GoogleFonts.courgette(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                Slider(
                  label: 'Move',
                  min: 0.0,
                  max: 100.0,
                  value: _value,
                  divisions: 100,
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                  onChanged: (val) {
                    setState(() {
                      _value = val;
                    });
                    if (_value == 0.0) {
                      if (lastsection > 0.0) {
                        setState(() {
                          feel = "0-";
                        });
                      }
                      setState(() {
                        lastsection = 0.0;
                        backgroundclr = Color(0xFF8CB9BD);
                        feedbacktxt = "Very Poor";
                      });
                    }
                    if (_value > 0.0 && _value < 25.0) {
                      if (lastsection == 0.0) {
                        setState(() {
                          feel = "0+";
                        });
                      } else if (lastsection == 50.0) {
                        setState(() {
                          feel = "25-";
                        });
                      }
                      setState(() {
                        lastsection = 25.0;
                        backgroundclr = Colors.yellow;
                        feedbacktxt = "Poor";
                      });
                    } else if (_value >= 25.0 && _value < 50.0) {
                      if (lastsection == 25.0) {
                        setState(() {
                          feel = "25+";
                        });
                      } else if (lastsection == 75.0) {
                        setState(() {
                          feel = "50-";
                        });
                      }
                      setState(() {
                        lastsection = 50.0;
                        backgroundclr = Color(0xFFFFB534);
                        feedbacktxt = "Below Average";
                      });
                    } else if (_value >= 50.0 && _value < 75.0) {
                      if (lastsection == 50.0) {
                        setState(() {
                          feel = "50+";
                        });
                      } else if (lastsection == 100.0) {
                        setState(() {
                          feel = "75-";
                        });
                      }
                      setState(() {
                        lastsection = 75.0;
                        backgroundclr = Color(0xFFC1F2B0);
                        feedbacktxt = "Above Average";
                      });
                    } else if (_value >= 75.0 && _value <= 100.0) {
                      if (lastsection == 75.0) {
                        setState(() {
                          feel = "75+";
                        });
                      }
                      setState(() {
                        lastsection = 100.0;
                        backgroundclr = Color(0xFF65B741);
                        feedbacktxt = "Excellent";

                        if (lastsection == 100.0) {
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //   content: Container(
                          //       padding: EdgeInsets.all(16),
                          //       height: 80,
                          //       decoration: BoxDecoration(
                          //         borderRadius:
                          //             BorderRadius.all(Radius.circular(20)),
                          //         color: Color(0xFFBE5C56),
                          //       ),
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text(
                          //             "Attention!",
                          //             style: TextStyle(
                          //                 fontSize: 18,
                          //                 color: Colors.white,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //           Text(
                          //             "Complete the following task first",
                          //             style: TextStyle(
                          //                 fontSize: 15, color: Colors.white),
                          //             maxLines: 2,
                          //             overflow: TextOverflow.ellipsis,
                          //           ),
                          //         ],
                          //       )),
                          //   behavior: SnackBarBehavior.floating,
                          //   backgroundColor: Colors.transparent,
                          //   elevation: 0,
                          // ));
                        }
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
