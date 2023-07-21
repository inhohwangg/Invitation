// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_clone_project_tictok/controller/main_page_controller.dart';
import 'package:get/get.dart';

import 'home_page.dart';
import 'profile_page.dart';
import 'upload_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int screenIndex = 0;
  List screensList = [
    HomePage(),
    UploadPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    MainPageController controller = Get.put(MainPageController());
    return Scaffold(
      // body: Center(
      //   child: Text(
      //     'Main Page',
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              screenIndex = index;
            });
            // if (index == 1) {
            //   Get.to(UploadPage());
            // } else if (index == 2) {
            //   Get.to(ProfilePage());
            // }
          },
          currentIndex: screenIndex,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Upload',
              icon: Icon(
                Icons.drive_folder_upload,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(
                Icons.person,
              ),
            ),
          ]),
      body: screensList[screenIndex],
    );
  }
}
