import 'package:flutter/material.dart';
import 'package:flutter_clone_project_tictok/controller/invate_post_controller.dart';
import 'package:flutter_clone_project_tictok/pages/example_page.dart';
import 'package:get/get.dart';

import 'first_question_page.dart';
import 'invate_post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InvatePostController controller = Get.put(InvatePostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(
                InvatePostPage(),
                // FirstQuestionPage(),
                transition: Transition.downToUp,
                duration: Duration(
                  milliseconds: 500,
                ),
              );
            },
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[200]),
                child: Center(
                  child: Text(
                    '초대장 만들기',
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(ExamplePage());
            },
            child: Text(
              'Example',
            ),
          ),
        ],
      ),
    );
  }
}
