import 'package:flutter/material.dart';
import 'package:flutter_clone_project_tictok/controller/register_controller.dart';
import 'package:flutter_clone_project_tictok/pages/login_page.dart';
import 'package:flutter_clone_project_tictok/pages/register_success_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController registerUserId = TextEditingController();
  TextEditingController registerName = TextEditingController();
  TextEditingController registerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.put(RegisterController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/image/register_page_image.json',
                  height: 400),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                    label: Text(
                      '이름',
                      style: GoogleFonts.jua(color: Colors.amber[600]),
                    ),
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: Colors.amber[600],
                    fillColor: Colors.amber[100],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  controller: registerName,
                ),
              ),
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
                  controller: registerUserId,
                ),
              ),
              //password
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  cursorColor: Colors.amber,
                  obscureText: true,
                  controller: registerPassword,
                  decoration: InputDecoration(
                    label: Text(
                      '비밀번호',
                      style: GoogleFonts.jua(color: Colors.amber[600]),
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
              // ElevatedButton(
              //   onPressed: () {
              //     controller.register(
              //       registerName.text,
              //       registerUserId.text,
              //       registerPassword.text,
              //     );
              //     Get.to(() => RegisterSuccessPage());
              //   },
              //   child: SizedBox(
              //     width: 150,
              //     height: 50,
              //     child: Center(
              //       child: Text(
              //         '회원가입',
              //       ),
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  controller.register(
                    registerName.text,
                    registerUserId.text,
                    registerPassword.text,
                  );
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
                      '회원가입',
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
                      Get.to(LoginPage());
                    },
                    child: Text(
                      '로그인',
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
