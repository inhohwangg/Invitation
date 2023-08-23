import 'package:flutter/material.dart';
import 'package:flutter_clone_project_tictok/pages/my_page_controller.dart';
import 'package:get/get.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    MyPageController controller = Get.put(MyPageController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    child: Text(
                      'MyProfile 😊',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.08),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width *
                    0.5, // 바깥쪽 원의 크기를 조절합니다.
                height: MediaQuery.of(context).size.height *
                    0.24, // 바깥쪽 원의 크기를 조절합니다.
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.blue,
                    width: 3,
                  ), // 바깥쪽 원의 border입니다.
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2023/05/05/21/00/cute-7973191_1280.jpg',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
