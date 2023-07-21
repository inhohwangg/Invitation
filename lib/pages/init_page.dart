import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_project_tictok/pages/initial_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class InitPage extends StatelessWidget {
  final Duration initialDelay = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DelayedDisplay(
                  delay: initialDelay,
                  child: Text(
                    "환영합니다.",
                    style:
                        GoogleFonts.doHyeon(color: Colors.black, fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DelayedDisplay(
                  delay: Duration(seconds: initialDelay.inSeconds + 1),
                  child: Text(
                    "쉽고 빠르게 멋진 청첩장을 만들어보세요",
                    style: GoogleFonts.doHyeon(
                      color: Colors.black,
                      fontSize: 23,
                    ),
                  ),
                ),
                DelayedDisplay(
                  delay: Duration(seconds: initialDelay.inSeconds + 2),
                  child: Lottie.asset('assets/image/init_image2.json'),
                ),
                // SizedBox(
                //   height: 30,
                // ),
                DelayedDisplay(
                  delay: Duration(seconds: initialDelay.inSeconds + 3),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(InitialPage());
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.amber[300],
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          "Start",
                          style: GoogleFonts.satisfy(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
