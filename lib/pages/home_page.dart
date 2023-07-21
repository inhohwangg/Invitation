import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(PostPage());
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
        ],
      ),
    );
  }
}
