import 'package:flutter/material.dart';
import 'package:flutter_clone_project_tictok/controller/main_page_controller.dart';
import 'package:get/get.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    MainPageController controller = Get.put(MainPageController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Upload Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 120,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              color: Colors.red[200],
                              width: 60,
                              height: 60,
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              color: Colors.blue[200],
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              );
            },
            child: Text(
              '파일 업로드',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.videoCreate();
            },
            child: Text(
              '이미지 테스트',
            ),
          ),
        ],
      ),
    );
  }
}
