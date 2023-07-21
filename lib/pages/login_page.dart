import 'package:flutter/material.dart';
import 'package:flutter_clone_project_tictok/controller/register_controller.dart';
import 'package:flutter_clone_project_tictok/pages/register_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userId = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.put(RegisterController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Lottie.asset('assets/image/login_page_image.json'),
              // id
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                    label: Text(
                      '아이디',
                      style: GoogleFonts.jua(color: Colors.amber[600]),
                    ),
                    prefixIcon: Icon(Icons.mail),
                    prefixIconColor: Colors.amber[600],
                    fillColor: Colors.amber[100],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  controller: userId,
                ),
              ),
              //password
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  cursorColor: Colors.amber,
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    label: Text(
                      '비밀번호',
                      style: GoogleFonts.jua(
                        color: Colors.amber[600],
                      ),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    prefixIconColor: Colors.amber[600],
                    fillColor: Colors.amber[100],
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  controller.login(userId.text, password.text);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber[400],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 150,
                  height: 50,
                  child: Center(
                    child: Text(
                      '로그인',
                      style: GoogleFonts.jua(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '처음이신가요?',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(RegisterPage());
                      // Get.to(MainPage(),
                      //     arguments: [userId.text, password.text]);
                    },
                    child: Text(
                      '회원가입',
                      style: GoogleFonts.jua(color: Colors.amber),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
