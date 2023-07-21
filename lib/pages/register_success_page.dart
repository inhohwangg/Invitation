import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_project_tictok/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RegisterSuccessPage extends StatefulWidget {
  const RegisterSuccessPage({super.key});

  @override
  State<RegisterSuccessPage> createState() => _RegisterSuccessPageState();
}

class _RegisterSuccessPageState extends State<RegisterSuccessPage> {
  final Duration initialDelay = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset('assets/image/register_success_image.json'),
          ),
          DelayedDisplay(
            child: Text(
              '가입을 축하드립니다!',
              style: GoogleFonts.doHyeon(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          DelayedDisplay(
            delay: Duration(seconds: initialDelay.inSeconds + 1),
            child: GestureDetector(
              onTap: () {
                Get.to(LoginPage());
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
    );
  }
}
