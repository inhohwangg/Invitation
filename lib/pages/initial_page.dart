import 'package:flutter/material.dart';
import 'package:flutter_clone_project_tictok/pages/login_page.dart';
import 'package:flutter_clone_project_tictok/pages/register_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 30),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15,
                    right: MediaQuery.of(context).size.width * 0.2),
                child: Text(
                  'Welcome to Wedding invitations Create',
                  style: GoogleFonts.jua(
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Lottie.asset('assets/image/wedding_image.json')),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterPage());
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'SIGN UP',
                          style: GoogleFonts.chakraPetch(
                              color: Colors.amber[700], fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(LoginPage());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.065,
                        decoration: BoxDecoration(
                          color: Colors.amber[700],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: GoogleFonts.chakraPetch(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
